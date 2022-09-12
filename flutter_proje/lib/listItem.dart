import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:flutter_proje/burc.dart';
import 'package:flutter_proje/burcDetay.dart';

class MyWidget extends StatelessWidget {
  final Burc listelenenBurc;
  const MyWidget({required this.listelenenBurc, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyle = Theme.of(context).textTheme;
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return BurcDetay(secilenBurc: listelenenBurc);
            },
          ));
        },
        leading: Image.asset("assets/" + listelenenBurc.burcKucukResim),
        title: Text(
          listelenenBurc.burcAdi,
          style: textStyle.headline6,
        ),
        subtitle: Text(
          listelenenBurc.burcTarihi,
          style: textStyle.subtitle1,
        ),
        trailing: Icon(Icons.arrow_forward_ios_outlined),
      ),
    );
  }
}
