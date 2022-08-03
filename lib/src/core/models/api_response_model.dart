class ApiResponse<T> {
  final T? result;
  final String error;

  ApiResponse({
    required this.result,
    required this.error,
  });

  /// You must pass [mapper] callback if [T] is a Map.
  /// If you know It's a primitive type, It is not required.
  factory ApiResponse.fromMap({
    required Map map,
    T? Function(Map)? mapper,
  }) {
    T? result;
    if (map['result'] is T) {
      result = map['result'];
    } else if (map['result'] != null) {
      bool isResultAList = map['result'].runtimeType == List;
      result = mapper?.call(isResultAList ? map : map['result']);
    }

    return ApiResponse(
      result: result,
      error: map['error'] ?? '',
    );
  }
  
}
