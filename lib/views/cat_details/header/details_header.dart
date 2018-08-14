import 'dart:async';

import 'package:proyectoprograufro/modelo/ficha.dart';
import 'package:proyectoprograufro/code/api.dart';
import 'package:proyectoprograufro/views/cat_details/header/cut_colored_image.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class CatDetailHeader extends StatefulWidget {
  final Ficha ficha;
  final Object avatarTag;

  CatDetailHeader(
    this.ficha, {
    @required this.avatarTag,
  });

  @override
  _CatDetailHeaderState createState() => new _CatDetailHeaderState();
}

class _CatDetailHeaderState extends State<CatDetailHeader> {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';

  String _likeText = "";
  StreamSubscription _watcher;

  Future<CodaAPi> _api;

/*  void likeCat() async {
    // TODO: Create proper singleton.
    final api = await _api;
    if (await api.atencion(widget.ficha)) {
      api.atencion(widget.ficha);
      setState(() {
        _likeCounter -= 1;
        _likeText = "Atencion";
      });
    }
  }

  void updateLikeState() async {
    final api = await _api;
    _watcher = api.watch(widget.ficha, (ficha) {
      if (mounted) {
        setState(() {
          _likeCounter = ficha.likeCounter;
        });
      }
    });

    bool liked = await api.hasLikedCat(widget.cat);
    if (mounted) {
      setState(() {
        _likeDisabled = false;
        _likeText = liked ? "UN-LIKE" : "LIKE";
      });
    }
  }*/

  @override
  void initState() {
    super.initState();
    /*_likeCounter = widget.cat.likeCounter;*/
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

    /*var likeInfo = new Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          new Icon(
            Icons.thumb_up,
            color: Colors.white,
            size: 16.0,
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: new Text(
              _likeCounter.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            )
          )
        ],
      ),
    );*/

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
                //TODO Handle Adopt
              },
              child: new Text('Paciente'),
            ),
          ),
          new ClipRRect(
            borderRadius: new BorderRadius.circular(30.0),
            child: new RaisedButton(
              color: Colors.lightGreen,
              disabledColor: Colors.grey,
              textColor: Colors.white,
              //onPressed: _likeDisabled ? null : likeCat,
              child: new Text(_likeText),
            ),
          ),
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
