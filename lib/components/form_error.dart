import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FormError extends StatelessWidget {
  const FormError({
    Key? key,
    required this.error,
  }) : super(key: key);

  final String error;

  @override
  Widget build(BuildContext context) {
    return formErrorText(error: error);
  }

  Row formErrorText({required String error}) {
    return Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        Text(
          error,
          style: TextStyle(color: Colors.red),
        ),
      ],
    );
  }
}
