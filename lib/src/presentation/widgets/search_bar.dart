import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: TextFormField(
          decoration: InputDecoration(
              enabled: true,
              fillColor: Colors.white,
              filled: true,
              hintText: "search",
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 15, vertical: 15),
              suffixIcon: const Icon(Icons.search),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15))),
        ),
      ),
    );
  }
}
