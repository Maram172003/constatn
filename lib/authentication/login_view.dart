import 'package:constatn/menu/home_view.dart';
import 'package:constatn/authentication/forget_password_view.dart';
import 'package:constatn/authentication/signup_view.dart' show SignupView;
import 'package:constatn/shared/constants/app_constants.dart';
import 'package:constatn/shared/values/app_colors.dart';
import 'package:flutter/material.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

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
                      "Bienvenue",
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
                        "Entrez vos identifiants pour vous connecter",
                        style: TextStyle(
                          fontFamily: kGlacialStyle,
                          fontSize: 18,
                          color: secondaryColor,
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
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeView()),
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
                        "Se connecter",
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
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgetPasswordView()),
                            );
                          },
                          child: Text(
                            "Mot de passe oublié ?",
                            style: TextStyle(
                              fontFamily: kGlacialStyle,
                              color: primaryColor.shade400,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Vous n'avez pas du compte ?",
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
                                  builder: (context) => const SignupView()),
                            );
                          },
                          child: Text(
                            "S'identifier",
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
