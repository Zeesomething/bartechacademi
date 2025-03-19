import 'package:get/get.dart';

import '../controllers/list_training_controller.dart';

class ListTrainingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListTrainingController>(
      () => ListTrainingController(),
    );
  }
}
