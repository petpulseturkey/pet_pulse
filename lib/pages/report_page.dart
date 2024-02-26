import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pulse/components/my_button.dart';
import 'package:pet_pulse/components/my_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  final _selectedAnimal = TextEditingController();
  final _injuryDescription = TextEditingController();
  final _adress = TextEditingController();
  final _phoneNumber = TextEditingController();
  final _additionalItems = TextEditingController();

  bool canSubmit = false;
  void _updateCanSubmit() {
    setState(() {
      canSubmit = _selectedAnimal.text.isNotEmpty &&
          _injuryDescription.text.isNotEmpty &&
          _adress.text.isNotEmpty &&
          _phoneNumber.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text('Animal Report'),
        forceMaterialTransparency: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 15),
            _buildAnimalTextField(),
            const SizedBox(height: 15),
            _buildInjuryDescriptionTextField(),
            const SizedBox(height: 15),
            _buildAddressTextField(),
            const SizedBox(height: 15),
            _buildPhoneNumberTextField(),
            const SizedBox(height: 15),
            _buildAdditionalItemsTextField(),
            const SizedBox(height: 25),
            _buildSubmitButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildAnimalTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Enter Animal Kind:',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: _selectedAnimal,
          hintText: 'animal kind',
          onChanged: (value) {
            _updateCanSubmit();
          },
        ),
      ],
    );
  }

  Widget _buildInjuryDescriptionTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Description of Injury:',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: _injuryDescription,
          hintText: 'injury description',
          onChanged: (value) {
            _updateCanSubmit();
          },
        ),
      ],
    );
  }

  Widget _buildAddressTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Address:',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: _adress,
          hintText: 'address',
          onChanged: (value) {
            _updateCanSubmit();
          },
        ),
      ],
    );
  }

  Widget _buildPhoneNumberTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Enter your Phone Number:',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: _phoneNumber,
          hintText: 'your phone number',
          keyboardType: TextInputType.number,
          onChanged: (value) {
            _updateCanSubmit();
          },
        ),
      ],
    );
  }

  Widget _buildAdditionalItemsTextField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 25),
          child: Text(
            'Further Informations (Optional):',
            style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary),
          ),
        ),
        const SizedBox(height: 10.0),
        MyTextField(
          controller: _additionalItems,
          hintText: '',
          onChanged: (value) {
            _updateCanSubmit();
          },
        ),
      ],
    );
  }

  Widget _buildSubmitButton(BuildContext context) {
    return Column(
      children: [
        MyButton(
          onTap: canSubmit
              ? () {
                  reportToDatabase();
                  Navigator.pop(context); // İhbar ekranından çıkış
                }
              : null,
          text: 'Submit the Report',
        ),
      ],
    );
  }

  reportToDatabase() async {
    Map<String, dynamic> report = <String, dynamic>{};
    report['User email information'] =
        FirebaseAuth.instance.currentUser!.email.toString();
    report['Animal Type'] = _selectedAnimal.text.toString();
    report['Injury'] = _injuryDescription.text.toString();
    report['Adress'] = _adress.text.toString();
    report['Phone number'] = _phoneNumber.text.toString();
    report['Additional informations'] = _additionalItems.text.toString();

    var firestore = FirebaseFirestore.instance;
    await firestore.doc("Counter/report").set(
        {"reportcounter": FieldValue.increment(1)}, SetOptions(merge: true));
    await FirebaseFirestore.instance.collection("Report").add(report);
  }
}
