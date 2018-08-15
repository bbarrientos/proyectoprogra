import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:proyectoprograufro/views/details/details_body.dart';
import 'package:proyectoprograufro/views/details/footer/details_footer.dart';
import 'package:proyectoprograufro/views/details/header/details_header.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class FichaDetailsPage extends StatefulWidget {
  final Ficha ficha;
  final Object avatarTag;

  FichaDetailsPage(
    this.ficha, {
    @required this.avatarTag,
  });

  @override
  _FichaDetailsPageState createState() => new _FichaDetailsPageState();
}

class _FichaDetailsPageState extends State<FichaDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var linearGradient = new BoxDecoration(
      gradient: new LinearGradient(
        begin: FractionalOffset.centerRight,
        end: FractionalOffset.bottomLeft,
        colors: [
          Colors.blue,
          Colors.blue,
        ],
      ),
    );

    return new Scaffold(
      body: new SingleChildScrollView(
        child: new Container(
          decoration: linearGradient,
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              new FichaDetailHeader(
                widget.ficha,
                avatarTag: widget.avatarTag,
              ),
              new Padding(
                padding: const EdgeInsets.all(24.0),
                child: new FichaDetailBody(widget.ficha),
              ),
              new FichaShowcase(widget.ficha),
            ],
          ),
        ),
      ),
    );
  }
}
