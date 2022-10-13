import 'package:bloc/bloc.dart';
import 'package:flutter_demo/features/auth/login/login_navigator.dart';
import 'package:flutter_demo/features/auth/login/login_presentation_model.dart';

class LoginPresenter extends Cubit<LoginViewModel> {
  LoginPresenter(
    LoginPresentationModel super.model,
    this.navigator,
  );

  final LoginNavigator navigator;

  // ignore: unused_element
  LoginPresentationModel get _model => state as LoginPresentationModel;

  void usernameChanged(String username) {
    _model.setUsername = username;
    updateState();
  }

  void passwordChanged(String password) {
    _model.setPassword = password;
    updateState();
  }

  void loginPressed() {
    if(!_model.isLoginEnabled) {
      return;
    }

    updateState();
  }

  void updateState() {
    emit(_model.copyWith(isLoginEnabled: _model.username.isNotEmpty && _model.password.isNotEmpty));
  }


}
