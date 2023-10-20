class CustomErrorResponse {
  final List<ErrorResponse>? errors;

  CustomErrorResponse({
    this.errors,
  });

  factory CustomErrorResponse.fromJson(Map<String, dynamic> json) =>
      CustomErrorResponse(
        errors: json['errors'] == null
            ? []
            : List<ErrorResponse>.from(
                json['errors']!.map((x) => ErrorResponse.fromJson(x))),
      );
}

class ErrorResponse {
  final String? error;

  ErrorResponse({
    this.error,
  });

  factory ErrorResponse.fromJson(Map<String, dynamic> json) => ErrorResponse(
        error: json['error'],
      );
}
