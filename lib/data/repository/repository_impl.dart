import 'package:dartz/dartz.dart';

import '/data/data_source/remote_data_source.dart';
import '/data/mapper/mapper.dart';
import '/data/network/network_info.dart';
import '../../domain/model.dart';
import '../../domain/repository.dart';
import '../network/failure.dart';
import '../request/request.dart';

class RepositoryImpl extends Repository {
  RemoteDataSource _remoteDataSource;
  NetworkInfo _networkInfo;
  RepositoryImpl(this._remoteDataSource, this._networkInfo);
  @override
  Future<Either<Failure, Authentication>> login(
      LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      //its safe to call the API
      final response = await _remoteDataSource.login(loginRequest);
      if (response.status == 0) //success
      {
        //return data (success)
        //return right
        return Right(response.toDomain());
      } else {
        // return business logic error
        return Left(
          Failure(
            409,
            response.message ?? 'we have biz logic error from API side',
          ),
        );
      }
    } else {
      //return connection error
      return Left(
        Failure(
          501,
          'please check your internet connection',
        ),
      );
    }
  }
}
