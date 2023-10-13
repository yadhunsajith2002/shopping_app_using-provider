import 'package:flutter/material.dart';
import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/home_screen.dart/home_screen.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Your Cart"),
      ),
      body: context.watch<ProviderShop>().cartcount == 0
          ? Center(
              child: Text(
                "Your Cart is empty...",
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.separated(
                      itemBuilder: (context, index) {
                        return Container(
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  height: 200,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        context
                                            .read<ProviderShop>()
                                            .cartitems[index]
                                            .image,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  // showing the itemcount of each elements , that is an item have added how much times
                                  Text(
                                      "Item Count ${context.watch<ProviderShop>().cartitems[index].count} "),
                                  TextButton.icon(
                                      label: Text("Add"),
                                      onPressed: () {
                                        // same adding function  in cart screen
                                        context.read<ProviderShop>().addTocart(
                                            context
                                                .read<ProviderShop>()
                                                .cartitems[index]);
                                      },
                                      icon: Icon(Icons.add)),
                                  TextButton.icon(
                                      label: Text("remove"),
                                      // same removing function also in cart screen
                                      onPressed: context
                                                  .watch<ProviderShop>()
                                                  .cartitems[index]
                                                  .count ==
                                              0
                                          ? null
                                          : () {
                                              context
                                                  .read<ProviderShop>()
                                                  .removeFromcart(context
                                                      .read<ProviderShop>()
                                                      .cartitems[index]);
                                            },
                                      icon: Icon(Icons.remove)),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (context, index) => Divider(),
                      itemCount: context.read<ProviderShop>().cartitemCount),
                ),
              ],
            ),
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.black,
        child: Center(
          child: context.watch<ProviderShop>().price == 0
              ? InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => HomeScreen(),
                    ));
                  },
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                )
              : Text(
                  "PAY  ${context.watch<ProviderShop>().price} Rs",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
        ),
      ),
    );
  }
}
