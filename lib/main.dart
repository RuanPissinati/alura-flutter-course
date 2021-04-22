import 'package:flutter/material.dart';

void main() {
  runApp(
    Column(
      children: <Widget>[
        Text("Ola mundo", textDirection: TextDirection.ltr,),
        Text("Ola mundo", textDirection: TextDirection.ltr,),
        Text("Ola mundo", textDirection: TextDirection.ltr,),
        Column(
          children: <Widget>[
            Text("Ola mundo", textDirection: TextDirection.ltr,),
            Text("Ola mundo", textDirection: TextDirection.ltr,),
            Text("Ola mundo", textDirection: TextDirection.ltr,)
          ],
        )
      ],
    )
  );
}