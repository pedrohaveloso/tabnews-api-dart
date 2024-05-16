part of 'package:tabnews/src/tabnews.dart';

/// [TabNews] contents API route.
extension ContentApi on TabNews {
  /// Fetches posts from the [TabNews] API.
  ///
  /// ### Examples
  ///
  ///     import 'package:tabnews/tabnews.dart';
  ///
  ///     final tabNews = TabNews();
  ///
  ///     final (status, contents) = await tabNews.getContents();
  ///
  ///     if (status == 200 && contents != null) {
  ///       contents.forEach(print); // {id: ...} {id: ...} ...
  ///     }
  Future<Response<List<Content>?>> getContents({
    int? page,
    int? perPage,
    ContentStrategy? strategy,
  }) async {
    final response = await http.get(
      _apiUrl(
        '/contents',
        queryParameters: {
          'page': (page ?? 1).toString(),
          'per_page': (perPage ?? defaultContentPerPage).toString(),
          'strategy': (strategy ?? defaultContentStrategy.value).toString(),
        },
      ),
    );

    final contents = <Content>[];
    final decoded = jsonDecode(response.body);
    ResponseError? error;

    if (response.statusCode == 200 && decoded is List) {
      for (final content in decoded) {
        if (content is! Map<String, dynamic>) {
          break;
        }

        contents.add(Content.fromJson(content));
      }
    } else {
      error = _getError(decoded);
    }

    return (
      contents.isEmpty ? null : contents,
      response.statusCode == 200,
      error,
    );
  }

  /// Also see [getContents].
  ///
  /// Throws an exception if an error occurred.
  ///
  /// ### Examples
  ///
  ///     import 'package:tabnews/tabnews.dart';
  ///
  ///     final tabNews = TabNews();
  ///
  ///     try {
  ///       final contents = await tabNews.getContentsForced();
  ///     } catch (error) {
  ///       print(error);
  ///     }
  Future<List<Content>?> getContentsForced({
    int? page,
    int? perPage,
    ContentStrategy? strategy,
  }) async {
    final (contents, status, error) = await getContents(
      page: page,
      perPage: perPage,
      strategy: strategy,
    );

    if (status) {
      return contents;
    } else {
      throw _forcedException(error);
    }
  }
}
