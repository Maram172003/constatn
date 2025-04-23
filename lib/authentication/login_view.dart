import 'package:constatn/menu/home_view.dart';
import 'package:constatn/authentication/forget_password_view.dart';
import 'package:constatn/authentication/signup_view.dart' show SignupView;
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Bienvenue",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // you can tweak this too
                    ),
                  ),
                  Text("Entrez vos identifiants pour vous connecter",
                      style: TextStyle(
                        fontSize: 18,
                      )),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 27),
                    decoration: BoxDecoration(
                      color: Color(0xFFEAFFFF),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    width: 380,
                    child: TextField(
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email ",
                          hintStyle: TextStyle(fontSize: 25),
                          prefixIcon: Icon(Icons.email)),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xFFEAFFFF),
                      borderRadius: BorderRadius.circular(19),
                    ),
                    width: 380,
                    child: TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Mot de passe ",
                        hintStyle: TextStyle(fontSize: 25),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  const SizedBox(height: 27),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeView()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFEAFFFF),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 18),
                      textStyle: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    child: Text("Se connecter"),
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
                        child: Text("Mot de passe oublié ?",
                            style: TextStyle(color: Colors.purple)),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous n'avez pas du compte ?",
                          style: TextStyle(
                            fontSize: 18,
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupView()),
                          );
                        },
                        child: Text("S'identifier",
                            style: TextStyle(color: Colors.purple)),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
