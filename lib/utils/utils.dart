extension IntUtils on int? {
  int? get divideByMillion => this == null ? null : this! ~/ 1000000;
}
