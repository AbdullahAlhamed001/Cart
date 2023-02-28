// ignore: file_names

import 'package:electronic/Screen/checkout.dart';
import 'package:electronic/model/card.dart';
import 'package:electronic/providers/styleFile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../providers/Cart.dart';

class HaderClass extends StatefulWidget {
  const HaderClass({Key? key}) : super(key: key);

  @override
  State<HaderClass> createState() => _HaderClassState();
}

class _HaderClassState extends State<HaderClass> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

appbarBoot(BuildContext context) {
  return AppBar(
    backgroundColor: context.watch<SyleFile>().maincolor,
    elevation: 0,
    actions: [
      Row(
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Checkout(),
                ));
              },
              icon: const Icon(Icons.shopping_cart_checkout_outlined)),
          Consumer<Cart>(builder: (context, cart, child) {
            return Text(cart.count.toString());
          })
        ],
      )
    ],
  );
}

drawerBoot(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  return Drawer(
      child: Column(
    children: [
      Container(
        width: width,
        height: height / 3,
        decoration: BoxDecoration(color: context.watch<SyleFile>().maincolor),
      ),
      SizedBox(
        height: height / 2,
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: context.watch<SyleFile>().count,
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(context.read<SyleFile>().item[index]),
              onTap: () => Navigator.pop(context),
            );
          },
        ),
      ),
    ],
  ));
}

headerLine(BuildContext context) {
  var size = MediaQuery.of(context).size;
  var height = size.height;
  var width = size.width;
  return SizedBox(
    width: width / 0.5,
    height: height / 20,
    child: ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: context.watch<SyleFile>().count,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {
            if (context.read<SyleFile>().item[index] == "PS5") {}
          },
          child: Container(
            height: 100,
            width: width / 4,
            decoration:
                BoxDecoration(color: context.watch<SyleFile>().maincolor),
            child: Center(
              child: Text(context.read<SyleFile>().item[index],
                  style: fontStyleHeader(context)),
            ),
          ),
        );
      },
    ),
  );
}

fontStyleHeader(BuildContext context) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: context.watch<SyleFile>().subcolor));
}

fontStylesub(BuildContext context) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.normal,
          color: context.watch<SyleFile>().subcolor));
}

fontforprice(BuildContext context) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: context.watch<SyleFile>().subcolor));
}

fontforpriceDescount(BuildContext context) {
  return GoogleFonts.poppins(
      textStyle: TextStyle(
          fontSize: 10,
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.normal,
          color: context.watch<SyleFile>().subcolor));
}

cardwidget(BuildContext context, Carditem item) {
  return Column(
    children: [
      const SizedBox(
        height: 30,
      ),
      Container(
        width: 164,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          color: context.read<SyleFile>().cardcolor,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 50,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30)),
                          color: context.read<SyleFile>().maincolor,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                context.watch<SyleFile>().theRating.toString(),
                                style: fontStylesub(context),
                              ),
                            ),
                            Image.asset(
                              context.watch<SyleFile>().imgName,
                              height: 18,
                              width: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: LikeButton(
                          size: 20.0,
                          likeBuilder: (isLiked) {
                            return ImageIcon(
                              AssetImage(isLiked
                                  ? context.watch<SyleFile>().hearImg
                                  : context.watch<SyleFile>().unharImg),
                              color: isLiked
                                  ? context.watch<SyleFile>().maincolor
                                  : context.watch<SyleFile>().subcolor,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                Image.asset(
                  item.picName,
                  width: 150,
                  height: 150,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Container(
                    height: 72,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        color: context.watch<SyleFile>().cardcolorBackground),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 3, right: 70.0),
                          child:
                              Text(item.name, style: fontStyleHeader(context)),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3, left: 10),
                              child: Text("\$${item.price.toString()}",
                                  style: fontforprice(context)),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0, left: 5),
                              child: Text(
                                item.priceAfter.toString(),
                                style: fontforpriceDescount(context),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 200.0, left: 120),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: context.watch<SyleFile>().maincolor,
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Center(
                    child: IconButton(
                        onPressed: null,
                        icon: Icon(
                          Icons.shopping_cart_sharp,
                          color: context.watch<SyleFile>().subcolor,
                        ))),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}

components(BuildContext context) {
  return SizedBox(
    height: 600,
    child: GridView.builder(
        itemCount: context.read<SyleFile>().countTheplay,
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 314,
            crossAxisSpacing: 20,
            childAspectRatio: 1 / 2),
        itemBuilder: ((context, index) {
          return Consumer<Cart>(
            builder: (context, cart, child) {
              return InkWell(
                onTap: () =>
                    cart.add(context.read<SyleFile>().thePlayStion[index]),
                child: cardwidget(
                    context, context.watch<SyleFile>().thePlayStion[index]),
              );
            },
          );
        })),
  );
}
