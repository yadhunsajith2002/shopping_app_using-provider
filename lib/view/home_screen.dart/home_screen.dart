import 'package:flutter/material.dart';
import 'package:online_shopping/constants/name_constants.dart';
import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/myCartScreen/cart_Screen.dart';
import 'package:online_shopping/view/productscreen/product_screen.dart';
import 'package:online_shopping/view/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Discover",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          // when cart count become empty then show only a cart icon else show the count in the top of cart icon using stack
          context.read<ProviderShop>().cartcount == 0
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MyCart(),
                    ));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 40,
                  ))
              : Stack(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyCart(),
                          ));
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          size: 40,
                        )),
                    Positioned(
                        right: 3,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          radius: 10,
                          child: Center(child: Text(
                              // display the no.of cartcount
                              '${context.watch<ProviderShop>().cartcount}')),
                        ))
                  ],
                )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SearchBar(
              hintText: "Search here",
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 30,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: 15,
                  );
                },
                itemBuilder: (context, index) {
                  return Container(
                    width: 70,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        names[index],
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Expanded(
              child: GridView.builder(
            itemCount: Provider.of<ProviderShop>(context).items.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                          index: index,
                          name:
                              context.read<ProviderShop>().items[index].image),
                    ));
                  },
                  child: ProductCard(
                    image: context.read<ProviderShop>().items[index].image,
                  ));
            },
          ))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: "Cart"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
    );
  }
}
