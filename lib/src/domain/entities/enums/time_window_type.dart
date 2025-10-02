enum TimeWindowType {
  day,
  week;

  bool get isDay => this == TimeWindowType.day;
  bool get isWeek => this == TimeWindowType.week;
}
