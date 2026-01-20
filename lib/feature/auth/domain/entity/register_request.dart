class RegisterRequest {
  final String firsName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String phone;
  final String gender;

  RegisterRequest({
    required this.firsName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'firstName': firsName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'rePassword': confirmPassword,
      'phone': confirmPassword,
      'gender': confirmPassword,
    };
  }
}
