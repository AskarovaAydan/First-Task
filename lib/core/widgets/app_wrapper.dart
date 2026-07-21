import 'package:flutter/material.dart';

class AppLayout extends StatelessWidget {
  final Widget child;
  final bool usePadding;
  final Widget? bottomNavigationBar;
  final bool hasFab;
  const AppLayout({
    super.key,
    required this.child,
    this.usePadding = true,
    this.bottomNavigationBar,
    this.hasFab = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottomNavigationBar,

      floatingActionButton: hasFab
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.deepPurple,
              shape: const CircleBorder(),
              child: const Icon(Icons.add, color: Colors.white, size: 30),
            )
          : null,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: usePadding
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: child,
              )
            : child,
      ),
    );
  }
}
