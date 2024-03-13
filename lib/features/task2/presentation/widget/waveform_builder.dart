import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/core/extensions/build_context_extensions.dart';
import '../../../../utils/app_colors.dart';
import '../recorder_bloc/recorder_bloc.dart';

class WaveFormBuilder extends StatefulWidget {
  const WaveFormBuilder({
    super.key,
    required this.controller,
    required this.state,
  });

  final ScrollController controller;
  final RecorderState state;

  @override
  State<WaveFormBuilder> createState() => _WaveFormBuilderState();
}

class _WaveFormBuilderState extends State<WaveFormBuilder> {
  int volume0to(double percent) {
    return (percent * 100).round().abs();
  }

  List waveforms = [];
  bool isPlaying = false;
  bool isRecording = true;
  int currentlyPlayedTime = 0;
  int timeToFillColorInSingleBar = 0;

  void _insertAt0(){

    if(waveforms.isNotEmpty){
      if(waveforms[0] != -1){
        waveforms.insert(0, -1);
      }
    }else{
      waveforms.insert(0, -1);
    }
  }

  @override
  void initState() {
    _insertAt0();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WaveFormBuilder oldWidget) {
    waveforms.clear();
    waveforms.addAll(widget.state.waveformValues);

    _insertAt0();

    if(waveforms.isNotEmpty){
      timeToFillColorInSingleBar =
          ((widget.state.recordedTime / waveforms.length) * 1000).toInt();
    }

    isPlaying = widget.state.isPlaying;
    isRecording = widget.state.isRecording;
    currentlyPlayedTime = widget.state.playedTime;

    super.didUpdateWidget(oldWidget);
  }

  double getPadding(int element) {
    return (((20 - (20 * element / 100)) / 2) > 9.5)
        ? 9.5
        : (20 - (20 * element / 100)) / 2;
  }

  Color getAmplitudeColor(int index) {
    return (widget.state.runtimeType is RecorderInProgress)
        ? AppColors.recorderColor
        : (((widget.state.runtimeType.toString() == "RecorderPlaying") ||
                    widget.state.runtimeType.toString() ==
                        "RecorderPausedPlaying") &&
                ((currentlyPlayedTime / timeToFillColorInSingleBar) > index))
            ? AppColors.lightPurple
            : AppColors.recorderColor;
  }

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 20,
      width: context.screenWidth,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        controller: widget.controller,
        itemCount: waveforms.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          int element = waveforms[index];
          return element == -1
              ? Padding(
                  padding: const EdgeInsets.symmetric(vertical: 9.5),
                  child: Container(
                    color: AppColors.recorderColor,
                    height: 1,
                    width: context.screenWidth,
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  child: SizedBox(
                    width: 2,
                    height: 100,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: getPadding(element)),
                      child: Container(
                        color: getAmplitudeColor(index),
                      ),
                    ),
                  ),
                );
        },
      ),
    );
  }
}
