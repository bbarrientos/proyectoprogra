import 'dart:async';

import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:proyectoprograufro/code/api.dart';
import 'package:proyectoprograufro/views/details/header/cut_colored_image.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class   FichaDetailHeader extends StatefulWidget {
  final Ficha ficha;
  final Object avatarTag;

  FichaDetailHeader(
    this.ficha, {
    @required this.avatarTag,
  });

  @override
  _FichaDetailHeaderState createState() => new _FichaDetailHeaderState();
}

class _FichaDetailHeaderState extends State<FichaDetailHeader> {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';
  StreamSubscription _watcher;

  Future<CodaAPi> _api;

  @override
  void initState() {
    super.initState();
    _api = CodaAPi.signInWithGoogle();
    //updateLikeState();
  }

  @override
  void dispose() {
    if (_watcher != null) {
      _watcher.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenWidth = MediaQuery.of(context).size.width;

    var diagonalBackground = new DiagonallyCutColoredImage(
      new Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      color: const Color(0xBB42A5F5),
    );

    var avatar = new Hero(
      tag: widget.avatarTag,
      child: new CircleAvatar(
        backgroundImage: new NetworkImage(widget.ficha.avatarUrl),
        radius: 75.0,
      ),
    );

    var actionButtons = new Padding(
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 16.0,
        right: 16.0,
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new MaterialButton(
              minWidth: 140.0,
              color: theme.accentColor,
              textColor: Colors.white,
              onPressed: () async {
              },
              child: new Text('Paciente'),
            ),
          )
        ],
      ),
    );

    return new Stack(
      children: [
        diagonalBackground,
        new Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: new Column(
            children: [
              avatar,

              actionButtons,
            ],
          ),
        ),
        new Positioned(
          top: 26.0,
          left: 4.0,
          child: new BackButton(color: Colors.white),
        ),
      ],
    );
  }
}
