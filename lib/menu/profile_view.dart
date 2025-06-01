import 'package:flutter/material.dart';

import '../shared/constants/app_constants.dart';
import '../shared/values/app_colors.dart';

import '../welcome.dart';


class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: secondaryColor,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Profil",
          style: TextStyle(
            fontFamily: kGlacialStyle,
            color: secondaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.indigo.shade100,
              child: Icon(Icons.person, size: 50, color: Colors.indigo),
            ),
            SizedBox(height: 12),


            Text(
              "Maram Mejri",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: kGlacialStyle,
                fontSize: 16,
                color: secondaryColor,
              ),
            ),


            Text(
              "mejrimaram307@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontFamily: kGlacialStyle,
                fontSize: 16,
                color: secondaryColor,
              ),
            ),

            SizedBox(height: 16),


            ElevatedButton.icon(
              icon: Icon(Icons.edit),
              label: Text(
                "Modifier le profil",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: kGlacialStyle,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
              ),
            ),
            SizedBox(height: 30),

            // Infos
            InfoTile(
              title: "Email",
              value: "mejrimaram307@gmail.com",
              icon: Icons.email,
            ),
            InfoTile(
              title: "Nom",
              value: "Maram Mejri",
              icon: Icons.person,
            ),
            InfoTile(
              title: "Vos constats",
              value: "5 constats réalisés",
              icon: Icons.description,
            ),

            SizedBox(height: 40),


            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text(
                "Déconnexion",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: kGlacialStyle,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Welcome()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoTile extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const InfoTile({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.indigo),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontFamily: kGlacialStyle,
          fontSize: 14,
          color: secondaryColor,
        ),
      ),
      subtitle: Text(value),
      contentPadding: EdgeInsets.symmetric(vertical: 4),
    );
  }
}
