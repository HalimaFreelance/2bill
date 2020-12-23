
import 'base_model.dart';

class AuthViewModel extends BaseModel {
  bool _emailValidate = true;
  bool _passwordValidate = true;

  // Api _api = locator<Api>();
  //
  // Future<LoginResponse> login(String email, String password) async {
  //   setState(ViewState.Busy);
  //   LoginUserResponse user =
  //       new LoginUserResponse(email: email, password: password);
  //   var success = await _api.login(user.signInToMap());
  //   setState(ViewState.Idle);
  //   return success;
  // }


  bool authValidation(String email, String password) {
    bool validate = true;
    if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email)) {
      _emailValidate = false;
      validate = false;
    } else {
      _emailValidate = true;
    }

    if (password.isEmpty) {
      _passwordValidate = false;
      validate = false;
    } else {
      _passwordValidate = true;
    }
    notifyListeners();
    return validate;
  }


  bool get passwordValidate => _passwordValidate;

  bool get emailValidate => _emailValidate;

}
