import 'package:flutter/material.dart';
import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/home_screen.dart/home_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProviderShop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
          // useMaterial3: true,
        ),
        home: HomeScreen(),
      ),
    );
  }
}
