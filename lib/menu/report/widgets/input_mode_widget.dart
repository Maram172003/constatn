import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:constatn/shared/widgets/circular_check_box_widget.dart';
import 'package:flutter/material.dart';

class InputModeWidget extends StatelessWidget {
  const InputModeWidget({
    required this.inputModeIllustration,
    required this.isEnabled,
    required this.description,
    required this.onChecked,
    super.key,
  });

  final String inputModeIllustration;
  final bool isEnabled;
  final String description;
  final ValueChanged<bool> onChecked;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .4,
      decoration: BoxDecoration(
        border: Border.all(
          color: secondaryColor.shade200,
          width: 1,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(
              10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircularCheckboxWidget(
                  value: isEnabled,
                  onChanged: onChecked,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Image.asset(
              inputModeIllustration,
              height: MediaQuery.of(context).size.height * .15,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 10,
            ),
            child: Text(
              description,
              style: TextStyle(
                fontFamily: kGlacialStyle,
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
