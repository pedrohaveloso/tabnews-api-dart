import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tabnews/src/models/content.dart';
import 'package:tabnews/src/models/content_strategy.dart';
import 'package:tabnews/src/types/response.dart';
import 'package:tabnews/src/types/response_error.dart';

part 'package:tabnews/src/auth_api.dart';
part 'package:tabnews/src/content_api.dart';

class TabNews {
  TabNews({
    this.authority = 'tabnews.com.br',
    this.basePath = '/api/v1',
    this.defaultContentStrategy = ContentStrategy.relevantContent,
    this.defaultContentPerPage = 20,
  });

  ///
  String authority;

  ///
  String basePath;

  ///
  ContentStrategy defaultContentStrategy;

  ///
  int defaultContentPerPage;

  ResponseError? _getError(dynamic decodedBody) {
    if (decodedBody is Map<String, dynamic>) {
      return (
        message: decodedBody['message'] as String?,
        action: decodedBody['action'] as String?,
      );
    }

    return null;
  }

  Exception _forcedException(ResponseError? error) {
    const message = 'Error occurred when making a call to the TabNews '
        'API with a force function.';

    return Exception([
      '{$message}',
      '{Message: ${error?.message ?? 'Unknown error'}}',
      '{Action: ${error?.action ?? 'Unknown action'}}',
    ]);
  }

  Uri _apiUrl(String path, {Map<String, String?>? queryParameters}) {
    return Uri.https(authority, '$basePath$path', queryParameters);
  }
}
