import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/profile_bloc.dart';
import 'components/profile_menu.dart';
import 'components/profile_pic.dart';

class ProfileScreen extends StatelessWidget {
  static String routeName = "/profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileBloc bloc = ProfileBloc();
    return BlocProvider(
      create: (context) => ProfileBloc()..add(GetUserEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Profile"),
        ),
        body: BlocConsumer<ProfileBloc, ProfileState>(
          listener: (context, state) {},
          bloc: bloc,
          builder: (context, state) {
            if (state is DetailsLoadingState) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.deepOrange,
                ),
              );
            } else if (state is DetailsLoadedState) {
              SingleChildScrollView(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    const ProfilePic(),
                    const SizedBox(height: 15),
                    Text(
                      state.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          fontStyle: FontStyle.italic),
                    ),
                    Text(
                      state.email,
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15,
                          fontStyle: FontStyle.italic),
                    ),
                    ProfileMenu(
                      text: "My Account",
                      icon: "assets/icons/User Icon.svg",
                      press: () => {},
                    ),
                    ProfileMenu(
                      text: "Notifications",
                      icon: "assets/icons/Bell.svg",
                      press: () {},
                    ),
                    ProfileMenu(
                      text: "Settings",
                      icon: "assets/icons/Settings.svg",
                      press: () {},
                    ),
                    ProfileMenu(
                      text: "Help Center",
                      icon: "assets/icons/Question mark.svg",
                      press: () {},
                    ),
                    ProfileMenu(
                      text: "Log Out",
                      icon: "assets/icons/Log out.svg",
                      press: () {},
                    ),
                  ],
                ),
              );
            } else if (state is DetailsLoadingErrorState) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              );
            }
              return Center(
                child: SizedBox(
                  child: Text("empty"),
                ),
              );

          },
        ),
      ),
    );
  }
}
