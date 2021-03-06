import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'my_screen.i18n.dart';
import 'my_widget.dart';

// Developed by Marcelo Glasberg (Aug 2019).
// For more info, see: https://pub.dartlang.org/packages/i18n_extension

class MyScreen extends StatefulWidget {
  @override
  _MyScreenState createState() => _MyScreenState();
}

class _MyScreenState extends State<MyScreen> {
  int counter;

  @override
  void initState() {
    super.initState();
    counter = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Spacer(flex: 2),
          MyWidget(),
          Spacer(),
          Container(
            height: 50,
            alignment: Alignment.center,
            child: Text(
              "You clicked the button %d times:".plural(counter),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 17),
            ),
          ),
          MaterialButton(
            color: Colors.blue,
            child: Text(
              "Increment".i18n,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onPressed: _increment,
          ),
          Spacer(),
          MaterialButton(
            color: Colors.blue,
            child: Text(
              "Change Language".i18n,
              style: TextStyle(color: Colors.white, fontSize: 17),
            ),
            onPressed: _onPressed,
          ),
          Text(
            "Locale: ${I18n.locale}",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 13, color: Colors.grey),
          ),
          Spacer(flex: 2),
        ],
      ),
    );
  }

  void _onPressed() =>
      I18n.of(context).locale = (I18n.localeStr == "pt_br") ? null : Locale("pt_BR");

  void _increment() => setState(() => counter++);
}

////////////////////////////////////////////////////////////////////////////////////////////////////
