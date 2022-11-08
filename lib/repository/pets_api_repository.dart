import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';

class PetsApiRepository {
  Dio? _dio;
  final baseUrl = 'https://mocki.io/v1';
  final Options _cacheOptions = buildCacheOptions(
    const Duration(days: 7),
    forceRefresh: true,
  );

  PetsApiRepository() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000, // 60 seconds
      );
      _dio = Dio(options);
      DioCacheManager dioCacheManager = DioCacheManager(CacheConfig());
      _dio!.interceptors.add(dioCacheManager.interceptor);
    }
  }

  Future<List<PetInfo>> fetchCatsList() async {
    try {
      var response = await _dio!.get(
        '/77290441-d8e9-483f-80a2-a336a3364bbe',
        options: _cacheOptions,
      );
      var catsList = <PetInfo>[];
      if (response.statusCode == 200) {
        final catsJson = response.data['cats'];
        catsList = List<PetInfo>.from(
          catsJson.map((cat) => PetInfo.fromJson(cat)),
        );
      }
      return catsList;
    } catch (e) {
      return [];
    }
  }

  Future<List<PetInfo>> fetchDogsList() async {
    try {
      var response = await _dio!.get(
        '/442a4801-5715-474a-b6fd-7548ab2f8d20',
        options: _cacheOptions,
      );
      var dogsList = <PetInfo>[];
      if (response.statusCode == 200) {
        final dogsJson = response.data['dogs'];
        dogsList = List<PetInfo>.from(
          dogsJson.map((dogInfo) => PetInfo.fromJson(dogInfo)),
        );
      }
      return dogsList;
    } catch (e) {
      return [];
    }
  }
}
