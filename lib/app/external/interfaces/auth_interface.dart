abstract class AuthInterface {
  Future<String> getUserFullName();
  Future<String> getUserFirstName();
  Future<void> register(String name, String email, String password);
  Future<void> login(String email, String password);
  bool isAuthenticated();
  Future<void> logout();
}
