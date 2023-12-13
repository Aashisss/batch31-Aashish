import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'General Settings',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Dark Mode'),
              trailing: Switch(
                value: false, // Replace with actual value
                onChanged: (value) {
                  // Implement dark mode toggle logic
                },
              ),
            ),
            ListTile(
              title: const Text('Notifications'),
              trailing: Switch(
                value: false, // Replace with actual value
                onChanged: (value) {
                  // Implement notification toggle logic
                },
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Account',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Change Password'),
              onTap: () {
                // Implement change password logic
              },
            ),
            ListTile(
              title: const Text('Log Out'),
              onTap: () {
                // Implement log out logic
              },
            ),
          ],
        ),
      ),
    );
  }
}
