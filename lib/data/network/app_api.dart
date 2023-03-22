import 'package:cmp_adv_flt_udemy/data/responses/responses.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../../app/constant.dart';
part 'app_api.g.dart';

@RestApi(baseUrl: Constant.baseUrl)
abstract class AppServiceClient {
  factory AppServiceClient(Dio dio, {String baseUrl}) = _AppServiceClient;


@POST("/customer/login")
Future<AuthenticationResponse>login();

}