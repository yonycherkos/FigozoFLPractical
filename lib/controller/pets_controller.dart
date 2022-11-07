import 'package:figozo_fl_practical/repository/pets_api_repository.dart';
import 'package:get/state_manager.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';

class PetsController extends GetxController {
  final PetsApiRepository _petsApiRepository = PetsApiRepository();

  // TODO: Add loading state manager
  late RxList<PetInfo> catsList = <PetInfo>[].obs;
  late RxList<PetInfo> dogsList = <PetInfo>[].obs;

  @override
  void onInit() {
    getCatsList();
    getDogsList();
    super.onInit();
  }

  void getCatsList() async {
    catsList(await _petsApiRepository.fetchCatsList());
  }

  void getDogsList() async {
    dogsList(await _petsApiRepository.fetchDogsList());
  }
}
