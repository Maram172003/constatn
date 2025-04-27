import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class VehicleTypeWidget extends StatelessWidget {
  const VehicleTypeWidget({
    super.key,
    required this.vehicleName,
    required this.vehicleBgColor,
  });

  final String vehicleName;
  final Color vehicleBgColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: vehicleBgColor,
          ),
          child: Icon(
            Icons.local_shipping_outlined,
            size: 20,
            color: Colors.white,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: Text(
            vehicleName,
            style: TextStyle(
              fontFamily: kGlacialStyle,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: secondaryColor,
            ),
          ),
        )
      ],
    );
  }
}
