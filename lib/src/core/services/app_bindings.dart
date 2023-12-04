import 'package:express/src/common/constants/constants.dart';
import 'package:express/src/core/controllers/auth_controller.dart';
import 'package:get/get.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), tag: Constants.kAuthController);
  }
}
