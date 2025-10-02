import 'package:movie_app/src/core/foundation.dart';
import 'package:movie_app/src/domain/entities/entities.dart';

enum TimeWindowTypeModel implements BaseEnum<TimeWindowType, String> {
  day('day'),
  week('week');

  const TimeWindowTypeModel(this.value);

  @override
  final String value;

  @override
  TimeWindowType toEntity() {
    switch (this) {
      case TimeWindowTypeModel.day:
        return TimeWindowType.day;
      case TimeWindowTypeModel.week:
        return TimeWindowType.week;
    }
  }

  static TimeWindowTypeModel? fromEntity(TimeWindowType entity) {
    return TimeWindowTypeModel.values.firstWhere(
      (e) => e.toEntity() == entity,
      orElse: () => TimeWindowTypeModel.day,
    );
  }

  static TimeWindowTypeModel? fromValue(String value) {
    return TimeWindowTypeModel.values
            .cast<BaseEnum<TimeWindowType, String>>()
            .findByValue(value)
        as TimeWindowTypeModel?;
  }
}
