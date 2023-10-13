import 'package:flutter/material.dart';
import 'package:online_shopping/model/shopping_model.dart';

class ProviderShop with ChangeNotifier {
  int selectedIndex = 0;
  List<ShoppingModel> _items = [
    ShoppingModel(
      count: 0,
      description:
          "Lorem Ips. Loreap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://rukminim2.flixcart.com/image/850/1000/xif0q/shirt/w/h/e/m-mss22eppcsh019a-metronaut-original-imagh4qfgp2zmxkd.jpeg?q=90",
    ),
    ShoppingModel(
      count: 0,
      description:
          "ype and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT38jvHLLoWINP8om1GSc9UikvEyvJDbRUkUKq3-pwABHFDi926A_gVWFWTeBN0_VvVLAw&usqp=CAU",
    ),
    ShoppingModel(
      count: 0,
      description:
          " printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://rukminim2.flixcart.com/image/850/1000/xif0q/t-shirt/k/g/s/xxl-tommmy-round-neck-t-shirt-fashlook-original-imagzfexnjwfxgxz.jpeg?q=90",
    ),
    ShoppingModel(
      count: 0,
      description:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR2xlUDH8VevwBBDVqgkYvy4TWyeLkza_4jQh3TT4r8Vbvqyc9xzfmHd0S50PjmiQqIg0E&usqp=CAU",
    ),
    ShoppingModel(
      count: 0,
      description:
          "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://rukminim2.flixcart.com/image/850/1000/xif0q/shirt/l/z/i/xl-e-black-chex-cheapshirts-original-imaghy5xyn78qqry.jpeg?q=90",
    ),
    ShoppingModel(
      count: 0,
      description:
          " Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTnpHGBgAIBSM8_ROgTRP3MT9nYbhMPUuFUVhne7MAWWqDEUQjPpc1PH1VJRwGtjp0P10&usqp=CAU",
    ),
    ShoppingModel(
      count: 0,
      description:
          " specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      image:
          "https://rukminim2.flixcart.com/image/850/1000/xif0q/shirt/t/t/6/m-towel-002-tallwalker-original-imaghfyfukxgxzms.jpeg?q=90",
    ),
  ];

  List<ShoppingModel> _cartItem = [];
  int _cartCount = 0;
  int _price = 0;

  List<ShoppingModel> get items => _items;
  List<ShoppingModel> get cartitems => _cartItem;
  int get itemCount => _items.length;
  int get cartitemCount => _cartItem.length;
  int get cartcount => _cartCount <= 0 ? 0 : _cartCount;
  int get price => _price;

  void addTocart(ShoppingModel item) {
    // checking the cart have datas(Shopping model)
    if (_cartItem.contains(item)) {
      // if the cart have datas then increase the count with index
      // count-- used to removing item one by one
      _cartItem[_cartItem.indexOf(item)].count++;
      // if cart item have no datas then add datas into cart
    } else {
      // adding
      _cartItem.add(item);
      //update the count
      _cartItem[_cartItem.indexOf(item)].count = 1;
      // update count of each element in the list that is how much time we add the same element the show the total no.of itemcount
      _items[_items.indexOf(item)].count = 1;
    }
    // update the price with adding 2000
    // when adding one item the total price increase with the price 2000
    _price = _price + 2000;
    // update the total no.of cartcount
    _cartCount++;
    notifyListeners();
  }

  void removeFromcart(ShoppingModel item) {
    // checking the cart have the item and checking cart have  only one element ,the cart have only one item then remmove the item in the cart
    if (_cartItem.contains(item) &&
        _cartItem[_cartItem.indexOf(item)].count == 1) {
      // update the item count
      _items[_items.indexOf(item)].count = 0;
      // and remove item from the cart
      _cartItem.remove(_cartItem[_cartItem.indexOf(item)]);
      // update the cart count
      _cartCount--;
    }
    // if cart have two or more same items
    // if item count >0 then removing one by one
    else if (_cartItem[_cartItem.indexOf(item)].count > 0) {
      // update the cart count
      // count-- used to removing item one by one
      _cartItem[_cartItem.indexOf(item)].count--;
      _cartCount--;
    }
    // update the price with removing 2000
    // when removing one item the total price decrease with the price 2000
    _price = _price - 2000;
    notifyListeners();
  }
}
