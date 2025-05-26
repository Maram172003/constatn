import 'package:flutter/material.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/values/app_colors.dart';

class ObservationView extends StatelessWidget {
  const ObservationView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
              top: 16,
            ),
            child: Text(
              'Ajoutez des précisions sur l\'accident ',
              style: TextStyle(
                fontFamily: kGlacialStyle,
                color: secondaryColor,
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16),
            padding: EdgeInsets.all(16),
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Commentaire (optionnel)",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
