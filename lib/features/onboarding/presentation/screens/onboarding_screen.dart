import 'package:flutter/material.dart';
import 'package:task/core/widgets/app_wrapper.dart';
import 'package:task/core/widgets/custom_button.dart';
import 'package:task/core/constants/app_colors.dart';
import 'package:task/features/profile/presentation/screens/profile_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AppLayout(
      usePadding: false,
      hasFab: false,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const SizedBox(height: 80),
                Image.asset('assets/images/onboarding.jpg', height: 200),
                const SizedBox(height: 32),
                const Text.rich(
                  TextSpan(
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    children: [
                      TextSpan(
                        text: 'Manage your\n',
                        style: TextStyle(color: Colors.black87),
                      ),
                      TextSpan(
                        text: 'profile easily',
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                const Text(
                  'All your information in one place.\nKeep track and update anytime.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black54,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 44),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildDot(isActive: true),
                    const SizedBox(width: 8),
                    _buildDot(isActive: false),
                    const SizedBox(width: 8),
                    _buildDot(isActive: false),
                  ],
                ),
                const Spacer(),
                CustomButton(
                  text: "Continue",
                  hasIcon: true,
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 90),
              ],
            ),
          ),

          Positioned(
            top: 10,
            right: 10,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const Text(
                'Skip',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDot({required bool isActive}) {
    return Container(
      width: isActive ? 12 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF6C63FF) : Colors.grey.shade300,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
