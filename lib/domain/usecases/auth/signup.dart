import 'package:dartz/dartz.dart';
import 'package:spotidupe/core/configs/usecase/usecase.dart';
import 'package:spotidupe/data/models/auth/create_user_req.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';
import 'package:spotidupe/service_locator.dart';

class SignupUseCase implements Usecase<Either,CreateUserReq>{
 
 
  @override
  Future<Either> call({CreateUserReq ? params}) async {
    return sl<AuthRespository>().signup(params!);
  }

}