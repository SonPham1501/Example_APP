import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../../../../../../core/common/models/app_file_attachment/app_file_attachment.dart';
import '../../../../../../core/config/app_text_style.dart';
import '../../../../../../core/config/palette.dart';
import '../../../../../../core/widgets/layouts/adaptive_loading_widget.dart';

class TestAudioPlayerModal extends StatefulWidget {
  final AppFileAttachmentType file;
  TestAudioPlayerModal(this.file);

  @override
  State<TestAudioPlayerModal> createState() => _TestAudioPlayerModalState();
}

class _TestAudioPlayerModalState extends State<TestAudioPlayerModal> {
  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.file.path ?? "");
    _audioPlayer.play();
    super.initState();
  }

  @override
  void dispose() {
    print('TestAudioPlayerModal disposed');
    _audioPlayer.stop();
    _audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primary,
      width: MediaQuery.of(context).size.width,
      height: 160,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Center(
        child: PlayerButtons(_audioPlayer),
      ),
    );
  }
}

class AppAudioPlayer extends StatefulWidget {
  final AppFileAttachmentType file;
  AppAudioPlayer(this.file);

  @override
  State<AppAudioPlayer> createState() => _AppAudioPlayerState();
}

class _AppAudioPlayerState extends State<AppAudioPlayer> {
  late AudioPlayer _audioPlayer;
  @override
  void initState() {
    _audioPlayer = AudioPlayer();
    _audioPlayer.setUrl(widget.file.path ?? "");
    //_audioPlayer.play();
    super.initState();
  }

  @override
  void dispose() {
    print('TestAudioPlayerModal disposed');
    _audioPlayer.stop();
    _audioPlayer.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 8),
      constraints: BoxConstraints(minHeight: 48),
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(24),
      ),
      child: PlayerButtons(_audioPlayer),
    );
  }
}

class PlayerButtons extends StatelessWidget {
  const PlayerButtons(this._audioPlayer);

  final AudioPlayer _audioPlayer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        StreamBuilder<PlayerState>(
          stream: _audioPlayer.playerStateStream,
          builder: (_, snapshot) {
            final playerState = snapshot.data;
            return _playPauseButton(playerState);
          },
        ),
        const SizedBox(
          height: 5,
        ),
        Expanded(
          child: StreamBuilder<Duration>(
            stream: _audioPlayer.bufferedPositionStream,
            builder: (context, buffered) {
              // final duration = snapshot.data;
              // final durationState = _DurationState(
              //   progress: _audioPlayer.
              //   buffered: buffered??Duration.zero,
              //   total: _audioPlayer.duration??Duration.zero,
              // );
              // final progress = durationState?.progress ?? Duration.zero;
              // final buffered = durationState?.buffered ?? Duration.zero;
              // final total = durationState?.total ?? Duration.zero;
              return StreamBuilder<Duration>(
                stream: _audioPlayer.positionStream,
                builder: (_, progress) => ProgressBar(
                  timeLabelTextStyle: AppTextStyle.w400(color: Colors.white),
                  progress: progress.data ?? Duration.zero,
                  buffered: buffered.data ?? Duration.zero,
                  total: _audioPlayer.duration ?? Duration.zero,
                  barHeight: 3,
                  baseBarColor: Colors.white60,
                  thumbRadius: 6,
                  thumbColor: Colors.white,
                  progressBarColor: Colors.white,
                  timeLabelLocation: TimeLabelLocation.none,
                  onSeek: (duration) {
                    _audioPlayer.seek(duration);
                  },
                ),
              );
            },
          ),
        ),
        const SizedBox(
          width: 8,
        ),
      ],
    );
  }

  Widget _playPauseButton(PlayerState? playerState) {
    final processingState = playerState?.processingState;
    if (processingState == ProcessingState.loading ||
        processingState == ProcessingState.buffering) {
      return Container(
        margin: EdgeInsets.all(8.0),
        width: 18.0,
        height: 18.0,
        child: ApdaptiveLoadingWidget(
          color: Colors.white,
        ),
      );
    } else if (_audioPlayer.playing != true) {
      return IconButton(
        icon: Icon(
          Icons.play_arrow,
          color: Colors.white,
        ),
        iconSize: 24.0,
        onPressed: _audioPlayer.play,
      );
    } else if (processingState != ProcessingState.completed) {
      return IconButton(
        icon: Icon(
          Icons.pause,
          color: Colors.white,
        ),
        iconSize: 24.0,
        onPressed: _audioPlayer.pause,
      );
    } else {
      return IconButton(
        icon: Icon(
          Icons.replay,
          color: Colors.white,
        ),
        iconSize: 24.0,
        onPressed: () => _audioPlayer.seek(Duration.zero,
            index: _audioPlayer.effectiveIndices?.first),
      );
    }
  }

  Widget _shuffleButton(BuildContext context, bool isEnabled) {
    return IconButton(
      icon: isEnabled
          ? Icon(Icons.shuffle, color: Theme.of(context).accentColor)
          : Icon(Icons.shuffle),
      onPressed: () async {
        final enable = !isEnabled;
        if (enable) {
          await _audioPlayer.shuffle();
        }
        await _audioPlayer.setShuffleModeEnabled(enable);
      },
    );
  }

  Widget _previousButton() {
    return IconButton(
      icon: Icon(Icons.skip_previous),
      onPressed: _audioPlayer.hasPrevious ? _audioPlayer.seekToPrevious : null,
    );
  }

  Widget _nextButton() {
    return IconButton(
      icon: Icon(Icons.skip_next),
      onPressed: _audioPlayer.hasNext ? _audioPlayer.seekToNext : null,
    );
  }

  Widget _repeatButton(BuildContext context, LoopMode loopMode) {
    final icons = [
      Icon(Icons.repeat),
      Icon(Icons.repeat, color: Theme.of(context).accentColor),
      Icon(Icons.repeat_one, color: Theme.of(context).accentColor),
    ];
    const cycleModes = [
      LoopMode.off,
      LoopMode.all,
      LoopMode.one,
    ];
    final index = cycleModes.indexOf(loopMode);
    return IconButton(
      icon: icons[index],
      onPressed: () {
        _audioPlayer.setLoopMode(
            cycleModes[(cycleModes.indexOf(loopMode) + 1) % cycleModes.length]);
      },
    );
  }
}
