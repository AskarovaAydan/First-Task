import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSectionHeader("PREFERENCES"),
          _buildGroupCard([
            _buildTile(
              icon: Icons.notifications_outlined,
              iconColor: Colors.black,
              title: "Push Notifications",
              trailing: CupertinoSwitch(
                value: true,
                activeColor: Colors.deepPurple,
                onChanged: (val) {},
              ),
            ),
            _buildTile(
              icon: Icons.email_outlined,
              title: "Email Notifications",
              iconColor: Colors.black,
              trailing: CupertinoSwitch(
                value: true,
                activeColor: Colors.deepPurple,
                onChanged: (val) {},
              ),
            ),
            _buildTile(
              icon: Icons.dark_mode_outlined,
              iconColor: Colors.black,
              title: "Dark Mode",
              trailing: CupertinoSwitch(
                value: false,
                activeColor: Colors.deepPurple,
                onChanged: (val) {},
              ),
            ),
            _buildTile(
              icon: Icons.language,

              title: "Language",
              iconColor: Colors.black,
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text("English", style: TextStyle(color: Colors.grey)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 20),

          _buildSectionHeader("ACCOUNT"),
          _buildGroupCard([
            _buildTile(
              iconColor: Colors.black,
              icon: Icons.lock_outline,
              title: "Privacy",
              onTap: () {},
            ),
            _buildTile(
              icon: Icons.security_outlined,
              iconColor: Colors.black,
              title: "Security",
              onTap: () {},
            ),
            _buildTile(
              icon: Icons.group_outlined,
              iconColor: Colors.black,
              title: "Blocked Users",
              onTap: () {},
            ),
          ]),

          const SizedBox(height: 20),

          _buildSectionHeader("MORE"),
          _buildGroupCard([
            _buildTile(
              icon: Icons.help_outline,
              iconColor: Colors.black,
              title: "Help & Support",
              onTap: () {},
            ),
            _buildTile(
              icon: Icons.info_outline,
              iconColor: Colors.black,
              title: "About App",
              onTap: () {},
            ),
            _buildTile(
              icon: Icons.logout,
              title: "Logout",
              textColor: Colors.red,
              iconColor: Colors.red,
              onTap: () {},
            ),
          ]),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  static Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  static Widget _buildGroupCard(List<Widget> children) {
    return Card(
      elevation: 0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(children: children),
    );
  }

  static Widget _buildTile({
    required IconData icon,
    required String title,
    Widget? trailing,
    VoidCallback? onTap,
    Color? textColor,
    Color? iconColor,
  }) {
    return ListTile(
      leading: Icon(icon, color: iconColor ?? Colors.deepPurple),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: textColor ?? Colors.black,
        ),
      ),
      trailing:
          trailing ??
          const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      onTap: onTap,
    );
  }
}
