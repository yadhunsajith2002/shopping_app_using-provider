import 'package:flutter/material.dart';

import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/home_screen.dart/widgets/home_screen-widget.dart';
import 'package:online_shopping/view/myCartScreen/cart_Screen.dart';

import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> screens = [
    HomeScreenWidget(),
    MyCart(
      showBottom: false,
    ),
    Center(
      child: Text("Settings"),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[context.watch<ProviderShop>().currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          onTap: (value) {
            context.read<ProviderShop>().onTap(value);
          },
          currentIndex: context.watch<ProviderShop>().currentIndex,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ]),
    );
  }
}
