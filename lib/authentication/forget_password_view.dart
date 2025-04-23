import 'package:constatn/authentication/login_view.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 16,
              left: 16,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  size: 30,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Mot de passe\noublié',
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: kGlacialStyle,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Text(
                        "Entrez vos noveaux identifiants",
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 18,
                          color: secondaryColor,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Mot de passe*',
                          labelStyle: TextStyle(
                            fontFamily: kGlacialStyle,
                            color: primaryColor,
                            fontSize: 16,
                          ),
                          hintStyle: TextStyle(
                            color: secondaryColor.shade300,
                            fontFamily: kGlacialStyle,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIconConstraints: const BoxConstraints(
                            maxWidth: 165,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          hintText: "*******",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 16,
                      ),
                      child: TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Confirmer le mot de passe*',
                          labelStyle: TextStyle(
                            fontFamily: kGlacialStyle,
                            color: primaryColor,
                            fontSize: 16,
                          ),
                          hintStyle: TextStyle(
                            color: secondaryColor.shade300,
                            fontFamily: kGlacialStyle,
                            fontSize: 16,
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.black,
                            ),
                          ),
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          prefixIconConstraints: const BoxConstraints(
                            maxWidth: 165,
                          ),
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 8,
                          ),
                          hintText: "*******",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Icon(
                              Icons.lock,
                            ),
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginView()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 110,
                          vertical: 18,
                        ),
                      ),
                      child: Text(
                        "Sauvegarder",
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
