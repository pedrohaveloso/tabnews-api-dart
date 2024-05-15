part of "package:tabnews/src/tabnews.dart";

extension TabNewsAuth on TabNews {
  Future<Response<bool>> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      _apiUrl("/users"),
      body: {
        "username": username,
        "email": email,
        "password": password,
      },
    );

    return (response.statusCode, response.statusCode == 201);
  }

  Future<Response<String>> loginUser() async {
    return (200, "");
  }
}
