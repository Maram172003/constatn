import 'package:constatn/authentication/login_view.dart';
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
                    "Mot de passe oublié",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // you can tweak this too
                    ),
                  ),
                  Text("Entrez vos noveaux identifiants ",
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
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Nouveau mot de passe ",
                        hintStyle: TextStyle(fontSize: 25),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),
                      ),
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
                        hintText: "Retapez le ",
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
                            builder: (context) => const LoginView()),
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
                    child: Text("Sauvegarder"),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
