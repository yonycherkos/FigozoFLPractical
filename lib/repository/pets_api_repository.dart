import 'package:dio/dio.dart';
import 'package:figozo_fl_practical/models/pet_info.dart';

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

  Future<List<PetInfo>> getCatsList() async {
    try {
      var response = await dio!.get('/77290441-d8e9-483f-80a2-a336a3364bbe');
      var petsList = <PetInfo>[];
      if (response.statusCode == 200) {
        final responseJson = response.data["Response"];
        petsList = List<PetInfo>.from(
          responseJson['cats'].map((petInfo) => PetInfo.fromJson(petInfo)),
        );
      }
      return petsList;
    } catch (e) {
      rethrow;
    }
  }

  Future<List<PetInfo>> getDogsList() async {
    try {
      var response = await dio!.get('/442a4801-5715-474a-b6fd-7548ab2f8d20');
      var petsList = <PetInfo>[];
      if (response.statusCode == 200) {
        final responseJson = response.data["Response"];
        petsList = List<PetInfo>.from(
          responseJson['dogs'].map((petInfo) => PetInfo.fromJson(petInfo)),
        );
      }
      return petsList;
    } catch (e) {
      rethrow;
    }
  }
}
