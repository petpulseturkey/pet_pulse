import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_pulse/components/my_textbox.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final users = FirebaseFirestore.instance.collection("Users");

  Future<void> editField(String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Theme.of(context).colorScheme.background,
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: Text(
          "Edit $field",
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
        ),
        content: TextField(
          autofocus: true,
          style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle:
                TextStyle(color: Theme.of(context).colorScheme.onPrimary),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(newValue),
            child: Text("Save",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
          ),
        ],
      ),
    );
    if (newValue.trim().isNotEmpty) {
      await users.doc(user.email).update({field: newValue});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Text("Profile Page"),
        forceMaterialTransparency: true,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection("Users")
            .doc(user.email)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final userData = snapshot.data!.data() as Map<String, dynamic>;
            return ListView(
              children: [
                const SizedBox(height: 50),
                Icon(
                  Icons.person,
                  size: 72,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
                const SizedBox(height: 10),
                Text(
                  user.email!,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onPrimary,
                      fontSize: 18),
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'My Details',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ),
                MyTextBox(
                  text: userData['name'],
                  sectionName: 'name',
                  onPressed: () => editField('name'),
                ),
                const SizedBox(height: 25),
                MyTextBox(
                  text: userData['surname'],
                  sectionName: 'surname',
                  onPressed: () => editField('surname'),
                ),
                const SizedBox(height: 25),
                MyTextBox(
                  text: userData['birthday'],
                  sectionName: 'birthday',
                  onPressed: () => editField('birthday'),
                ),
                const SizedBox(height: 25),
                MyTextBox(
                  text: userData['gender'],
                  sectionName: 'gender',
                  onPressed: () => editField('gender'),
                ),
                const SizedBox(height: 25),
                MyTextBox(
                  text: userData['favorite animal'],
                  sectionName: 'favorite animal',
                  onPressed: () => editField('favorite animal'),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error ${snapshot.error}'),
            );
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
