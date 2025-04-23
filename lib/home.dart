import 'package:constatn/dashboard.dart';
import 'package:constatn/profil.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int myIndex = 0 ;
   List<Widget> widjetList = const <Widget>[
    Dashboard(),
    Profil(),

  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Scaffold(
      body: IndexedStack(
        index: myIndex,
        children: widjetList,
      ),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index){
            setState(() {
              myIndex = index;
            });
          },
          currentIndex: myIndex,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Accueil',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Profile',
            ),

          ]),


    ),
    );

  }
}
