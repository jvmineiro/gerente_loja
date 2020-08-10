import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenteloja/blocs/category_bloc.dart';

class EditCategoryDialog extends StatelessWidget {

  final CategoryBloc _categoryBloc;

  EditCategoryDialog({DocumentSnapshot category }) :
      _categoryBloc = CategoryBloc(category);


  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: GestureDetector(
                child: StreamBuilder(
                  stream: _categoryBloc.outImage,
                  // ignore: missing_return
                  builder: (context, snapshot) {
                    if(snapshot.data != null)
                    return CircleAvatar(
                      child: snapshot.data is File ?
                      Image.file(snapshot.data, fit: BoxFit.cover,):
                      Image.network(snapshot.data, fit: BoxFit.cover,),
                      backgroundColor: Colors.transparent,
                    );
                    else return Icon(Icons.image);
                  }
                ),
              ),
              title: TextField(

              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                StreamBuilder<Object>(
                  stream: _categoryBloc.outDelete,
                  builder: (context, snapshot) {
                    if(!snapshot.hasData) return Container();
                    return FlatButton(
                      child: Text("Excluir"),
                      textColor: Colors.red,
                      onPressed: snapshot.data ? (){

                      } : null,
                    );
                  }
                ),
                FlatButton(
                  child: Text("Salvar"),
                  onPressed: (){

                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
