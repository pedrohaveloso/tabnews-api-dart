import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:tabnews/src/models/content.dart';
import 'package:tabnews/src/models/content_page.dart';
import 'package:tabnews/src/models/content_per_page.dart';
import 'package:tabnews/src/models/content_strategy.dart';
import 'package:tabnews/src/types/response.dart';
import 'package:tabnews/src/types/response_error.dart';

part 'package:tabnews/src/tabnews/auth_api.dart';
part 'package:tabnews/src/tabnews/content_api.dart';

class TabNews {
  /// Creates a new instance of the [TabNews] class.
  ///
  /// The [domain] and [basePath] are optional parameters.
  TabNews({
    this.domain = 'tabnews.com.br',
    this.basePath = '/api/v1',
  });

  ///
  String domain;

  ///
  String basePath;

  ///
  ContentStrategy defaultContentStrategy = ContentStrategy.relevantContent;

  ///
  ContentPerPage defaultContentPerPage = ContentPerPage(20);

  ResponseError? _getError(dynamic decodedBody) {
    if (decodedBody is Map<String, dynamic>) {
      return (
        message: decodedBody['message'] as String?,
        action: decodedBody['action'] as String?,
      );
    }

    return null;
  }

  ArgumentError _orThrowException(ResponseError? error) {
    const warning =
        'Error occurred when making a call to the TabNews API with a force '
        'function.';

    return ArgumentError.value(
      '{$warning}',
      '{Message: ${error?.message ?? 'Unknown error'}}',
      '{Action: ${error?.action ?? 'Unknown action'}}',
    );
  }

  Uri _apiUrl(String path, {Map<String, String?>? queryParameters}) {
    return Uri.https(domain, '$basePath$path', queryParameters);
  }
}
