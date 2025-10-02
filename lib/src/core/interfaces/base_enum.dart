// Base para enums con valores asociados
// Permite crear enums que tengan un valor string/int asociado para serialización/deserialización

/// {@template base_enum}
/// Clase base para enums con valores asociados y mapeo a entidades de dominio.
///
/// [E] es el tipo de entidad de dominio a la que se mapea
/// [V] es el tipo de valor (String, int, etc.) que viene del API
///
/// Ejemplo de uso:
/// ```dart
/// enum TimeWindowTypeModel implements BaseEnum<TimeWindowType, String> {
///   day('day'),
///   week('week');
///
///   const TimeWindowTypeModel(this.value);
///
///   @override
///   final String value;
///
///   @override
///   TimeWindowType toEntity() {
///     switch (this) {
///       case TimeWindowTypeModel.day:
///         return TimeWindowType.day;
///       case TimeWindowTypeModel.week:
///         return TimeWindowType.week;
///     }
///   }
///
///   static TimeWindowTypeModel? fromValue(String value) {
///     return TimeWindowTypeModel.values.cast<BaseEnum<TimeWindowType, String>>()
///         .findByValue(value) as TimeWindowTypeModel?;
///   }
/// }
/// ```
/// {@endtemplate}
abstract class BaseEnum<E, V> {
  /// El valor asociado al enum (puede ser String, int, etc.)
  V get value;

  /// Convierte el enum del modelo a la entidad de dominio
  E toEntity();
}

/// Extension para facilitar la búsqueda de enums por valor
extension BaseEnumExtension<E, V> on Iterable<BaseEnum<E, V>> {
  /// Busca el enum que tenga el [value] especificado
  BaseEnum<E, V>? findByValue(V value) {
    try {
      return firstWhere((e) => e.value == value);
    } catch (_) {
      return null;
    }
  }

  /// Convierte una lista de enums a lista de entidades
  List<E> toEntities() {
    return map((e) => e.toEntity()).toList();
  }
}

/// Mixin para facilitar la conversión desde valores
///
/// Ejemplo de uso:
/// ```dart
/// enum StatusModel with BaseEnumMixin<Status, String>
///     implements BaseEnum<Status, String> {
///   active('active'),
///   inactive('inactive');
///
///   const StatusModel(this.value);
///
///   @override
///   final String value;
///
///   @override
///   Status toEntity() {
///     switch (this) {
///       case StatusModel.active:
///         return Status.active;
///       case StatusModel.inactive:
///         return Status.inactive;
///     }
///   }
///
///   static StatusModel? fromValue(String value) =>
///     StatusModel.values.cast<BaseEnum<Status, String>>()
///         .findByValue(value) as StatusModel?;
/// }
/// ```
mixin BaseEnumMixin<E, V> on Enum implements BaseEnum<E, V> {}
