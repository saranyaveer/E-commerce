import 'package:flutter/material.dart';

class Containers {
  Widget customContainer(String text) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.grey.shade600,
            fontSize: 14,
            fontFamily: 'Varela',
          ),
        ),
      ),
    );
  }
}
