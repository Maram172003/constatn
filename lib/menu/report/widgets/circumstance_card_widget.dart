import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class CircumstanceCardWidget extends StatelessWidget {
  const CircumstanceCardWidget({
    super.key,
    required this.vehicleDataEntity,
  });

  final VehicleDataEntity vehicleDataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(
        12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        border: Border.all(
          color: secondaryColor.shade200,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          VehicleTypeWidget(
            vehicleName: vehicleDataEntity.vehicleName,
            vehicleBgColor: vehicleDataEntity.vehicleBgColor,
          ),
          if (vehicleDataEntity.circumstancesList != null)
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: vehicleDataEntity.circumstancesList!
                  .map((element) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                        ),
                        child: Text(
                          '* $element',
                          style: TextStyle(
                            fontFamily: kGlacialStyle,
                            fontSize: 16,
                            color: secondaryColor,
                          ),
                        ),
                      ))
                  .toList(),
            ),
        ],
      ),
    );
  }
}
