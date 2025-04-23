import 'package:constatn/authentication/login_view.dart';
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});

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
                icon: const Icon(Icons.arrow_back, size: 30),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "S'inscrire",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: kGlacialStyle,
                        fontWeight: FontWeight.bold,
                        color: secondaryColor,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        bottom: 40,
                      ),
                      child: Text(
                        "Créez votre compte",
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nom*',
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
                        hintText: "Maram mejri",
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(
                            left: 8,
                          ),
                          child: Icon(
                            Icons.person,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 16,
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Adresse email*',
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
                          hintText: "Maram@gmail.com",
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                              left: 8,
                            ),
                            child: Icon(
                              Icons.email_outlined,
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
                            builder: (context) => const LoginView(),
                          ),
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
                        "Continuer",
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous avez déja un compte ?",
                          style: TextStyle(
                            fontFamily: kGlacialStyle,
                            fontSize: 18,
                            color: secondaryColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginView(),
                              ),
                            );
                          },
                          child: Text(
                            "Se connecter",
                            style: TextStyle(
                              fontFamily: kGlacialStyle,
                              color: primaryColor.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    )
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
