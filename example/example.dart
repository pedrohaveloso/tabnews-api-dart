// ignore_for_file: avoid_print

import 'package:tabnews/tabnews.dart';

final api = TabNews();

void main() async {
  await getContents();
  // await getContentsOrThrow();
}

Future<void> getContents() async {
  final (contents, status, error) = await api.getContent(
    'pedrohaveloso',
    'criando-uma-api-simples-com-php-puro',
  );

  if (status) {
    print(contents);
    // (contents ?? []).forEach(print);
  } else {
    print(error);
  }
}

Future<void> getContentsOrThrow() async {
  try {
    final contents = await api.getContentsOrThrow();
    (contents ?? []).forEach(print);
  } catch (error) {
    print(error);
  }
}
