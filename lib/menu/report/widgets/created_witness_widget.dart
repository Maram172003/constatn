import 'package:constatn/menu/report/bloc/update_report_cubit/update_report_cubit.dart';
import 'package:constatn/menu/report/domain/entities/witness_entity.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatedWitnessWidget extends StatelessWidget {
  const CreatedWitnessWidget({
    super.key,
    required this.witnessEntity,
  });

  final WitnessEntity witnessEntity;

  @override
  Widget build(BuildContext context) {
    final updateReportCubit = context.read<UpdateReportCubit>();
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 12,
      ),
      padding: EdgeInsets.all(
        16,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(
            8,
          ),
        ),
        border: Border.all(
          color: secondaryColor,
        ),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: primaryColor,
                ),
                alignment: Alignment.bottomCenter,
                child: Icon(
                  Icons.person_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      '${witnessEntity.firstName} ${witnessEntity.lastName}',
                      style: TextStyle(
                        fontFamily: kGlacialStyle,
                        color: secondaryColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    if (witnessEntity.phoneNumber.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: Text(
                          witnessEntity.phoneNumber,
                          style: TextStyle(
                            fontFamily: kGlacialStyle,
                            color: secondaryColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    if (witnessEntity.emailAddress.isNotEmpty)
                      Text(
                        witnessEntity.emailAddress,
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          color: secondaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {
              updateReportCubit.updateWitnesses(
                witnessEntity: witnessEntity,
              );
            },
            child: Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
