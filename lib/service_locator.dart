import 'package:get_it/get_it.dart';
import 'package:spotidupe/data/repository/auth/auth_repository_impl.dart';
import 'package:spotidupe/data/sources/auth/auth_firebase_service.dart';
import 'package:spotidupe/domain/repository/auth/auth.dart';
import 'package:spotidupe/domain/usecases/auth/signup.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {

  sl.registerSingleton<AuthFirebaseService>(
    AuthFirebaseServiceImpl()
    );
  sl.registerSingleton<AuthRespository>(
    AuthRepositoryImpl()
    );
  sl.registerSingleton<SignupUseCase>(
    SignupUseCase()
    );

}