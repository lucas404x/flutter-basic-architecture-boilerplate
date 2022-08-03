class DecoratorUtils {
  /// This decorator was created specifically to ApiResponse['result'].
  /// For this reason, the default [key] is 'result'.
  /// 
  /// Sometimes you need to serialize a list of [T] and ApiResponse does not support it.
  /// 
  /// Null is returned if the [key] doesn't exist or map[key] is not a List.
  static List<T>? Function(Map) mapperWithApiResultList<T>({
    required T Function(Map map) mapper,
    String key = 'result',
  }) {
    return (Map map) {
      List? list = (map[key] as List?);
      if (list == null) {
        return null;
      }

      return _applyMapperForEachItem<T>(list, mapper);
    };
  }

  /// This decorator was created to be used in any moment when you want
  /// apply a [mapper] for each item in a list.
  static List<T> Function(List) mapperWithListDecorator<T>({
    required T Function(Map map) mapper,
  }) {
    return (List list) {
      return _applyMapperForEachItem<T>(list, mapper);
    };
  }

  static List<T> _applyMapperForEachItem<T>(List list, T Function(Map map) mapper) 
    => list.map((e) => mapper(e)).cast<T>().toList();
}
