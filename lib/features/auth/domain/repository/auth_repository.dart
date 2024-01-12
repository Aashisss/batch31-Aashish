



import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/data/repository/auth_remote_repository_impl.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider.autoDispose<AuthRepository>((ref) => ref.read(authRemoteRepositoryProvider));

abstract class AuthRepository {
  Future<Either<Failure, bool>> register(AuthEntity user);
}