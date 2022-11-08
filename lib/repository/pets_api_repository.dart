import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:dio_cache_interceptor_hive_store/dio_cache_interceptor_hive_store.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';
import 'package:path_provider/path_provider.dart';

class PetsApiRepository {
  Dio? _dio;
  final baseUrl = 'https://mocki.io/v1';

  PetsApiRepository() {
    if (_dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000, // 60 seconds
      );
      _dio = Dio(options);
      initChache();
    }
  }

  Future<void> initChache() async {
    var cacheDir = await getApplicationDocumentsDirectory();
    var cacheStore = HiveCacheStore(cacheDir.path, hiveBoxName: 'pets');
    var customCacheOptons = CacheOptions(
      store: cacheStore,
      policy: CachePolicy.forceCache,
      priority: CachePriority.high,
      maxStale: const Duration(days: 7),
      hitCacheOnErrorExcept: [401, 404],
      keyBuilder: (request) {
        return request.uri.toString();
      },
      allowPostMethod: false,
    );

    _dio!.interceptors.add(
      DioCacheInterceptor(options: customCacheOptons),
    );
  }

  Future<List<PetInfo>> fetchCatsList() async {
    try {
      var response = await _dio!.get('/77290441-d8e9-483f-80a2-a336a3364bbe');
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
      var response = await _dio!.get('/442a4801-5715-474a-b6fd-7548ab2f8d20');
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
