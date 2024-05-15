import 'package:tabnews/src/tabnews.dart';

/// The status of a [TabNews] post.
///
/// For a post to be published, the status must be [published].
enum ContentStatus {
  /// The post has been published.
  published;

  /// Converts a [ContentStatus] to a [String] value.
  String get value {
    switch (this) {
      case published:
        return 'published';
    }
  }
}
