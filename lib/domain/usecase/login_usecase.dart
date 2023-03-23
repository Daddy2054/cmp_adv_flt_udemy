// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import '/app/functions.dart';
import '/data/network/failure.dart';
import '/data/request/request.dart';
import '/domain/model/model.dart';
import '/domain/repository/repository.dart';
import '/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Authentication> {
  Repository _repository;
  LoginUseCase(
    this._repository,
  );

  @override
  Future<Either<Failure, Authentication>> execute(
      LoginUseCaseInput input) async {
    DeviceInfo deviceInfo = await getDeviceDetails();

    return await _repository.login(
      LoginRequest(
        input.email,
        input.password,
        deviceInfo.identifier,
        deviceInfo.name,
      ),
    );
  }
}

class LoginUseCaseInput {
  String email;
  String password;
  LoginUseCaseInput(
    this.email,
    this.password,
  );
}
