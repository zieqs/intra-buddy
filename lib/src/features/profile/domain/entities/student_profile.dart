class StudentProfile {
  final String id;
  final String email;
  final String fullName;
  final String? studentId;
  final String? phoneNumber;
  final String? avatarUrl;

  const StudentProfile({
    required this.id,
    required this.email,
    required this.fullName,
    this.studentId,
    this.phoneNumber,
    this.avatarUrl,
  });
}
