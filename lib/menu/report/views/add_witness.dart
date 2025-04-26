
import 'package:constatn/menu/report/views/vehicale_type_view.dart';
import 'package:flutter/material.dart';

import '../../../shared/constants/app_constants.dart';
import '../../../shared/values/app_colors.dart';
class AddWitness extends StatefulWidget {
  const AddWitness({super.key});

  @override
  State<AddWitness> createState() => _AddWitnessState();
}

class _AddWitnessState extends State<AddWitness> {
  final _formkey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Étape 1/7",
              style: TextStyle(
                fontFamily: kGlacialStyle,
                color: secondaryColor,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),),
            centerTitle: true,
            leading: BackButton(),
          ),
          body:  Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
                key: _formkey,
                child: ListView(
                  children: [
                    Text(
                      "Ajout des témoins (optionnel)",
                      style: TextStyle(fontSize: 22, fontFamily: kGlacialStyle, fontWeight: FontWeight.bold),

                    ),
                    SizedBox(height: 8),
                    Container(
                      padding: EdgeInsets.all(12),
                      color: Colors.yellow[100],
                      child: Row(
                        children: [
                          Icon(Icons.lightbulb_outline),
                          SizedBox(width: 10),
                          Expanded(
                              child: Text("Vous devez renseigner au moins l'un des deux champs : numéro de téléphone ou adresse e-mail"),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    _buildTextField("Nom*", "Nom du témoin"),
                    _buildTextField("Prénom*", "Prénom du témoin"),
                    _buildPhoneField(),
                    _buildEmailField(),
                    _buildTextField("Adresse", "Adresse du témoin"),
                    _buildTextField("Code postal", "Code postal du témoin"),
                    _buildTextField("Ville", "Ville du témoin"),
                    SizedBox(height: 20),

                  ],
                ),
            ),

          ),
          floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 50,
                    vertical: 18,
                  ),
                ),
                child: Text(
                  "Retour",
                  style: TextStyle(
                    fontFamily: kGlacialStyle,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicaleTypeView()),
                    );

                  }

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
                child: Text(
                  "Valider",
                  style: TextStyle(
                    fontFamily: kGlacialStyle,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          ),

        )
    );
  }
  Widget _buildTextField(String label, String hint){
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: label,
            hintText: hint,
            border: OutlineInputBorder(),
          ),
          validator: (value){
            if (label.contains("*") && (value == null || value.trim().isEmpty)){
              return "Ce champ est requis";
            }
            return null;
          },

        ),

    );
  }
  Widget _buildPhoneField() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          controller: _phoneController,
            decoration: InputDecoration(
              labelText: "Numéro de téléphone",
              hintText: "Numéro de téléphone du témoin",
              border: OutlineInputBorder(),
            ),
          keyboardType: TextInputType.phone,
          validator:  (value) {
            if ((value == null || value.isEmpty) &&
                (_emailController.text.isEmpty)) {
              return "Entrez au moins un numéro ou une adresse e-mail";
            }
            return null;
          },
        ),

    );
  }
  Widget _buildEmailField() {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: TextFormField(
          controller: _emailController,
            decoration: InputDecoration(
              labelText: "Adresse e-mail",
              hintText: "Adresse e-mail du témoin",
              border: OutlineInputBorder(),
            ),
          keyboardType: TextInputType.emailAddress,
          validator: (value){
            if ((value == null || value.isEmpty) &&
                (_phoneController.text.isEmpty)) {
              return "Entrez au moins un numéro ou une adresse e-mail";
            }
            return null;
          },
        ),

    );
  }

}
