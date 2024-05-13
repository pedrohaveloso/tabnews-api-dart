import 'package:tabnews/src/tab_news.dart';

void main() async {
  final tabNews = TabNews();

  final (_, _) = await tabNews.createUser(
    username: "username",
    email: "email",
    password: "password",
  );

  tabNews.close();
}
