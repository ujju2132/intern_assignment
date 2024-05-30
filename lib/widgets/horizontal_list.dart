import 'package:flutter/material.dart';

class HorizontalImageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(5, (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
              width: 97,
              height: 97,
              decoration: BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('assets/weeknd.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
            ),
          );
        }),
      ),
    );
  }
}
