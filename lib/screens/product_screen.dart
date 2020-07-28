import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gerenteloja/blocs/product_bloc.dart';
import 'package:gerenteloja/validators/product_validator.dart';
import 'package:gerenteloja/widgets/images_widget.dart';

class ProductScreen extends StatefulWidget {

  final String categoryId;
  final DocumentSnapshot product;

  ProductScreen({this.categoryId, this.product});


  @override
  _ProductScreenState createState() => _ProductScreenState(categoryId, product);
}

class _ProductScreenState extends State<ProductScreen> with ProductValidator{

  final ProductBloc _productBloc;

  final _formKey = GlobalKey<FormState>();

  _ProductScreenState(String categoryId, DocumentSnapshot product) :
        _productBloc = ProductBloc(categoryId: categoryId, product: product);

  @override
  Widget build(BuildContext context) {

    InputDecoration _buidlDecoration(String label) {
      return InputDecoration(
        labelText: label,
        labelStyle: TextStyle(color: Colors.grey)
      );
    }

    final _fieldStyle = TextStyle(
      color: Colors.white,
      fontSize: 16,
    );

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0,
        title: Text("Criar Produto"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.save),
            onPressed: (){
              if(_formKey.currentState.validate()){
                _formKey.currentState.save();
              }
            },
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: StreamBuilder<Map>(
          stream: _productBloc.outData,
          builder: (context, snapshot) {
            if(!snapshot.hasData) return Container();
            return ListView(
              padding: EdgeInsets.all(16),
              children: <Widget>[
                Text(
                    "Imagens",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12
                  ),
                ),
                ImagesWidget(
                  context: context,
                  initialValue: snapshot.data["images"],
                  onSaved: _productBloc.saveImages,
                  validator: validateImages,
                ),
                TextFormField(
                  initialValue: snapshot.data["title"],
                  style: _fieldStyle,
                  decoration: _buidlDecoration("Titulo"),
                  onSaved: _productBloc.saveTitle,
                  validator: validateTitle,
                ),
                TextFormField(
                  initialValue: snapshot.data["description"],
                  style: _fieldStyle,
                  maxLines: 6,
                  decoration: _buidlDecoration("Descrição"),
                  onSaved: _productBloc.saveDescription,
                  validator: validateDescription,
                ),
                TextFormField(
                  initialValue: snapshot.data["price"]?.toStringAsFixed(2),
                  style: _fieldStyle,
                  decoration: _buidlDecoration("Preço"),
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: _productBloc.savePrice,
                  validator: validatePrice,
                ),

              ],
            );
          }
        ),
      ),
    );
  }
}
