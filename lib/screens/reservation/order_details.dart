import 'package:eshopbackend/config/constants.dart';
import 'package:eshopbackend/config/custom_text_form_field.dart';
import 'package:eshopbackend/features/blocs/auth/auth_bloc.dart';
import 'package:eshopbackend/features/widgets/custom_buttom.dart';
import 'package:eshopbackend/translations/locale_keys.g.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/profile/profile_bloc.dart';

class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';

  const ProfileScreen({super.key});

  // static Route route() {
  //   return MaterialPageRoute(
  //     settings: RouteSettings(name: routeName),
  //     builder: (context) => BlocProvider<ProfileBloc>(
  //       create: (context) => ProfileBloc(
  //         authBloc: BlocProvider.of<AuthBloc>(context),
  //         userRepository: context.read<UserRepository>(),
  //       )..add(
  //           LoadProfile(context.read<AuthBloc>().state.authUser),
  //         ),
  //       child: ProfileScreen(),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: CustomAppBar(title: 'Profile'),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          "profil",
          style: kEncodeSansBold.copyWith(color: kBlackColor),
        ),
      ),
      // bottomNavigationBar: CustomNavBar(screen: routeName),
      body: BlocBuilder<ProfileBloc, ProfileState>(
        builder: (context, state) {
          print("profilscreen");

          if (state is ProfileLoading) {
            return const Center(
              child: CircularProgressIndicator(color: Colors.black),
            );
          }
          if (state is ProfileLoaded) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "personalInformation",
                    style: kEncodeSansSemiBold.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  CustomTextFormField(
                    title: "email",
                    initialValue: state.user.email,
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    title: "name",
                    initialValue: state.user.fullName,
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    title: "adress",
                    initialValue: state.user.address,
                  ),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    title: "city",
                    initialValue: state.user.city,
                  ),
                  const SizedBox(height: 5),
                  const SizedBox(height: 5),
                  CustomTextFormField(
                    title: "zip",
                    initialValue: state.user.zipCode,
                    onChanged: (value) {},
                  ),
                  Expanded(child: Container()),
                  Center(
                    child: CustomButton(
                      title: 'Back to home',
                      onTap: () {
                        Navigator.pushNamed(context, '/home');
                      },
                    ),
                  ),
                ],
              ),
            );
          }
          if (state is ProfileUnauthenticated) {
            print(state.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      'You are not logged in!',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const SizedBox(
                  height: 8,
                ),
              ],
            );
          } else {
            return const Text('Something went wrong');
          }
        },
      ),
    );
  }
}
