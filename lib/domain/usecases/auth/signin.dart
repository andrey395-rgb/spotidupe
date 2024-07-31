import 'package:dartz/dartz.dart';
import 'package:spotidupe/core/configs/usecase/usecase.dart';
import 'package:spotidupe/data/models/auth/signin_user_req.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SigninUseCase implements Usecase<Either,SigninUserReq> {


  @override
  Future<Either> call({SigninUserReq ? params}) async {
    return sl<AuthRespository>().signin(params!);
  }

}