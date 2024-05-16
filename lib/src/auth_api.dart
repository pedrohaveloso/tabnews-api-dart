part of 'package:tabnews/src/tabnews.dart';

extension AuthApi on TabNews {
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

  Future<bool> createUserForced({
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
      throw _forcedException(error);
    }
  }
}
