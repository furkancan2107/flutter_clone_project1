import 'package:flutter/material.dart';
import 'package:flutter_proje/burc.dart';
import 'package:flutter_proje/listItem.dart';
import 'package:flutter_proje/strings.dart';
import 'dart:math';

class BurcListesi extends StatefulWidget {
  const BurcListesi({super.key});

  @override
  State<BurcListesi> createState() => _BurcListesiState();
}

class _BurcListesiState extends State<BurcListesi> {
  List<Burc> tumBurclar = veriKaynaginiHazirla();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Burc Listesi",
        ),
      ),
      body: Center(
          child: ListView.builder(
        itemBuilder: ((context, index) {
          var a = tumBurclar[index];
          return MyWidget(listelenenBurc: tumBurclar[index]);
        }),
        itemCount: tumBurclar.length,
      )),
    );
  }

  static List<Burc> veriKaynaginiHazirla() {
    List<Burc> gecici = [];
    int i = 0;
    print(gecici);

    for (i = 0; i < 12; i++) {
      var burcAdi = Strings.Burc_Adlari[i];
      var burcTarihi = Strings.Burc_Tarihleri[i];
      var burcDetayi = Strings.Burc_Genel_Ozelikleri[i];

      var burcKucukResim =
          Strings.Burc_Adlari[i].toLowerCase() + "${i + 1}.png";
      var burcBuyukResim =
          Strings.Burc_Adlari[i].toLowerCase() + "_buyuk" + "${i + 1}.png";

      Burc EklenecekBurc =
          Burc(burcAdi, burcTarihi, burcDetayi, burcKucukResim, burcBuyukResim);
      gecici.add(EklenecekBurc);
    }
    return gecici;
  }
}
