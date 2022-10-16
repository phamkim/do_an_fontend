import 'package:flutter/material.dart';

import '../constance.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Search"),
        ),
        body: Container(
          margin: const EdgeInsets.all(kPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kBorder),
              color: Theme.of(context).cardColor),
          child: TextFormField(
            cursorColor: Theme.of(context).primaryColor,
            decoration: const InputDecoration(
              border: InputBorder.none,
              prefixIcon: Icon(
                Icons.search_outlined,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
