import 'package:flutter/material.dart';
import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/myCartScreen/cart_Screen.dart';
import 'package:online_shopping/view/widgets/product_card.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
        centerTitle: true,
        actions: [
          context.read<ProviderShop>().cartcount == 0
              ? Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MyCart(),
                        ));
                      },
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 40,
                      )),
                )
              : Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => MyCart(),
                            ));
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            size: 40,
                          )),
                    ),
                    Positioned(
                        right: 3,
                        child: CircleAvatar(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          radius: 10,
                          child: Center(
                              child: Text(
                                  '${context.watch<ProviderShop>().cartcount}')),
                        ))
                  ],
                )
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 350,
              child: ProductCard(
                  image: context.read<ProviderShop>().items[index].image),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(context.read<ProviderShop>().items[index].description),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text("Price :2000"),
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                          foregroundColor:
                              MaterialStatePropertyAll(Colors.white),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.black)),
                      // label: Text("Add"),
                      onPressed: () {
                        // adding an item into cart
                        context.read<ProviderShop>().addTocart(
                            // adding items in itemList into cartList
                            context.read<ProviderShop>().items[index]);
                      },
                      child: Text("Add"),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    ElevatedButton(
                      // label: Text("remove"),
                      onPressed:
                          // if cart item count = 0 the remove button will disable or not working using null
                          context.watch<ProviderShop>().items[index].count == 0
                              ? null
                              : () {
                                  // removing an item into cart
                                  context.read<ProviderShop>().removeFromcart(
                                      // removing items from the cartList if cartlist have two or more same item then remove item one by one
                                      context
                                          .read<ProviderShop>()
                                          .items[index]);
                                },
                      child: Text("Remove"),
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 70,
        color: Colors.black,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              context.watch<ProviderShop>().price == 0
                  ? SizedBox()
                  : Container(
                      child: Text(
                        "Amount Payable= ${context.watch<ProviderShop>().price}Rs ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
              Container(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MyCart(),
                  ));
                },
                child: Row(
                  children: [Text("Your Cart"), Icon(Icons.shopping_cart)],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
