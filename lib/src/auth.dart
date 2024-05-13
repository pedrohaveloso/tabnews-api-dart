part of "package:tabnews/src/tab_news.dart";

extension TabNewsAuth on TabNews {
  Future<Response<bool>> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await _client.post(
      apiUrl("/users"),
      body: {
        "username": username,
        "email": email,
        "password": password,
      },
    );

    return (response.statusCode, response.statusCode == 201);
  }
}
