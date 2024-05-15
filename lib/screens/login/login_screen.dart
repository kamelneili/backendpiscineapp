import 'package:eshopbackend/features/widgets/custom_buttom.dart';
import 'package:eshopbackend/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:get/get.dart';

import '../../blocs/cubits/login/login_cubit.dart';

//import '/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = '/loginScreen';

  const LoginScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (context) => const LoginScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: 'Login'),
      //  bottomNavigationBar: CustomNavBar(screen: routeName),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: SizedBox(
                  height: 150,
                  width: 150,
                  child: Image(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/admin.png'),
                  ),
                ),
              ),
              _EmailInput(),
              const SizedBox(height: 10),
              _PasswordInput(),
              const SizedBox(height: 10),

              Text(
                'Login',
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.white,
                    ),
              ),

              CustomButton(

                  //
                  title: 'se connecter',
                  onTap: () async {
                    //
                    await context.read<LoginCubit>().logInWithCredentials();
                    final user = auth.FirebaseAuth.instance.currentUser;
                    print(user);
                    if (user == null) {
                      const snackBar = SnackBar(
                          content: Text('You are not registered yet',
                              style: TextStyle(color: Colors.pinkAccent)));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      const snackBar = SnackBar(
                          content: Text('Connecté entant que Admin !!!',
                              style: TextStyle(color: Colors.green)));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);

                      //  context.read<ProfileBloc>().add(
                      //    LoadProfile(context.read<AuthBloc>().state.authUser));
                      //Navigator.pushNamed(context, '/home');
                      Get.to(() => const HomeScreen());
                    }
                  }),

              const SizedBox(height: 10),

              //   _GoogleLoginButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return TextField(
          onChanged: (email) {
            context.read<LoginCubit>().emailChanged(email);
          },
          decoration: const InputDecoration(labelText: 'Email'),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      buildWhen: (previous, current) => previous.password != current.password,
      builder: (context, state) {
        return TextField(
          onChanged: (password) {
            context.read<LoginCubit>().passwordChanged(password);
          },
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        );
      },
    );
  }
}

// class _GoogleLoginButton extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return ElevatedButton(
//       onPressed: () {
//         context.read<LoginCubit>().logInWithGoogle();
//       },
//       style: ElevatedButton.styleFrom(
//         shape: RoundedRectangleBorder(),
//         primary: Colors.white,
//         fixedSize: Size(200, 40),
//       ),
//       child: Text(
//         'Sign In with Google',
//         style: Theme.of(context).textTheme.headline4!.copyWith(
//               color: Colors.black,
//             ),
//       ),
//     );
//   }
// }
