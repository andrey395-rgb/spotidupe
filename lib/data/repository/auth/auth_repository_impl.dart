import 'package:dartz/dartz.dart';
import 'package:spotidupe/data/models/auth/create_user_req.dart';
import 'package:spotidupe/data/sources/auth/auth_firebase_service.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';
import 'package:spotidupe/service_locator.dart';

class AuthRepositoryImpl extends AuthRespository{

   
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async { // calls auth from auth_firebase_service.dart / signup
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
  
}