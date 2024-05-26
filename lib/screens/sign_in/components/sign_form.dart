import 'package:flutter/material.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _token;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          keyboardType: TextInputType.name,
          onChanged: (value) {},
          controller: _usernameController,
          decoration: const InputDecoration(
            labelText: "username",
            hintText: "Enter your username",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: _passwordController,
          obscureText: true,
          onChanged: (value) {},
          decoration: const InputDecoration(
            labelText: "Password",
            hintText: "Enter your password",
            // If  you are using latest version of flutter then lable text and hint text shown like this
            // if you r using flutter less then 1.20.* then maybe this is not working properly
            floatingLabelBehavior: FloatingLabelBehavior.always,
            suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Checkbox(
              activeColor: kPrimaryColor,
              onChanged: (value) {},
              value: null,
            ),
            const Text("Remember me"),
            const Spacer(),
            GestureDetector(
              onTap: () =>
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName),
              child: const Text(
                "Forgot Password",
                style: TextStyle(decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        FormError(error: ''),
        const SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            KeyboardUtil.hideKeyboard(context);
            Navigator.pushNamed(context, LoginSuccessScreen.routeName);
          },
          child: const Text("Continue"),
        ),
      ],
    );
  }
}
