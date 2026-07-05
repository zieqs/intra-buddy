import '../../../../core/errors/failures.dart';
import '../entities/student_profile.dart';

abstract class ProfileRepository {
  Future<Result<StudentProfile>> loadProfile();
  Future<Result<StudentProfile>> updateProfile({
    required String fullName,
    String? phoneNumber,
  });
}
