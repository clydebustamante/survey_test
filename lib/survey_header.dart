import 'package:flutter/material.dart';
import '../../../constants/colors.dart';

class SurveyHeader extends StatelessWidget {
  const SurveyHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        color: AppColors.rhino,
      ),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            'Survey questions',
            style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.white,
              fontSize: 23,
            ),
          ),
        ),
      ),
    );
  }
}
