import 'package:tabnews/src/tabnews.dart';

/// The content strategies used by [TabNews] content route.
///
/// ### Examples
///
///     import 'package:tabnews/tabnews.dart';
///
///     const tabNews = TabNews(
///       contentStrategy: ContentStrategy.relevantContent
///     );
enum ContentStrategy {
  /// Returns the most recent posts.
  newContent,

  /// Returns the oldest posts.
  oldContent,

  /// Returns the most relevant posts.
  relevantContent;

  /// Converts a [ContentStrategy] to a [String] value.
  String get value {
    switch (this) {
      case newContent:
        return 'new';

      case oldContent:
        return 'old';

      case relevantContent:
        return 'relevant';
    }
  }
}
