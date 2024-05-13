import 'package:tabnews/src/tabnews.dart';

void main() async {
  final tabNews = TabNews();

  tabNews.setDefaultContentStrategy();

  final (_, created) = await tabNews.createUser(
    username: "username",
    email: "email",
    password: "password",
  );

  print(created);

  final (_, posts) = await tabNews.getPosts(0);

  tabNews.close();
}
