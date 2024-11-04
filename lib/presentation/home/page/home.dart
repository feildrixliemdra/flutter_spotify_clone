import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(elevation: 0, items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ''),
        const BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
      ]),
      body: const Center(
        child: Text('Home Page'),
      ),
    );
  }
}
