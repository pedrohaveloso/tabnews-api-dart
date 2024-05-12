import "package:http/http.dart" as http;

enum Status { ok, error }

class TabNewsApi {
  static final _baseUrl = "/";

  static Future<(Status, bool)> createUser({
    required String username,
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.https(_baseUrl, "/users"),
      body: {
        "username": username,
        "email": email,
        "password": password,
      },
    );

    return (Status.ok, response.statusCode == 201);
  }

  static Future<(Status, bool)> loginUser({
    
  })
}

void main() async {
  final (_, isCreated) = await TabNewsApi.createUser(
    username: "username",
    email: "email",
    password: "password",
  );

  print(isCreated);
}
