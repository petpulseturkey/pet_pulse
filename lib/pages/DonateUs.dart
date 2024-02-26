import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pulse/components/my_button.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  int _selectedAmount = 0;
  final user = FirebaseAuth.instance.currentUser!;
  void _increaseAmount() {
    setState(() {
      _selectedAmount++;
    });
  }

  void _decreaseAmount() {
    if (_selectedAmount > 0) {
      setState(() {
        _selectedAmount--;
      });
    }
  }

  void _donate() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Confirmation',
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
          content: Text('Thank you for your donation of \$$_selectedAmount!'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Close',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.onBackground),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: const Text(
          'Donate Us',
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    )
                  ],
                  shape: BoxShape.circle,
                  color: const Color(0xFF8f9bcf),
                ),
                child: SizedBox(
                  height: 200,
                  width: 200,
                  child: Image.asset(
                    'assets/images/donationphoto.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Text(
              'Select Donation Amount',
              style: TextStyle(
                  fontSize: 20.0,
                  color: Theme.of(context).colorScheme.onBackground),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: _decreaseAmount,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                Text(
                  '\$$_selectedAmount',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _increaseAmount,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            MyButton(
              onTap: () {
                if (_selectedAmount > 0) {
                  _donate();
                  donationToDatabase(_selectedAmount);
                }
              },
              text: "Donate \$$_selectedAmount",
            ),
          ],
        ),
     ),
    );
  }
  void donationToDatabase(int amount) async {
    var userRef = user.email.toString();
    await FirebaseFirestore.instance.collection("Users").doc(userRef).set({
      "donation": FieldValue.increment(amount),},SetOptions(merge: true)
    );
  }
}