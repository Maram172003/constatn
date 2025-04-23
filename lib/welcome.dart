import 'package:constatn/login.dart';
import 'package:constatn/signup.dart';
import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.white,
              child: Stack(
                children: [

                  Positioned(

                      top: 0,
                      left: 0,
                      child: Image.asset("assets/images/2.png"),),
                  Positioned(
                      bottom: 0,
                      right: 0,

                      child: Image.asset("assets/images/3.png",)),
                 Center(
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Column(
                         children: [
                           Text("ConstaTN",
                             style: TextStyle(fontFamily: "Satisfy", fontSize: 40, fontWeight: FontWeight.bold),),

                           Image.asset("assets/images/4.png",height: 320,width:450,fit: BoxFit.contain,),

                           ElevatedButton(
                             onPressed: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => const Login()),
                               );
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor:  const  Color(0xFFF8D9D9),
                               foregroundColor: Colors.black,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                               padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 18),
                               textStyle: const TextStyle(fontSize: 20, ),


                             ),
                             child: Text("Se connecter"),
                           ),
                           const SizedBox(height: 20),
                           ElevatedButton(
                             onPressed: (){
                               Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) => const Signup()),
                               );
                             },
                             style: ElevatedButton.styleFrom(
                               backgroundColor:  const  Color(0xFFF8D9D9),
                               foregroundColor: Colors.black,
                               shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20),),
                               padding: const EdgeInsets.symmetric(horizontal: 110, vertical: 18),
                               textStyle: const TextStyle(fontSize: 20, ),

                             ),
                             child: Text("S'identifier"),
                           )

                         ],
                       ),
                     ],
                   ),
                 )


                ],

              ),

            )
        ),
    );
  }
}


