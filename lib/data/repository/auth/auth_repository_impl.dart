import 'package:dartz/dartz.dart';
import 'package:spotidupe/data/models/auth/create_user_req.dart';
import 'package:spotidupe/data/models/auth/signin_user_req.dart';
import 'package:spotidupe/data/sources/auth/auth_firebase_service.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';
import 'package:spotidupe/service_locator.dart';

class AuthRepositoryImpl extends AuthRespository{

   
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async { // calls auth from auth_firebase_service.dart / signin
    return await sl<AuthFirebaseService>().signin(signinUserReq);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async { // calls auth from auth_firebase_service.dart / signup
    return await sl<AuthFirebaseService>().signup(createUserReq);
  }
  
  @override
  Future<Either> getUser() async {
    return await sl<AuthFirebaseService>().getUser();
  }

  
}