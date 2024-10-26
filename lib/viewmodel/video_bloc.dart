import 'package:bloc/bloc.dart';
import 'package:video_player/video_player.dart';
import '../repository/video_repository.dart';
import '../models/video_model.dart';

abstract class VideoEvent {}

class LoadVideos extends VideoEvent {}

class PlayVideo extends VideoEvent {
  final int index;
  PlayVideo(this.index);
}

abstract class VideoState {}

class VideoLoading extends VideoState {}

class VideoLoaded extends VideoState {
  final List<VideoModel> videos;
  final VideoPlayerController? controller;
  final int currentIndex;

  VideoLoaded(this.videos, this.controller, this.currentIndex);
}

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository videoRepository;
  VideoPlayerController? _controller;
  List<VideoModel> _videos = [];
  int _currentIndex = 0;

  VideoBloc(this.videoRepository) : super(VideoLoading()) {
    on<LoadVideos>((event, emit) async {
      emit(VideoLoading());
      _videos = await videoRepository.fetchVideosFromStorage();
      _initializeController(0);
      emit(VideoLoaded(_videos, _controller, _currentIndex));
    });

    on<PlayVideo>((event, emit) async {
      _initializeController(event.index);
      emit(VideoLoaded(_videos, _controller, _currentIndex));
    });
  }

  void _initializeController(int index) {
    _currentIndex = index;
    _controller?.dispose();
    _controller = VideoPlayerController.asset(_videos[index].path)
      ..initialize().then((_) {
        _controller!.play();
        add(LoadVideos());
      });
  }

  @override
  Future<void> close() {
    _controller?.dispose();
    return super.close();
  }
}
