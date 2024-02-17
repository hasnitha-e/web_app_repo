import 'package:api_integration_app/domain/di/injectable.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final getIt = GetIt.instance;
@InjectableInit()  
Future<void> configureInjenction() async {
  await $initGetIt(getIt,environment:Environment.prod);
  } 

