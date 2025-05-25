import 'package:constatn/menu/report/domain/entities/vehicle_data_entity.dart';
import 'package:constatn/menu/report/widgets/vehicle_type_widget.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class InsuranceCardWidget extends StatelessWidget {
  const InsuranceCardWidget({
    super.key,
    required this.vehicleDataEntity,
    required this.onClicked,
  });

  final VehicleDataEntity vehicleDataEntity;
  final VoidCallback onClicked;

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
          if (vehicleDataEntity.carRegistrationNumber != null &&
              vehicleDataEntity.insuranceName != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16,
              ),
              child: Text(
                'Informations renseignées:',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: kGlacialStyle,
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
            ),
          if (vehicleDataEntity.insuranceName != null)
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 8,
              ),
              child: Text(
                '* ${vehicleDataEntity.insuranceName}',
                style: TextStyle(
                  fontFamily: kGlacialStyle,
                  fontSize: 16,
                  color: secondaryColor,
                ),
              ),
            ),
          if (vehicleDataEntity.carRegistrationNumber != null)
            Text(
              '* ${vehicleDataEntity.carRegistrationNumber}',
              style: TextStyle(
                fontFamily: kGlacialStyle,
                fontSize: 16,
                color: secondaryColor,
              ),
            ),
          Container(
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.only(
              top: 30,
            ),
            child: ElevatedButton(
              onPressed: onClicked,
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                disabledBackgroundColor: secondaryColor.shade200,
                padding: const EdgeInsets.symmetric(
                  horizontal: 0,
                  vertical: 18,
                ),
              ),
              child: Text(
                vehicleDataEntity.insuranceName != null &&
                        vehicleDataEntity.insuranceName!.isNotEmpty
                    ? "Modifier"
                    : "Renseigner",
                style: TextStyle(
                  fontFamily: kGlacialStyle,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
