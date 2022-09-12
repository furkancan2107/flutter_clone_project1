import 'package:flutter/material.dart';
import 'package:flutter_proje/burc.dart';
import 'dart:math';
import 'package:palette_generator/palette_generator.dart';

class BurcDetay extends StatefulWidget {
  final Burc secilenBurc;
  const BurcDetay({required this.secilenBurc, super.key});

  @override
  State<BurcDetay> createState() => _BurcDetayState();
}

class _BurcDetayState extends State<BurcDetay> {
  Color baslikRengi = Colors.pink;
  late PaletteGenerator _generator;
  @override
  void initState() {
    // TODO: implement initState
    _appBarRenginiBul();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: true,
            backgroundColor: _randomRenk(),
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                widget.secilenBurc.burcAdi + " Burcu Özelikleri",
                style: Theme.of(context).textTheme.headline6,
              ),
              background: Image(
                image:
                    AssetImage("assets/" + widget.secilenBurc.burcBuyukResim),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              _dinamikYap,
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }

  Color _randomRenk() {
    return Color.fromARGB(Random().nextInt(200), Random().nextInt(200),
        Random().nextInt(200), Random().nextInt(200));
  }

  Widget? _dinamikYap(BuildContext, int) {
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.all(8),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          /*color: index % 2 == 0 ? Colors.deepPurpleAccent : Colors.blue*/),
      child: Column(
        children: [
          Text(widget.secilenBurc.burcDetayi,
              style: Theme.of(BuildContext).textTheme.headline6),
          Text(
            widget.secilenBurc.burcTarihi,
            style: Theme.of(BuildContext).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }

  void _appBarRenginiBul() async {
    _generator = await PaletteGenerator.fromImageProvider(
        AssetImage("assets/" + widget.secilenBurc.burcBuyukResim));
    baslikRengi = _generator.dominantColor!.color;
    setState(() {});
  }
}
