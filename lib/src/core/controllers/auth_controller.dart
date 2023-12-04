import 'package:express/src/core/models/express_user.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final Rxn<ExpressUser> _user = Rxn<ExpressUser>();

  // GETTERS
  ExpressUser? get currentUser => _user.value;
  bool get isLoggedIn => _user.value != null;

  // SETTERS
  set setCurrentUser(ExpressUser user) => _user.value = user;
}
