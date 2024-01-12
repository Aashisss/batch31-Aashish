

import 'package:dartz/dartz.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:final_project/features/auth/domain/repository/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authRemoteRepositoryProvider = Provider.autoDispose<AuthREemoteRepositoryImpl>((ref) => 
 AuthREemoteRepositoryImpl(authRemoteDataSource: ref.read(authRemoteDataSourceProvider)) 
);

class AuthREemoteRepositoryImpl implements AuthRepository{
  final AuthRemoteDataSource authRemoteDataSource;

  AuthREemoteRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, bool>> register(AuthEntity user) {
    // TODO: implement register
    return authRemoteDataSource.register(user);
    // throw UnimplementedError();
  }

}