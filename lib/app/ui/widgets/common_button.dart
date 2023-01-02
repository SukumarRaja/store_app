import 'package:flutter/material.dart';

import '../themes/colors.dart';
import 'common_text.dart';

class CommonButton extends StatelessWidget {
  const CommonButton({Key? key, required this.text, required this.onPressed})
      : super(key: key);
  final String text;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: AppColors.primary),
        child: Center(
          child: CommonText(
            text: text,
            fontColor: AppColors.white,
          ),
        ),
      ),
    );
  }
}
