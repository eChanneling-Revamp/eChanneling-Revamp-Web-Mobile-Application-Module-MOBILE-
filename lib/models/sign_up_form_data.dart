// lib/models/sign_up_form_data.dart

class SignUpFormData {
  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final String nicOrPassportNumber;
  final bool isPremium;

  SignUpFormData({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.nicOrPassportNumber,
    required this.isPremium,
  });
}