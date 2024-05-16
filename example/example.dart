import 'package:tabnews/tabnews.dart';

void main() async {
  SimpleTabNews;

  final api = TabNews();

  final (contents, status, error) = await api.getContents(
    page: ContentPage(10),
    perPage: ContentPerPage(100),
  );

  final response = await api.getContentOrThrow("user", "slug");
}
