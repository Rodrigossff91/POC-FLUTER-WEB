import 'package:get/get.dart';
import 'package:tvlegaleadm/tv/controller/tv_controller.dart';

class AppConfigInitBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(TvController());
  }
}
