import 'package:flutter/cupertino.dart';

import '../constant/color_constans.dart';
import '../constant/padding_constant.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.cityController,
  }) : super(key: key);

  final TextEditingController cityController;

  @override
  Widget build(BuildContext context) {
    return CupertinoTextField(
      placeholder: 'City',
      controller: cityController,
      placeholderStyle: const TextStyle(
        color: AppColors.inActive,
      ),
      style: const TextStyle(
        color: AppColors.black,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: AppColors.stroke,
        ),
      ),
      padding: AppPaddings.primary,
    );
  }
}