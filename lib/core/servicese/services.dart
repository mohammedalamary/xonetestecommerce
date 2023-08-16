import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyServices extends GetxService {
  late GetStorage getStorage;

  @override
  void onInit() {
    getStorage = GetStorage();
    super.onInit();
    init();
  }
  Future<MyServices> init() async {
    await GetStorage.init();
    getStorage = GetStorage();
    return this;
  }

}


initialServices() async {
  await Get.putAsync(() => MyServices().init());
}
