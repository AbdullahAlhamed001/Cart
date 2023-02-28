import 'package:electronic/model/card.dart';
import 'package:flutter/material.dart';

class SyleFile with ChangeNotifier {
  final String _ratingImg =
      "assets/images/iconfinder_-_Star-Favorite-Featured-Famous-Super_3844428.png";

  String _unHartImg = "assets/images/Unheart (1).png";
  String _hartImg = "assets/images/heart (1).png";
  final double _rating = 4.6;
  final Color _maincolor = const Color(0xff333742);
  final Color _subcolor = const Color(0xffFFFFFF);
  final Color _cardcolor = const Color(0xff454D5A);
  final Color _cardcolorBackground = const Color(0xff707070);
  final List<String> _items = ["PS5", "PS4", "XBOX ONE", "XBOX ONE X"];
  final List<Carditem> _playItem = [
    Carditem(
        name: "PlayStation 5",
        picName: "assets/images/Mask Group 433.png",
        price: 890.00,
        priceAfter: 900),
    Carditem(
        name: "PlayStation 5",
        picName: "assets/images/Mask Group 435.png",
        price: 890.00,
        priceAfter: 900),
    Carditem(
        name: "Wireless Headset",
        picName: "assets/images/PS5HEADSETW.png",
        price: 179.95,
        priceAfter: 180.90),
    Carditem(
        name: "Media Remote",
        picName: "assets/images/PS5MEDIAREMOTEW.png",
        price: 54.95,
        priceAfter: 60.95),
    Carditem(
        name: "Bread Loaf",
        picName: "assets/images/PS5DSDOCKW.png",
        price: 0.99,
        priceAfter: 3.99),
  ];
  List get item => _items;
  int get count => _items.length;
  int get countTheplay => _playItem.length;
  String get imgName => _ratingImg;
  String get unharImg => _unHartImg;
  String get hearImg => _hartImg;
  double get theRating => _rating;
  Color get maincolor => _maincolor;
  Color get subcolor => _subcolor;
  Color get cardcolor => _cardcolor;

  Color get cardcolorBackground => _cardcolorBackground;
  changeImg() {
    _unHartImg = hearImg;
    notifyListeners();
  }

  backChangeImg() {
    _hartImg = unharImg;
    notifyListeners();
  }

  List<Carditem> get thePlayStion {
    return _playItem;
  }
}
