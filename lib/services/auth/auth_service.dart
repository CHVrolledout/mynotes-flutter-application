import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/auth_user.dart';

class AuthService implements AuthProvider {
  final AuthProvider provider;

  const AuthService(this.provider);


// create user
  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) =>
      provider.createUser(
        email: email,
        password: password,
      );

// get current user
  @override
  AuthUser? get currentUser => provider.currentUser;

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) =>
      provider.logIn(email: email, password: password);


// log out
  @override
  Future<void> logOut() => provider.logOut();


// send email verification
  @override
  Future<void> sendEmailVerification() => provider.sendEmailVerification();
}
