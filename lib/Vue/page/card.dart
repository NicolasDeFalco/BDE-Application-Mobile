import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final String title;

  CardItem({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 330,
        height: 180,
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ));
  }
}
