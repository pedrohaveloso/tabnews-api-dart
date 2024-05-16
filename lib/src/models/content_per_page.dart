/// The [ContentPerPage] class is used to set the number of contents per page.
///
/// The value must be between 1 and 100.
///
/// If the value is greater than 100, the value will be set to 100.
/// If the value is less than 1, the value will be set to 1.
///
/// ### Examples
///
///     import 'package:tabnews/tabnews.dart';
///
///     final contentPerPage = ContentPerPage(101);
///     print(contentPerPage.value); // 100
///
///     contentPerPage.value = 0;
///     print(contentPerPage.value); // 1
final class ContentPerPage {
  /// Creates a new [ContentPerPage] with the given [value].
  ContentPerPage(int value) {
    _value = _validValue(value);
  }

  late int _value;

  /// The value of the number of contents per page.
  int get value => _value;

  /// Sets the value of the number of contents per page.
  set value(int value) {
    _value = _validValue(value);
  }

  int _validValue(int value) {
    return switch (value) {
      > 100 => 100,
      < 1 => 1,
      int() => value,
    };
  }

  @override
  String toString() {
    return _value.toString();
  }
}
