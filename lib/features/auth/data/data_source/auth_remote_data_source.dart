import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:final_project/config/constants/api_endpoints.dart';
import 'package:final_project/core/failure/failure.dart';
import 'package:final_project/core/network/http_service.dart';
import 'package:final_project/features/auth/data/model/auth_api_model.dart';
import 'package:final_project/features/auth/domain/entity/auth_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final authRemoteDataSourceProvider = Provider.autoDispose<AuthRemoteDataSource>((ref) => AuthRemoteDataSource(dio: ref.read(httpServiceProvider)));
class AuthRemoteDataSource {
  final Dio dio;

  AuthRemoteDataSource({required this.dio});
  Future<Either<Failure, bool>> register(AuthEntity student) async {
    try {
      AuthAPIModel apiModel = AuthAPIModel.fromEntity(student);
      Response response = await dio.post(
        ApiEndpoints.register,
        data: {
          "firstName": apiModel.firstName,
          "lastName": apiModel.lastName,
          "email": apiModel.email,
          "password": apiModel.password,
        },

      );
      if (response.statusCode == 200) {
        return const Right(true);
      } else {
        return Left(
          Failure(
            error: response.data["message"],
            statusCode: response.statusCode.toString(),
          ),
        );
      }
    } on DioException catch (e) {
      return Left(
        Failure(
          error: e.error.toString(),
          statusCode: e.response?.statusCode.toString() ?? '0',
        ),
      );
    }
  }

}
 
