
import 'package:constatn/login.dart';
import 'package:flutter/material.dart';
class Signup extends StatelessWidget {
  const Signup({super.key});

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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Sign Up",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87, // you can tweak this too
                    ),
                  ),
                  Text("Create your account",
                      style: TextStyle(
                        fontSize: 18,)


                  ),

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
                          hintText: "Nom d'utilisateur ",
                          hintStyle: TextStyle(fontSize: 25),
                          prefixIcon: Icon(Icons.person)

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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Email ",
                          hintStyle: TextStyle(fontSize: 25),
                          prefixIcon: Icon(Icons.email)

                      ),


                    ),

                  ),
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
                        hintText: "Mot de passe ",
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
                        hintText: "Confirmer le ",
                        hintStyle: TextStyle(fontSize: 25),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: Icon(Icons.visibility),

                      ),


                    ),

                  ),
                  const SizedBox(height: 27),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:  const  Color(0xFFEAFFFF),
                      foregroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                      padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                      textStyle: const TextStyle(fontSize: 25,),

                    ),
                    child: Text("S'inscrire"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Vous avez déja un compte ?",
                          style: TextStyle(
                            fontSize: 18,)),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const Login()),
                          );

                        },
                        child: Text("Se connecter",style: TextStyle(color: Colors.purple)),)

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
