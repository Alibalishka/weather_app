// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import '../constant/color_constans.dart';

class CustomButton extends StatelessWidget {

  final String? text;
  final VoidCallback? onPressed;

  const CustomButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text(
        text!,
        style: const TextStyle(
          color: AppColors.white,
        ),
      ),
      color: AppColors.primary,
      onPressed: onPressed,
    );
  }
}