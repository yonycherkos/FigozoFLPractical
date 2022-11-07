import 'package:dio/dio.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';

class PetsApiRepository {
  Dio? dio;
  final baseUrl = 'https://mocki.io/v1';

  PetsApiRepository() {
    if (dio == null) {
      BaseOptions options = BaseOptions(
        baseUrl: baseUrl,
        receiveDataWhenStatusError: true,
        connectTimeout: 60 * 1000, // 60 seconds
        receiveTimeout: 60 * 1000, // 60 seconds
      );
      dio = Dio(options);
    }
  }

  Future<List<PetInfo>> fetchCatsList() async {
    try {
      var response = await dio!.get('/77290441-d8e9-483f-80a2-a336a3364bbe');
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
      var response = await dio!.get('/442a4801-5715-474a-b6fd-7548ab2f8d20');
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
