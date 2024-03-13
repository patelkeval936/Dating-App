part of 'recorder_bloc.dart';

@immutable
abstract class RecorderEvent {}

class RecordingStart extends RecorderEvent {}

class RecordingInProgress extends RecorderEvent {
  RecordingInProgress(this.amplitude);

  final double amplitude;
}

class RecordingStop extends RecorderEvent {}

class RecordingPlay extends RecorderEvent {}

class RecordingPlayProgress extends RecorderEvent {}

class RecordingPausePlay extends RecorderEvent {}

class RecordingResumePlay extends RecorderEvent {}

class RecordingCompletePlay extends RecorderEvent {}

class RecordingSubmit extends RecorderEvent {}

class RecordingDelete extends RecorderEvent {}
