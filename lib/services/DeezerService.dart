import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_shazam/models/DeezerModel.dart';

class SongService {
  late Dio _dio;

  SongService() {
    BaseOptions options = BaseOptions(
        receiveTimeout: 100000,
        connectTimeout: 100000,
        baseUrl: 'https://api.deezer.com/track/');
    _dio = Dio(options);
  }
  Future<DeezerModel> getTrack(id) async {
    final response = await _dio.get('$id',
        options: Options(headers: {
          'Content-type': 'application/json;charset=UTF-8',
          'Accept': 'application/json;charset=UTF-8',
        }));
    DeezerModel song = DeezerModel.fromJson(response.data);
    return song;
  }
}
