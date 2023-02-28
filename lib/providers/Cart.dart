import 'package:electronic/model/card.dart';
import 'package:flutter/cupertino.dart';

class Cart with ChangeNotifier {
  final List<Carditem> _item = [];
  late double _price;
  add(Carditem item) {
    _item.add(item);

    // _price += item.price;
    notifyListeners();
  }

  remove(Carditem item) {
    _item.remove(item);
    // _price -= item.price;
    notifyListeners();
  }

  int get count {
    return _item.length;
  }

  double get totalprice {
    return _price;
  }

  List<Carditem> get basketitem {
    return _item;
  }
}
