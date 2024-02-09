import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 35.0),
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/Images1.jpg'),
            ),
          ),
          _buildProfileItem(Icons.manage_accounts, 'Manage My Account'),
          _buildProfileItem(Icons.shopping_bag, 'My Orders'),
          _buildProfileItem(Icons.favorite, 'My Wishlist'),
          _buildProfileItem(Icons.store, 'Followed Stores'),
          _buildProfileItem(Icons.rate_review, 'My Reviews'),
          _buildProfileItem(Icons.receipt, 'My Returns and Cancellations'),
          _buildProfileItem(Icons.logout, 'Logout'),
        ],
      ),
    );
  }

  Widget _buildProfileItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        // Handle onTap for each item
        if (title == 'Logout') {
          // Add logout functionality here
        } else {
          // Navigate to respective pages or perform actions
        }
      },
    );
  }
}
