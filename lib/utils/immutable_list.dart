import 'dart:collection';

class ImmutableList<T> extends UnmodifiableListView<T> {
  ImmutableList(Iterable<T> source) : super(source.toList(growable: false));
}
