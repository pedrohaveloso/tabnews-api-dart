part of 'package:tabnews/src/tabnews.dart';

/// Contains extensions for the [TabNews] class related to authentication in the
/// TabNews API.
///
/// These extensions provide methods for creating users in the TabNews API.
extension AuthApi on TabNews {
  /// Creates a new user in the TabNews API.
  ///
  /// Requires a valid [username], [email], and [password].
  ///
  /// Returns a [Future] containing a [Response] indicating the success of user
  /// creation.
  ///
  /// If the user is successfully created, the [Response] will contain `true`.
  ///
  /// In case of failure in user creation, the [Response] will contain `false`
  /// and a possible error.
  Future<Response<bool>> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      _apiUrl('/users'),
      body: {
        'username': username,
        'email': email,
        'password': password,
      },
    );

    final decoded = jsonDecode(response.body);

    if (response.statusCode == 201) {
      return (true, true, null);
    } else {
      return (false, false, _getError(decoded));
    }
  }

  /// Also see [createUser].
  ///
  /// In case of failure, throws an exception containing information about the
  /// error.
  Future<bool> createUserOrThrow({
    required String username,
    required String email,
    required String password,
  }) async {
    final (_, status, error) = await createUser(
      username: username,
      email: email,
      password: password,
    );

    if (status) {
      return true;
    } else {
      throw _orThrowException(error);
    }
  }
}
