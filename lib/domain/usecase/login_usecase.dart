// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cmp_adv_flt_udemy/data/request/request.dart';
import 'package:dartz/dartz.dart';

import '/data/network/failure.dart';
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
    await _repository.login(
      LoginRequest(
        input.email,
        input.password,
        'imei',
        'deviceType',
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
