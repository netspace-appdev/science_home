import 'package:collection/collection.dart';

enum SubcriptionType {
  month1,
  month3,
  month6,
  month12,
  lifetime,
}

extension FFEnumExtensions<T extends Enum> on T {
  String serialize() => name;
}

extension FFEnumListExtensions<T extends Enum> on Iterable<T> {
  T? deserialize(String? value) =>
      firstWhereOrNull((e) => e.serialize() == value);
}

T? deserializeEnum<T>(String? value) {
  switch (T) {
    case (SubcriptionType):
      return SubcriptionType.values.deserialize(value) as T?;
    default:
      return null;
  }
}
