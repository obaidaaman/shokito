import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/init_screen.dart';
import 'package:shop_app/screens/sign_up/bloc/sign_up_bloc.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../complete_profile/complete_profile_screen.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController address = TextEditingController();

  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSubmitted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InitScreen(
                        UserId: state.id.toString(),
                      )));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              controller: name,
              keyboardType: TextInputType.name,
              onChanged: (value) {
                BlocProvider.of<SignUpBloc>(context)
                    .add(TextFieldChangeEvent(email.text, password.text));
              },
              decoration: const InputDecoration(
                labelText: "Name",
                hintText: "Enter your Name",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: email,
              obscureText: false,
              onChanged: (value) {
                BlocProvider.of<SignUpBloc>(context)
                    .add(TextFieldChangeEvent(email.text, password.text));
              },
              decoration: const InputDecoration(
                labelText: "Email",
                hintText: "Enter your Email",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              controller: password,
              obscureText: true,
              onChanged: (value) {
                BlocProvider.of<SignUpBloc>(context)
                    .add(TextFieldChangeEvent(email.text, password.text));
              },
              decoration: const InputDecoration(
                labelText: " Password",
                hintText: "Enter your password",
                // If  you are using latest version of flutter then lable text and hint text shown like this
                // if you r using flutter less then 1.20.* then maybe this is not working properly
                floatingLabelBehavior: FloatingLabelBehavior.always,
                suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
              ),
            ),
            (state is TextFieldInvalidState)
                ? FormError(error: state.error)
                : const SizedBox(),
            const SizedBox(height: 20),
            state is SignUpLoading
                ? const Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  )
                : ElevatedButton(
                    onPressed: () {
                      // if all are valid then go to success screen
                      BlocProvider.of<SignUpBloc>(context).add(
                          SignUpButtonClickedEvent(name.text, email.text,
                              password.text, address.text));
                    },
                    child: const Text("Continue"),
                  ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    name.dispose();
    email.dispose();
    password.dispose();
  }
}
