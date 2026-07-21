import 'package:flutter/material.dart';
import 'package:task/core/widgets/app_wrapper.dart';
import 'package:task/features/settings/presentation/screens/settings_screen.dart';
import 'package:task/features/profile/presentation/widgets/menu_tile.dart';
import 'package:task/features/profile/presentation/screens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String name = 'FuadEliyevFlutterDeveloperSuperLongUsername';
  String email = 'fuad.eliyev.flutter.mobile.developer@gmail.com';

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        currentIndex: 4,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Explore"),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: "Add",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: "Profile",
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(width: 5),
              const Expanded(
                child: Text(
                  'Profile',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Stack(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.notifications_none),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: Colors.deepPurple,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(color: Colors.grey.shade200, blurRadius: 10),
              ],
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 6),
                          Text(
                            email,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.deepPurple.shade50,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(
                            initialName: name,
                            initialEmail: email,
                          ),
                        ),
                      );

                      if (result != null && result is Map<String, String>) {
                        setState(() {
                          name = result['name'] ?? name;
                          email = result['email'] ?? email;
                        });
                      }
                    },
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          "Edit Profile",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.edit, size: 16, color: Colors.deepPurple),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildStatItem(
                  "24",
                  "Projects",
                  Icons.folder_outlined,
                  Colors.blue,
                ),
                _buildStatItem(
                  "128",
                  "Likes",
                  Icons.favorite_border,
                  Colors.red,
                ),
                _buildStatItem("7", "Badges", Icons.star_border, Colors.orange),
              ],
            ),
          ),

          const SizedBox(height: 30),
          const Align(
            alignment: Alignment.topLeft,
            child: Text(
              "Menu",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 6),

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 3),
                padding: const EdgeInsets.symmetric(vertical: 3),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MenuTile(
                      icon: Icons.history,
                      title: "My Activity",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.bookmark_border,
                      title: "Saved Items",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.folder_open,
                      title: "My Projects",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.email_outlined,
                      title: "Messages",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.settings_outlined,
                      title: "Settings",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SettingsScreen(),
                          ),
                        );
                      },
                    ),
                    MenuTile(
                      icon: Icons.notifications_none,
                      title: "Notifications",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.lock_outline,
                      title: "Privacy & Security",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.help_outline,
                      title: "Help & Support",
                      onTap: () {},
                    ),
                    MenuTile(
                      icon: Icons.info_outline,
                      title: "About App",
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget _buildStatItem(
    String count,
    String label,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
            Icon(icon, color: color, size: 24),
          ],
        ),
        const SizedBox(height: 12),
        Text(
          count,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}
