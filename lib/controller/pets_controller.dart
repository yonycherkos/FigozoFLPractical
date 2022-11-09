import 'package:figozo_fl_practical/repository/pets_api_repository.dart';
import 'package:get/state_manager.dart';
import 'package:figozo_fl_practical/model/pet_info.dart';

class PetsController extends GetxController {
  final PetsApiRepository _petsApiRepository = PetsApiRepository();

  late RxBool isLoading = false.obs;
  late RxList<PetInfo> catsList = <PetInfo>[].obs;
  late RxList<PetInfo> dogsList = <PetInfo>[].obs;

  @override
  void onInit() async {
    isLoading(true);
    await getCatsList();
    await getDogsList();
    isLoading(false);
    super.onInit();
  }

  Future<void> getCatsList() async {
    catsList(await _petsApiRepository.fetchCatsList());
  }

  Future<void> getDogsList() async {
    dogsList(await _petsApiRepository.fetchDogsList());
  }
}
