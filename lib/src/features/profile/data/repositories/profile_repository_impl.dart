import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../domain/entities/student_profile.dart';
import '../../domain/repositories/profile_repository.dart';
import '../datasources/profile_remote_datasource.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileRemoteDataSource dataSource;

  ProfileRepositoryImpl(this.dataSource);

  @override
  Future<Result<StudentProfile>> loadProfile() async {
    try {
      final data = await dataSource.loadProfile();
      return Right(
        StudentProfile(
          id: data['id'] as String,
          email: data['email'] as String? ?? '',
          fullName: data['full_name'] as String? ?? '',
          studentId: data['student_id'] as String?,
          phoneNumber: data['phone_number'] as String?,
          avatarUrl: data['avatar_url'] as String?,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<StudentProfile>> updateProfile({
    required String fullName,
    String? phoneNumber,
  }) async {
    try {
      final data = await dataSource.updateProfile(
        fullName: fullName,
        phoneNumber: phoneNumber,
      );
      return Right(
        StudentProfile(
          id: data['id'] as String,
          email: data['email'] as String? ?? '',
          fullName: data['full_name'] as String? ?? '',
          studentId: data['student_id'] as String?,
          phoneNumber: data['phone_number'] as String?,
          avatarUrl: data['avatar_url'] as String?,
        ),
      );
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
