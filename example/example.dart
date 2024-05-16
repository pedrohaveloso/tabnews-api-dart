import 'package:tabnews/tabnews.dart';

void main() async {
  final tabNews = TabNews()
    ..defaultContentStrategy = ContentStrategy.newContent;

  final (contents, status, error) = await tabNews.getContents(perPage: 1000);

  if (status) {
    contents!.forEach(print);
  } else {
    print(error!.message);
    print(error!.action);
  }

  // try {
  //   final contents = await tabNews.getContentsForced(perPage: 1000);
  // } catch (error) {
  //   print(error);
  // }
}
