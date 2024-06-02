import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/screens/init_screen.dart';

import '../../../components/custom_surfix_icon.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../helper/keyboard.dart';
import '../../forgot_password/forgot_password_screen.dart';
import '../../login_success/login_success_screen.dart';
import '../bloc/log_in_bloc.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
     _emailController.clear();
     _passwordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LogInBloc, LogInState>(
      listener: (context, state) {
        if (state is LogInSuccessState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => InitScreen()));
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            TextFormField(
              keyboardType: TextInputType.name,
              onChanged: (value) {},
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: "email",
                hintText: "Enter your email",
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
                  value: false,
                ),
                const Text("Remember me"),
                const Spacer(),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                      context, ForgotPasswordScreen.routeName),
                  child: const Text(
                    "Forgot Password",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
            (state is LogInErrorState)
                ? FormError(error: state.error)
                : FormError(error: ''),
            const SizedBox(height: 16),
            (state is !LogInLoadingState)
                ? ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<LogInBloc>(context).add(
                          SignInButtonClickedEvent(
                              _emailController.text, _passwordController.text));
                      KeyboardUtil.hideKeyboard(context);
                    },
                    child: const Text("Continue"),
                  )
                : Center(
                    child: CircularProgressIndicator(
                      color: Colors.deepOrange,
                    ),
                  ),
          ],
        );
      },
    );
  }
}
