part of 'package:tabnews/src/tabnews.dart';

/// [TabNews] contents API route.
extension ContentApi on TabNews {
  /// Fetches posts from the [TabNews] API.
  ///
  /// The [page], [perPage], and [strategy] are optional parameters.
  ///
  /// To get all the information and the body of content, use [getContent].
  ///
  /// ### Examples
  ///
  ///     import 'package:tabnews/tabnews.dart';
  ///
  ///     final tabNews = TabNews();
  ///
  ///     final (status, contents) = await tabNews.getContents();
  ///
  ///     if (status && contents != null) {
  ///       contents.forEach(print); // {id: ...} {id: ...} ...
  ///     }
  Future<Response<List<Content>?>> getContents({
    ContentPage? page,
    ContentPerPage? perPage,
    ContentStrategy? strategy,
    String? user,
  }) async {
    page = page ?? ContentPage(1);
    perPage = perPage ?? defaultContentPerPage;
    strategy = strategy ?? defaultContentStrategy;

    final response = await http.get(
      _apiUrl(
        '/contents${user != null ? '/$user' : ''}',
        queryParameters: {
          'page': page.toString(),
          'per_page': perPage.toString(),
          'strategy': strategy.value,
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
  ///       final contents = await tabNews.getContentsOrThrow();
  ///     } catch (error) {
  ///       print(error);
  ///     }
  Future<List<Content>?> getContentsOrThrow({
    ContentPage? page,
    ContentPerPage? perPage,
    ContentStrategy? strategy,
    String? user,
  }) async {
    final (contents, status, error) = await getContents(
      page: page,
      perPage: perPage,
      strategy: strategy,
      user: user,
    );

    if (status) {
      return contents;
    } else {
      throw _orThrowException(error);
    }
  }

  /// Fetches a specific content from the [TabNews] API.
  ///
  /// The [user] and [slug] are required parameters.
  ///
  /// ### Examples
  ///
  ///     import 'package:tabnews/tabnews.dart';
  ///
  ///     final tabNews = TabNews();
  ///
  ///     final (content, status, _) = await tabNews.getContent('user', 'slug');
  ///
  ///     if (status && content != null) {
  ///       print(content); // {id: ...}
  ///     }
  Future<Response<Content?>> getContent(String user, String slug) async {
    final response = await http.get(
      _apiUrl('/contents/$user/$slug'),
    );

    Content? content;
    final decoded = jsonDecode(response.body);
    ResponseError? error;

    if (response.statusCode == 200 && decoded is Map<String, dynamic>) {
      content = Content.fromJson(decoded);
    } else {
      error = _getError(decoded);
    }

    return (
      content,
      response.statusCode == 200,
      error,
    );
  }

  /// Also see [getContent].
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
  ///       final content = await tabNews.getContentOrThrow('user', 'slug');
  ///     } catch (error) {
  ///       print(error);
  ///     }
  Future<Content?> getContentOrThrow(String user, String slug) async {
    final (content, status, error) = await getContent(user, slug);

    if (status) {
      return content;
    } else {
      throw _orThrowException(error);
    }
  }

  /// Fetches the children of a specific content from the [TabNews] API.
  ///
  /// The [user] and [slug] are required parameters.
  ///
  /// ### Examples
  ///
  ///     import 'package:tabnews/tabnews.dart';
  ///
  ///     final tabNews = TabNews();
  ///
  ///     final (contents, status, _) = await tabNews.getContentChildren(
  ///       'user',
  ///       'slug',
  ///     );
  ///
  ///     if (status && contents != null) {
  ///       contents.forEach(print); // {id: ...} {id: ...} ...
  ///     }
  Future<Response<List<Content>?>> getContentChildren(
    String user,
    String slug,
  ) async {
    final response = await http.get(
      _apiUrl('/contents/$user/$slug/children'),
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

  /// Also see [getContentChildren].
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
  ///       final contents = await tabNews.getContentChildrenOrThrow(
  ///         'user',
  ///         'slug',
  ///       );
  ///       contents.forEach(print); // {id: ...} {id: ...} ...
  ///     } catch (error) {
  ///       print(error);
  ///     }
  Future<List<Content>?> getContentChildrenOrThrow(
    String user,
    String slug,
  ) async {
    final (contents, status, error) = await getContentChildren(user, slug);

    if (status) {
      return contents;
    } else {
      throw _orThrowException(error);
    }
  }
}
