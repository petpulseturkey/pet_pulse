import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pet_pulse/components/my_listtile.dart';
import 'package:pet_pulse/pages/donate_page.dart';
import 'package:pet_pulse/pages/profile_page.dart';
import 'package:pet_pulse/pages/report_page.dart';

class MyDrawer extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser!;

  MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
              child: Icon(
                Icons.person,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 64,
              ),
            ),
            MyListTile(
              icon: Icons.home,
              text: 'H O M E',
              onTap: () => Navigator.pop(context),
            ),
            MyListTile(
              icon: Icons.person,
              text: 'P R O F I L E',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfilePage(),
                  ),
                );
              },
            ),
            MyListTile(
              icon: Icons.volunteer_activism,
              text: 'D O N A T E  U S',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const DonationPage(),
                  ),
                );
              },
            ),
            MyListTile(
              icon: Icons.report,
              text: 'R E P O R T',
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ReportPage(),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: MyListTile(
                icon: Icons.logout,
                text: 'L O G  O U T',
                onTap: () => FirebaseAuth.instance.signOut(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
