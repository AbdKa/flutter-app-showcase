import 'package:dartz/dartz.dart';
import 'package:flutter_demo/core/domain/model/user.dart';
import 'package:flutter_demo/core/utils/bloc_extensions.dart';
import 'package:flutter_demo/features/auth/domain/model/log_in_failure.dart';
import 'package:flutter_demo/features/auth/login/login_initial_params.dart';

/// Model used by presenter, contains fields that are relevant to presenters and implements ViewModel to expose data to view (page)
class LoginPresentationModel implements LoginViewModel {
  /// Creates the initial state
  LoginPresentationModel.initial(
    // ignore: avoid_unused_constructor_parameters
    LoginInitialParams initialParams,
  )   : loginResult = const FutureResult.empty(),
        isLoginEnabled = false,
        username = '',
        password = '';

  /// Used for the copyWith method
  LoginPresentationModel._({
    required this.loginResult,
    required this.isLoginEnabled,
    required this.username,
    required this.password,
  });

  final FutureResult<Either<LogInFailure, User>> loginResult;
  bool isLoginEnabled;
  String username;
  String password;

  @override
  String get getUsername => username;

  @override
  String get getPassword => password;

  @override
  set setUsername(String username) => this.username = username;

  @override
  set setPassword(String password) => this.password = password;

  @override
  bool get isLoading => loginResult.isPending();

  LoginPresentationModel copyWith({
    FutureResult<Either<LogInFailure, User>>? loginResult,
    bool? isLoginEnabled,
    String? username,
    String? password,
  }) {
    return LoginPresentationModel._(
      loginResult: loginResult ?? this.loginResult,
      isLoginEnabled: isLoginEnabled ?? this.isLoginEnabled,
      username: username ?? this.username,
      password: password ?? this.password,
    );
  }
}

/// Interface to expose fields used by the view (page).
abstract class LoginViewModel {
  String get getUsername;

  String get getPassword;

  set setUsername(String username);

  set setPassword(String password);

  bool get isLoading;
}
