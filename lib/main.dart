// ignore_for_file: prefer_const_constructors

import 'package:eshopbackend/app_router.dart';
import 'package:eshopbackend/blocs/cubits/login/login_cubit.dart';
import 'package:eshopbackend/features/blocs/auth/auth_bloc.dart';
import 'package:eshopbackend/features/blocs/cubits/signup/signup_cubit.dart';
import 'package:eshopbackend/features/blocs/user/user_bloc.dart';
import 'package:eshopbackend/features/blocs/user/user_event.dart';
import 'package:eshopbackend/features/repositories/auth/auth_repository.dart';
import 'package:eshopbackend/features/repositories/services/storage_service.dart';
import 'package:eshopbackend/features/repositories/user/user_repository.dart';
import 'package:eshopbackend/features/screens/signup/signup_screen.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_bloc.dart';
import 'package:eshopbackend/screens/actualite/blocs/actualite_event.dart';
import 'package:eshopbackend/screens/actualite/repositories/actualite_repository.dart';
import 'package:eshopbackend/screens/home_screen.dart';
import 'package:eshopbackend/screens/login/login_screen.dart';
import 'package:eshopbackend/screens/new_product_screen.dart';
import 'package:eshopbackend/screens/products_screen.dart';
import 'package:eshopbackend/screens/reservation/orders_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await Firebase.initializeApp();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black26));

  runApp(
      // ignore: prefer_const_literals_to_create_immutables

      MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  final AppRouter appRouter;

  const MyApp({
    super.key,
    required this.appRouter,
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: appRouter.generateRoute,
      debugShowCheckedModeBanner: false,
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserRepository(),
          ),
          RepositoryProvider(
            create: (context) => AuthRepository(
              userRepository: context.read<UserRepository>(),
            ),
          ),
          RepositoryProvider(
            create: (context) => StorageRepository(),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => AuthBloc(
                  authRepository: context.read<AuthRepository>(),
                  userRepository: context.read<UserRepository>(),
                  storageRepository: context.read<StorageRepository>()),
            ),
            BlocProvider(
              create: (context) => SignupCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => LoginCubit(
                authRepository: context.read<AuthRepository>(),
              ),
            ),
            BlocProvider(
              create: (context) => UserBloc(
                userRepository: UserRepository(),
              )..add(LoadUsers()),
            ),
            BlocProvider(
              create: (context) =>
                  ActualiteBloc(actualiteRepository: ActualiteRepository())
                    ..add(const LoadActualite()),
            ),
          ],
          child: GetMaterialApp(
              debugShowCheckedModeBanner: false,
              onGenerateRoute: appRouter.generateRoute,
              home: LoginScreen(),
              routes: {
                "home_screen": (context) => HomeScreen(),
              },
              getPages: [
                GetPage(name: '/actualites', page: () => ActualitesScreen()),
                GetPage(name: '/newproduct', page: () => NewProductScreen()),
                GetPage(name: '/orders', page: () => OrdersScreen()),
              ]),
        ),
      ),
    );
  }
}
