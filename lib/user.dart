import 'package:flutter/material.dart';
class User extends StatelessWidget {
  const User({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Stack(
            children: [
              Positioned(top: 16,
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back, size: 30),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mode de saisie",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87, // you can tweak this too
                      ),
                    ),
                  ],
                ),
              )

            ],



        )
        )
    );

  }
}



