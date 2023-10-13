import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  ProductCard({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image:
                DecorationImage(fit: BoxFit.cover, image: NetworkImage(image))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: IconButton(
                        onPressed: () {}, icon: Icon(Icons.favorite)),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
