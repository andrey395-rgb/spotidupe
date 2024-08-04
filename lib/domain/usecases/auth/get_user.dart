import 'package:dartz/dartz.dart';
import 'package:spotidupe/core/usecase/usecase.dart';
import 'package:spotidupe/data/models/auth/signin_user_req.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class GetUserUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await sl<AuthRespository>().getUser();
  }
}
