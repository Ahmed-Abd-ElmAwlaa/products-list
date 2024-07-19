import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class SearchAndCartComponent extends StatelessWidget {
  const SearchAndCartComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.indigoAccent),
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                children: [
                  IconButton(
                      icon: const Icon(Icons.search,
                          color: Colors.indigoAccent),
                      onPressed: () {}
                  ),
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                          hintText: "what do you search for?",
                          hintStyle: TextStyle(color:
                          Colors.indigoAccent),
                          border: InputBorder.none),
                    ),
                  ),
                ],
              ),
            ),
              ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              IconlyLight.buy,
              size: 35,
              color: Colors.indigoAccent,
            ),
          ),
        ],
      ),
    );
  }
}
