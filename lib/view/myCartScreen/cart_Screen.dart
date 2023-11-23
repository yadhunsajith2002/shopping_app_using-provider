import 'package:flutter/material.dart';
import 'package:online_shopping/model/shopping_model.dart';
import 'package:online_shopping/provider/shopping_provider.dart';
import 'package:online_shopping/view/home_screen.dart/home_screen.dart';
import 'package:provider/provider.dart';

class MyCart extends StatelessWidget {
  MyCart({super.key, this.showBottom = true});

  final bool showBottom;

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
                  Consumer(builder: (context, value, child) {
                    return Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return Dismissible(
                              key: ValueKey<ShoppingModel>(context
                                  .watch<ProviderShop>()
                                  .cartitems[index]),
                              onDismissed: (direction) {
                                context.read<ProviderShop>().deleteFromCart(
                                    index,
                                    context
                                        .read<ProviderShop>()
                                        .cartitems[index]);
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: 200,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 0, vertical: 15),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 15,
                                            ),
                                            // showing the itemcount of each elements , that means an item have added how much times
                                            Text(
                                              "Quantity ${context.watch<ProviderShop>().cartitems[index].count} ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                ElevatedButton(
                                                  style: ButtonStyle(
                                                      foregroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.white),
                                                      backgroundColor:
                                                          MaterialStatePropertyAll(
                                                              Colors.black)),
                                                  onPressed: () {
                                                    // same adding function  in cart screen
                                                    context
                                                        .read<ProviderShop>()
                                                        .addTocart(context
                                                            .read<
                                                                ProviderShop>()
                                                            .cartitems[index]);
                                                  },
                                                  child: Text("Add one"),
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                ElevatedButton(
                                                  // same removing function also in cart screen
                                                  onPressed: context
                                                              .watch<
                                                                  ProviderShop>()
                                                              .cartitems[index]
                                                              .count ==
                                                          0
                                                      ? null
                                                      : () {
                                                          context
                                                              .read<
                                                                  ProviderShop>()
                                                              .removeFromcart(context
                                                                  .read<
                                                                      ProviderShop>()
                                                                  .cartitems[index]);
                                                        },
                                                  child: Text("remove one"),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  context
                                                      .read<ProviderShop>()
                                                      .deleteFromCart(
                                                          index,
                                                          context
                                                              .read<
                                                                  ProviderShop>()
                                                              .cartitems[index]);
                                                },
                                                child: Text(
                                                    "Remove item From Cart")),
                                            Text(
                                              "Buy Now",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w600),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) => Divider(),
                          itemCount:
                              context.read<ProviderShop>().cartitemCount),
                    );
                  }),
                ],
              ),
        bottomNavigationBar: showBottom
            ? Container(
                height: 50,
                color: Colors.black,
                child: Center(
                  child: context.watch<ProviderShop>().price == 0
                      ? InkWell(
                          onTap: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(
                                builder: (context) => HomeScreen(),
                              ),
                              (route) => false,
                            );
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
              )
            : SizedBox());
  }
}
