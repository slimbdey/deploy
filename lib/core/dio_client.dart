import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class DioClient {
  late Dio dio;

  DioClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://foodapi.dzolotov.pro',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
  }

  Future<List<T>> getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.get('/$path');
      final List<dynamic> data = response.data ?? [];
      final dtos =
          data.map((json) => fromJson(json as Map<String, dynamic>)).toList();

      return dtos;
    } catch (e) {
      debugPrint('datasource exception: $e');
      return [];
    }
  }

  Future<T> create<T>(
    String path,
    T value,
    Map<String, dynamic> Function(T) toJson,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    try {
      final response = await dio.post('/$path', data: toJson(value));

      return fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw Exception('datasource exception: $e');
    }
  }

  Future<void> delete(String path, int id) async {
    try {
      await dio.delete('/$path/$id');
    } catch (e) {
      throw Exception('datasource exception: $e');
    }
  }
}
