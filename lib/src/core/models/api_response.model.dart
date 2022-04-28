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
  /// If map['result'] is a list, It'll pass the [map] itself to [fromMapResult] instead of try get 'result' value.
  factory ApiResponse.fromMap({
    required Map map,
    T Function(Map)? fromMapResult,
  }) {
    return ApiResponse(
      result: map['result'] is T
          ? map['result']
          : fromMapResult?.call(map['result'] is List ? map : map['result']),
      status: Status.fromMap(map['status'] ?? {}),
    );
  }
}

class Status {
  final int statusCode;
  final String message;

  Status({
    required this.statusCode,
    required this.message,
  });

  factory Status.fromMap(Map map) => Status(
        statusCode: map['statusCode'] ?? 0,
        message: map['message'] ?? '',
      );
}
