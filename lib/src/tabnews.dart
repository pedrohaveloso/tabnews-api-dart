import "package:http/http.dart" as http;
import "package:tabnews/src/types/response.dart";

part "package:tabnews/src/auth.dart";

enum ContentStrategy { newContent, oldContent, relevantContent }

class TabNews {
  late final String _baseUrl;
  late final http.Client _client;
  late final ContentStrategy _contentStrategy;

  TabNews({
    http.Client? client,
    String? baseUrl,
    ContentStrategy? contentStrategy
  }) {
    _client = client ?? http.Client();
    _baseUrl = baseUrl ?? "https://tabnews.com.br/api/v1";
    _contentStrategy = contentStrategy ?? ContentStrategy.relevantContent;
  }

  Uri _apiUrl(path, {queryParameters = ""}) {
    return Uri.https(_baseUrl, path, queryParameters);
  }

  void setContentStrategy(ContentStrategy contentStrategy) {
    _contentStrategy = contentStrategy;
  }

  void close() {
    _client.close();
  }
}
