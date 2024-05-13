import "package:http/http.dart" as http;
import "package:tabnews/src/types/response.dart";

part "package:tabnews/src/auth.dart";

class TabNews {
  late final String _baseUrl;
  late final http.Client _client;

  TabNews({http.Client? client, String? baseUrl}) {
    _client = client ?? http.Client();
    _baseUrl = baseUrl ?? "https://tabnews.com.br/api/v1";
  }

  Uri apiUrl(path, {queryParameters = ""}) {
    return Uri.https(_baseUrl, path, queryParameters);
  }

  void close() {
    _client.close();
  }
}
