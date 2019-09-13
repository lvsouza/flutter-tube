import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttertube/shared/models/video-model.dart';
import 'package:fluttertube/shared/services/apis/api-youtube.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc implements BlocBase {
  ApiYouTube api;
  List<VideoModel> videos;

  final StreamController<List<VideoModel>> _videosController =
      BehaviorSubject<List<VideoModel>>();
  Stream get outVideos => _videosController.stream;

  final StreamController<String> _searchController = BehaviorSubject<String>();
  Sink get inSearch => _searchController.sink;

  HomeBloc() {
    api = ApiYouTube();

    _searchController.stream.listen(_search);
  }

  void _search(String search) async {
    if (search != null) {
      _videosController.sink.add([]);
      videos = await api.search(search);
    } else {
      videos += await api.nextPage();
    }

    _videosController.sink.add(videos);
  }

  @override
  void dispose() {
    _videosController.close();
    _searchController.close();
  }

  @override
  void addListener(listener) {}

  @override
  bool get hasListeners => null;

  @override
  void notifyListeners() {}

  @override
  void removeListener(listener) {}
}
