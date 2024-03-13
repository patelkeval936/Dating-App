import 'dart:io';

import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pausable_timer/pausable_timer.dart';
import 'package:record/record.dart';

part 'recorder_event.dart';
part 'recorder_state.dart';


class RecorderBloc extends Bloc<RecorderEvent, RecorderState> {
  AudioPlayer audioPlayer = AudioPlayer();
  final AudioRecorder audioRecorder;
  final double _minVolume = -60;
  final int _duration = 250;
  List<int> waveformValues = [];
  Directory? dir;
  String? recordingFilePath;
  int currentlyPlayedSeconds = 0;
  int totalRecordedSeconds = 0;
  PausableTimer? timer;

  double volume0to(double percent) {
    return (percent * 100).round().abs().toDouble();
  }

  RecorderBloc(this.audioRecorder)
      : super(const RecorderInitial([], 0, false, false, 0)) {
    on<RecordingStart>((event, emit) async {
      waveformValues = [];
      if (await audioRecorder.hasPermission()) {
        dir = await getApplicationCacheDirectory();
        await audioRecorder.start(const RecordConfig(),
            path: '${dir?.path}/myFile.m4a');

        timer = PausableTimer.periodic(const Duration(seconds: 10000), () {});

        timer?.start();

        await emit.onEach(
          audioRecorder.onAmplitudeChanged(Duration(milliseconds: _duration)),
          onData: (data) {
            return add(RecordingInProgress(data.current));
          },
        );
      }
    });

    on<RecordingInProgress>((event, emit) {
      double currentVolume = event.amplitude;
      int value =
          (((currentVolume - _minVolume) / _minVolume) * 100).round().abs();
      waveformValues = List.from(waveformValues);
      waveformValues.add(value);

      totalRecordedSeconds = timer?.elapsed.inSeconds ?? 0;

      emit(RecorderInProgress(
          waveformValues, totalRecordedSeconds, true, false, 0));
    });

    on<RecordingStop>((event, emit) async {
      recordingFilePath = await audioRecorder.stop();
      waveformValues = List.from(waveformValues);
      timer?.pause();
      totalRecordedSeconds = timer?.elapsed.inSeconds ?? 0;

      timer?.reset();

      emit(RecorderCompleted(
          waveformValues, totalRecordedSeconds, false, false, 0));
    });

    on<RecordingPlay>((event, emit) async {
      add(RecordingPlayProgress());

      audioPlayer.onPositionChanged.listen((data) {
        int time = data.inMilliseconds;

        if (time != 0 &&
            time <= totalRecordedSeconds * 1000 &&
            (state.runtimeType.toString() == 'RecorderPlaying' ||
                state.runtimeType.toString() == 'RecorderResumePlaying')) {
          currentlyPlayedSeconds = time;
          add(RecordingPlayProgress());
        }
      });

      audioPlayer.onPlayerStateChanged.listen((event) {
        if (event.name == 'completed') {
          add(RecordingCompletePlay());
        }
      });

      if (recordingFilePath != null) {
        if (Platform.isAndroid) {
          await audioPlayer.play(UrlSource(recordingFilePath!));
        } else {
          await audioPlayer.play(DeviceFileSource(recordingFilePath!));
        }
      }
    });

    on<RecordingPlayProgress>((event, emit) async {
      emit(RecorderPlaying(waveformValues, totalRecordedSeconds, false, true,
          currentlyPlayedSeconds));
    });

    on<RecordingPausePlay>((event, emit) async {
      await audioPlayer.pause();

      audioPlayer.onPositionChanged.listen((data) {
        currentlyPlayedSeconds = data.inMilliseconds;
      });

      emit(RecorderPausedPlaying(waveformValues, totalRecordedSeconds, false,
          false, currentlyPlayedSeconds));
    });

    on<RecordingResumePlay>((event, emit) async {
      await audioPlayer.resume();

      emit(RecorderResumePlaying(waveformValues, totalRecordedSeconds, false,
          true, currentlyPlayedSeconds));
    });

    on<RecordingSubmit>((event, emit) async {
      timer?.reset();
      audioPlayer.stop();
      emit(const RecorderInitial([], 0, false, false, 0));
    });

    on<RecordingCompletePlay>((event, emit) async {
      waveformValues = List.from(waveformValues);
      timer?.pause();
      currentlyPlayedSeconds = timer?.elapsed.inSeconds ?? 0;

      emit(RecorderCompletedPlaying(waveformValues, totalRecordedSeconds, false,
          false, currentlyPlayedSeconds));
    });

    on<RecordingDelete>((event, emit) async {
      timer?.reset();
      audioPlayer.stop();
      emit(const RecorderInitial([], 0, false, false, 0));
    });
  }
}
