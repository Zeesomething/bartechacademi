import 'package:bartechacademi/app/data/sertifikat_response.dart';
import 'package:bartechacademi/app/data/services/api_services.dart';
import 'package:bartechacademi/app/data/training_response.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final ApiService _apiService = ApiService();

  // Observable variables
  final RxBool isLoading = true.obs;
  final Rx<trainingResponse> trainingsData = trainingResponse().obs;
  final Rx<sertifikatResponse> certificatesData = sertifikatResponse().obs;

  // Getter for the first 3 trainings for carousel
  List<dynamic> get carouselTrainings {
    final allTrainings = trainingsData.value.data ?? [];
    return allTrainings.isEmpty ? [] : allTrainings.take(3).toList();
  }

  @override
  void onInit() {
    super.onInit();
    print('DashboardController: onInit called');
    fetchTrainings();
    fetchCertificates();
  }

  Future<void> fetchTrainings() async {
    try {
      isLoading.value = true;
      print('Fetching trainings...');
      final response = await _apiService.getTrainings();
      print('Training response received. Items: ${response.data?.length ?? 0}');
      trainingsData.value = response;
    } catch (e) {
      print('Error fetching trainings: $e');
      Get.snackbar('Error', 'Failed to load trainings');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> fetchCertificates() async {
    try {
      final response = await _apiService.getCertificates();
      print(
          'Certificates response received. Items: ${response.data?.length ?? 0}');
      certificatesData.value = response;
    } catch (e) {
      print('Error fetching certificates: $e');
      Get.snackbar('Error', 'Failed to load certificates');
    }
  }
}
