import 'dart:convert';
import 'package:tabnews/src/models/content_status.dart';
import 'package:tabnews/src/tabnews.dart';

/// Represents a [TabNews] post.
class Content {
  /// Creates a new [Content] instance.
  Content({
    this.id,
    this.ownerId,
    this.parentId,
    this.slug,
    this.title,
    this.status,
    this.sourceUrl,
    this.createdAt,
    this.updatedAt,
    this.publishedAt,
    this.deletedAt,
    this.ownerUsername,
    this.tabcoins,
    this.tabcoinsCredit,
    this.tabcoinsDebit,
    this.childrenDeepCount,
  });

  /// Creates a new [Content] instance from a JSON [String].
  ///
  /// If the decoded JSON is invalid (not a [Map]), returns empty [Content].
  ///
  /// ### Examples:
  ///
  ///     import 'package:tabnews/tabnews.dart';
  ///
  ///     var content = Content.fromJson("{\"owner_id\": \"ABC\"}");
  ///     print(content.ownerId) // "ABC"
  ///
  ///     content = Content.fromJson("ABC");
  ///     print(content.ownerId) // null
  factory Content.fromJson(String json) {
    final decoded = jsonDecode(json);

    if (decoded is Map<String, dynamic>) {
      return Content(
        id: decoded['id'] as String?,
        ownerId: decoded['owner_id'] as String?,
        parentId: decoded['parent_id'] as String?,
        slug: decoded['slug'] as String?,
        title: decoded['title'] as String?,
        status: ContentStatus.values
            .where((status) => status.value == decoded['status'])
            .first,
        sourceUrl: decoded['source_url'] as String?,
        ownerUsername: decoded['owner_username'] as String?,
        createdAt: DateTime.tryParse(
          decoded['created_at'] as String? ?? '',
        ),
        updatedAt: DateTime.tryParse(
          decoded['updated_at'] as String? ?? '',
        ),
        publishedAt: DateTime.tryParse(
          decoded['published_at'] as String? ?? '',
        ),
        deletedAt: DateTime.tryParse(
          decoded['deleted_at'] as String? ?? '',
        ),
        tabcoins: decoded['tabcoins'] as int?,
        tabcoinsCredit: decoded['tabcoins_credit'] as int?,
        tabcoinsDebit: decoded['tabcoins_debit'] as int?,
        childrenDeepCount: decoded['children_deep_count'] as int?,
      );
    } else {
      return Content();
    }
  }

  /// The ID of the post. Is a UUID.
  final String? id;

  /// The ID of the post owner. Is a UUID.
  final String? ownerId;

  /// The ID of the parent post. Is a UUID.
  final String? parentId;

  /// The slug of the post.
  ///
  /// ### Example:
  ///
  /// Post title: `TabNews Hello World`, slug: `tabnews-hello-world`.
  final String? slug;

  /// The title of the post.
  final String? title;

  /// The status of the post.
  final ContentStatus? status;

  /// The source URL of the post.
  ///
  /// ### Examples:
  ///
  /// Post URL: https://tabnews.com.br/username/tabnews-hello-world.
  final String? sourceUrl;

  /// The creation date of the post.
  final DateTime? createdAt;

  /// The last update date of the post.
  final DateTime? updatedAt;

  /// The publication date of the post.
  final DateTime? publishedAt;

  /// The deletion date of the post.
  final DateTime? deletedAt;

  /// The username of the post owner.
  final String? ownerUsername;

  /// The amount of tabcoins of the post.
  final int? tabcoins;

  /// The amount of tabcoins that was credited to the post.
  final int? tabcoinsCredit;

  /// The amount of tabcoins that was debited from the post.
  final int? tabcoinsDebit;

  /// The number of children deep of the post.
  final int? childrenDeepCount;

  /// Converts a [Content] to a [String] JSON value.
  String toJson() {
    return jsonEncode({
      'id': id,
      'owner_id': ownerId,
      'parent_id': parentId,
      'slug': slug,
      'title': title,
      'status': status,
      'source_url': sourceUrl,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'published_at': publishedAt,
      'deleted_at': deletedAt,
      'owner_username': ownerUsername,
      'tabcoins': tabcoins,
      'tabcoins_credit': tabcoinsCredit,
      'tabcoins_debit': tabcoinsDebit,
      'children_deep_count': childrenDeepCount,
    });
  }
}
