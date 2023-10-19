import 'package:flutter/material.dart';
import 'package:online_shopping/constants/name_constants.dart';
import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/myCartScreen/cart_Screen.dart';
import 'package:online_shopping/view/productscreen/product_screen.dart';
import 'package:online_shopping/view/productscreen/widgets/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 15,
        title: Text(
          "Discover",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          // when cart count become empty then show only a cart icon else show the count in the top of cart icon using stack
          context.read<ProviderShop>().cartcount == 0
              ? Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyCart(
                            showBottom: true,
                          ),
                        ));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                      )),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyCart(showBottom: true),
                            ));
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 30,
                          )),
                    ),
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
            padding: const EdgeInsets.all(15.0),
            child: SearchBar(
              leading: Icon(Icons.search),
              elevation: MaterialStatePropertyAll(5),
              hintText: "Search here",
              hintStyle: MaterialStatePropertyAll<TextStyle>(
                  TextStyle(color: Colors.grey)),
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
            itemCount: Provider.of<ProviderShop>(context).itemCount,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 10, mainAxisSpacing: 10),
            itemBuilder: (context, index) {
              return InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ProductDetailsScreen(
                        index: index,
                      ),
                    ));
                  },
                  child: ProductCard(
                    image: context.read<ProviderShop>().items[index].image,
                  ));
            },
          ))
        ],
      ),
    );
  }
}
