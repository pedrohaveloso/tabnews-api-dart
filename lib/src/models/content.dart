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
    this.body,
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
  ///     var content = Content.fromJson({"owner_id": "ABC"});
  ///     print(content.ownerId) // "ABC"
  ///
  ///     content = Content.fromJson({"ABC": ""});
  ///     print(content.ownerId) // null
  factory Content.fromJson(Map<String, dynamic>? map) {
    if (map == null) {
      return Content();
    } else {
      return Content(
        id: map['id'] as String?,
        body: map['body'] as String?,
        ownerId: map['owner_id'] as String?,
        parentId: map['parent_id'] as String?,
        slug: map['slug'] as String?,
        title: map['title'] as String?,
        status: ContentStatus.values
            .where((status) => status.value == map['status'])
            .first,
        sourceUrl: map['source_url'] as String?,
        ownerUsername: map['owner_username'] as String?,
        createdAt: DateTime.tryParse(
          map['created_at'] as String? ?? '',
        ),
        updatedAt: DateTime.tryParse(
          map['updated_at'] as String? ?? '',
        ),
        publishedAt: DateTime.tryParse(
          map['published_at'] as String? ?? '',
        ),
        deletedAt: DateTime.tryParse(
          map['deleted_at'] as String? ?? '',
        ),
        tabcoins: map['tabcoins'] as int?,
        tabcoinsCredit: map['tabcoins_credit'] as int?,
        tabcoinsDebit: map['tabcoins_debit'] as int?,
        childrenDeepCount: map['children_deep_count'] as int?,
      );
    }
  }

  /// The ID of the post. Is a UUID.
  String? id;

  /// The ID of the post owner. Is a UUID.
  String? ownerId;

  /// The ID of the parent post. Is a UUID.
  String? parentId;

  /// The slug of the post.
  ///
  /// ### Example:
  ///
  /// Post title: `TabNews Hello World`, slug: `tabnews-hello-world`.
  String? slug;

  /// The title of the post.
  String? title;

  /// The status of the post.
  ContentStatus? status;

  /// The source URL of the post.
  ///
  /// ### Examples:
  ///
  /// Post URL: https://tabnews.com.br/username/tabnews-hello-world.
  String? sourceUrl;

  /// The creation date of the post.
  DateTime? createdAt;

  /// The last update date of the post.
  DateTime? updatedAt;

  /// The publication date of the post.
  DateTime? publishedAt;

  /// The body of the post.
  String? body;

  /// The deletion date of the post.
  DateTime? deletedAt;

  /// The username of the post owner.
  String? ownerUsername;

  /// The amount of tabcoins of the post.
  int? tabcoins;

  /// The amount of tabcoins that was credited to the post.
  int? tabcoinsCredit;

  /// The amount of tabcoins that was debited from the post.
  int? tabcoinsDebit;

  /// The number of children deep of the post.
  int? childrenDeepCount;

  /// Converts a [Content] to a [Map] JSON value.
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'owner_id': ownerId,
      'parent_id': parentId,
      'slug': slug,
      'title': title,
      'status': status,
      'body': body,
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
    };
  }

  @override
  String toString() {
    return toMap().toString();
  }
}
