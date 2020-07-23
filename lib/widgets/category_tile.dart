import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot category;

  CategoryTile(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      child: Card(
        child: ExpansionTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(category.data["icon"]),
            backgroundColor: Colors.transparent,
          ),
          title: Text(
            category.data["title"],
            style: TextStyle(color: Colors.grey[850], fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
