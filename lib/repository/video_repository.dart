import '../models/video_model.dart';

class VideoRepository {
  Future<List<VideoModel>> fetchVideosFromStorage() async {
    return [
      VideoModel(path: 'assets/videos/video1.mp4', title: 'Video 1'),
      VideoModel(path: 'assets/videos/video2.mp4', title: 'Video 2'),
      VideoModel(path: 'assets/videos/video3.mp4', title: 'Video 3'),
    ];
  }
}
