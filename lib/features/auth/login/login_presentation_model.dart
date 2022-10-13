import 'package:flutter_demo/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : isLoginEnabled = false,
        username = '',
        password = '';

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.isLoginEnabled,
    required this.username,
    required this.password,
  });

  bool isLoginEnabled;
  String username;
  String password;

  @override
  bool get getIsLoginEnabled => isLoginEnabled;

  @override
  String get getUsername => username;

  @override
  String get getPassword => password;

  @override
  set setIsLoginEnabled(bool isLoginEnabled) => this.isLoginEnabled = isLoginEnabled;

  @override
  set setUsername(String username) => this.username = username;

  @override
  set setPassword(String password) => this.password = password;

  LoginPresentationModel copyWith({
    bool? isLoginEnabled,
    String? username,
    String? password,
  }) {
    return LoginPresentationModel._(
      isLoginEnabled: isLoginEnabled ?? this.isLoginEnabled,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  bool get getIsLoginEnabled;

  String get getUsername;

  String get getPassword;

  set setIsLoginEnabled(bool isLoginEnabled);

  set setUsername(String username);

  set setPassword(String password);
}
