import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:spotidupe/data/models/auth/create_user_req.dart';

abstract class AuthFirebaseService{

  Future<Either<String, String>> signup(CreateUserReq createUserReq);
  
  Future<void> signin();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService{
 
  @override
  Future<void> signin() {
    // TODO: implement signin
    throw UnimplementedError();
  }

  @override
  Future<Either<String, String>> signup(CreateUserReq createUserReq) async {
    try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email, 
        password: createUserReq.password
        );

        return const Right('Signup was successful!');

    }on FirebaseAuthException catch(e){
      String message = '';

      if(e.code == 'weak-password'){
        message = 'The password provided is too weak';
      } else if(e.code == 'email-already-in-use'){
        message = 'An account already exists with that email';
      }

      return Left(message);
    }
  }
  
}