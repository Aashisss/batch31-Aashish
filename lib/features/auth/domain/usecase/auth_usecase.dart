

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:final_project/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authUseCaseProvider = Provider.autoDispose<AuthUseCase>((ref) => AuthUseCase(authRepository: ref.read(authRepositoryProvider)));
class AuthUseCase{
  final AuthRepository authRepository;

  AuthUseCase({
    required this.authRepository
  });


  Future<Either<Failure,bool>> addUser(AuthEntity user) async{
    return await authRepository.register(user);
    
  }
}