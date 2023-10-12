import 'package:flutter/material.dart';
import 'package:fooddelivery/config/app_router.dart';

import '../screens.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pushNamed(context, AppRouter.menu),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              'Order Now',
              style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
