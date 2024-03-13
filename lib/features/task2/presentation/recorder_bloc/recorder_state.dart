part of 'recorder_bloc.dart';

sealed class RecorderState {
  final List<int> waveformValues;
  final int playedTime;
  final int recordedTime;
  final bool isRecording;
  final bool isPlaying;

  const RecorderState(this.waveformValues, this.recordedTime, this.isRecording,
      this.isPlaying, this.playedTime);
}

class RecorderInitial extends RecorderState {
  const RecorderInitial(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderLoading extends RecorderState {
  const RecorderLoading(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderPaused extends RecorderState {
  const RecorderPaused(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderResumed extends RecorderState {
  const RecorderResumed(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderCompleted extends RecorderState {
  const RecorderCompleted(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderInProgress extends RecorderState {
  const RecorderInProgress(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

@immutable
class RecorderPlaying extends RecorderState {
  const RecorderPlaying(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderPausedPlaying extends RecorderState {
  const RecorderPausedPlaying(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderResumePlaying extends RecorderState {
  const RecorderResumePlaying(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderCompletedPlaying extends RecorderState {
  const RecorderCompletedPlaying(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderSubmitted extends RecorderState {
  const RecorderSubmitted(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}

class RecorderError extends RecorderState {
  const RecorderError(
    super.waveformValues,
    super.recordedTime,
    super.isRecording,
    super.isPlaying,
    super.playedTime,
  );
}
