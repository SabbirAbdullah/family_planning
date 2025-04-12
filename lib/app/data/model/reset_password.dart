class ChangePasswordRequest {
  final String oldPassword;
  final String newPassword;
  final String empId;

  ChangePasswordRequest({
    required this.oldPassword,
    required this.newPassword,
    required this.empId,
  });

  Map<String, dynamic> toJson() {
    return {
      'oldPassword': oldPassword,
      'newPassword': newPassword,
      'emp_id': empId,
    };
  }
}

class ChangePasswordResponse {
  final String message;

  ChangePasswordResponse({required this.message});

  factory ChangePasswordResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordResponse(
      message: json['message'],
    );
  }
}
