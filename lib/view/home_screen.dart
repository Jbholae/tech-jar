import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: Text('Leading'),
                title: Text('Title'),
                subtitle: Text('Subtitle'),
                trailing: Text('Trailing'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
