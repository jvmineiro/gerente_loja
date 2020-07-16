import 'package:flutter/material.dart';

class OrderHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Daniel"),
              Text("Rua Flutter Top"),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Text("Preço Produtos", style: TextStyle(fontWeight: FontWeight.w500),),
            Text("Preço Total", style: TextStyle(fontWeight: FontWeight.w500),)
          ],
        ),
      ],
    );
  }
}
