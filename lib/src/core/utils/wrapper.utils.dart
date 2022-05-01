class WrapperUtils {
  /// This wrapper was created specifically to ApiResponse['result'].
  /// Sometimes you need serialize a list of [T] and ApiResponse does not support it.
  /// For this reason, the default [key] is 'result'.
  static List<T> Function(Map) fromMapWithList<T>({
    required T Function(Map element) mapper,
    String key = 'result',
  }) {
    return (Map map) {
      return (map[key] as List).map((e) => mapper(e)).cast<T>().toList();
    };
  }
}
