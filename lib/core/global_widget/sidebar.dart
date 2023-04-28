import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:itunes_video_app/core/helper/auth_helper.dart';
import 'package:itunes_video_app/core/helper/repository.dart';

class Sidebar extends StatefulWidget {
  const Sidebar({super.key});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  final AuthHelperRepository _authHelperRepository = AuthHelper();

  final userEmail = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text(
              'Welcome...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            // USER EMAIL
            accountEmail: Text(
              '${userEmail.currentUser!.email}',
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/sidebar_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
            ),
            child: ElevatedButton.icon(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              label: const Text(
                'Logout',
                style: TextStyle(color: Colors.white),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(
                  const Color(0xFFEA4CC0),
                ),
              ),
              onPressed: () async {
                await _authHelperRepository.signOut();

                // ignore: use_build_context_synchronously
                Navigator.of(context).pushReplacementNamed('/signin');
              },
            ),
          ),
        ],
      ),
    );
  }
}
