import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:proyectoprograufro/views/details/footer/showcase_fichatributes.dart';
import 'package:proyectoprograufro/views/details/footer/showcase_details.dart';
import 'package:proyectoprograufro/views/details/footer/showcase_pictures.dart';
import 'package:flutter/material.dart';

class FichaShowcase extends StatefulWidget {
  final Ficha ficha;

  FichaShowcase(this.ficha);

  @override
  _FichaShowcaseState createState() => new _FichaShowcaseState();
}

class _FichaShowcaseState extends State<FichaShowcase>
    with TickerProviderStateMixin {
  List<Tab> _tabs;
  List<Widget> _pages;
  TabController _controller;

  @override
  initState() {
    super.initState();
    _tabs = [
      new Tab(text: 'Radiografias'),
      new Tab(text: 'Direccion'),
      new Tab(text: 'Historial'),
    ];
    _pages = [
      new PicturesShowcase(widget.ficha),
      new DetailsShowcase(widget.ficha),
      new FichatributesShowcase(widget.ficha),
    ];
    _controller = new TabController(
      length: _tabs.length,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Padding(
      padding: const EdgeInsets.all(16.0),
      child: new Column(
        children: [
          new TabBar(
            controller: _controller,
            tabs: _tabs,
            indicatorColor: Colors.white,
          ),
          new SizedBox.fromSize(
            size: const Size.fromHeight(300.0),
            child: new TabBarView(
              controller: _controller,
              children: _pages,
            ),
          ),
        ],
      ),
    );
  }
}
