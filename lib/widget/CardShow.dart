import 'package:electronic/widget/Header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/styleFile.dart';

class CardShow extends StatelessWidget {
  const CardShow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return cardshow(context);
  }

  ListView cardshow(BuildContext context) {
    return ListView.builder(
        itemCount: context.watch<SyleFile>().countTheplay,
        itemBuilder: ((context, index) {
          return Row(
            children: [
              cardwidget(context, context.read<SyleFile>().thePlayStion[index]),
              const SizedBox(
                width: 20,
              ),
              components(context)
            ],
          );
        }));
  }
}
