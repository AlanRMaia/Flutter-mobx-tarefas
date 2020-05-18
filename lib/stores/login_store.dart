import 'package:mobx/mobx.dart';
part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase();

  @observable
  String email = '';

  void setEmail(String value) => email = value;

  @observable
  String password = '';

  void setPassword(String value) => password = value;

  @observable
  bool passwordVisible = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(Duration(seconds: 2));

    loading = false;
    loggedIn = true;
  }

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @action
  void logout() {
    loggedIn = false;
    password = '';
    email = '';
  }

  @computed
  Function get loginPressed =>
      (isEmailValid && isPassword && !loading) ? login : null;

  @computed
  bool get isEmailValid => RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(email);

  @computed
  bool get isPassword => password.length >= 6;
}
//!flutter packages pub run build_runner watch
