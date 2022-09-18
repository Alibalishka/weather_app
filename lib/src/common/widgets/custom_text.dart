import 'package:flutter/cupertino.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text, 
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 24,
      ),
    );
  }
}