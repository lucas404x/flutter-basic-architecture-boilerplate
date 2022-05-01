class ApiResponse<T> {
  final T? result;
  final Status? status;

  ApiResponse({
    required this.result,
    required this.status,
  });

  /// You must pass [fromMapResult] callback if [T] is a Map.
  /// If you know It's a primitive type, It is not required.
  ///
  /// If [T] is a list, It'll pass the [map] itself to [fromMapResult] instead of try get 'result' value.
  factory ApiResponse.fromMap({
    required Map map,
    T Function(Map)? mapper,
  }) {
    T? result;
    if (map['result'] is T) {
      result = map['result'];
    } else {
      bool isResultAList = map['result'].runtimeType == List;
      result = mapper?.call(isResultAList ? map : map['result']);
    }

    return ApiResponse(
      result: result,
      status: Status.fromMap(map['status'] ?? {}),
    );
  }
  
}

class Status {
  final int code;
  final String message;

  Status({
    required this.code,
    required this.message,
  });

  factory Status.fromMap(Map map) => Status(
        code: map['code'] ?? 0,
        message: map['message'] ?? '',
      );
}
