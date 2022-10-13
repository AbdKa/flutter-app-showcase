import 'package:bloc/bloc.dart';
import 'package:flutter_demo/core/utils/bloc_extensions.dart';
import 'package:flutter_demo/core/utils/either_extensions.dart';
import 'package:flutter_demo/dependency_injection/app_component.dart';
import 'package:flutter_demo/features/auth/domain/use_cases/log_in_use_case.dart';
import 'package:flutter_demo/features/auth/login/login_navigator.dart';
import 'package:flutter_demo/features/auth/login/login_presentation_model.dart';
import 'package:flutter_demo/localization/app_localizations_utils.dart';

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

  Future<void> loginPressed() async {
    if (!_model.isLoginEnabled) {
      return;
    }

    final logInUseCase = LogInUseCase(getIt());

    await await logInUseCase
        .execute(username: _model.username, password: _model.password)
        .observeStatusChanges(
          (result) => emit(
            _model.copyWith(
              loginResult: result,
              isLoginEnabled: _model.isLoginEnabled,
              username: _model.username,
              password: _model.password,
            ),
          ),
        )
        .asyncFold(
          (fail) => navigator.showError(fail.displayableFailure()),
          (success) => navigator.showAlert(title: appLocalizations.successfulTitle, message: appLocalizations.welcomeMessage(_model.username)), //todo!
    );
    updateState();
  }

  void updateState() {
    emit(_model.copyWith(isLoginEnabled: _model.username.isNotEmpty && _model.password.isNotEmpty));
  }
}
