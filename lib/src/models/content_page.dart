/// The [ContentPage] class is used to represent a page of content. It has a
/// value that represents the page number.
///
/// The value must be greater than 0.
///
/// If the value is less than 1, the value will be set to 1.
///
/// ### Examples
///
///     import 'package:tabnews/tabnews.dart';
///
///     contentPage.value = 0;
///     print(contentPage.value); // 1
final class ContentPage {
  /// Creates a new [ContentPage] with the given [value].
  ContentPage(int value) {
    _value = _validValue(value);
  }

  late int _value;

  /// The value of the page.
  int get value => _value;

  /// Sets the value of the page.
  set value(int value) {
    _value = _validValue(value);
  }

  int _validValue(int value) {
    return switch (value) {
      < 1 => 1,
      int() => value,
    };
  }

  @override
  String toString() {
    return _value.toString();
  }
}
