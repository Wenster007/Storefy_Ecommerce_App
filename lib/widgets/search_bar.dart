import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(8), color: const Color.fromARGB(
          13, 173, 173, 173)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Search Product",
          hintStyle: const TextStyle(color: Color.fromARGB(255, 126, 126, 129), fontWeight: FontWeight.w300),
          suffixIcon: IconButton(
            icon: const Icon(Icons.search, size: 34),
            color: const Color.fromARGB(255, 126, 126, 129),
            onPressed: () {
              //define function for implementing search
            },
          ),
        ),

        //(value) {function for implementing search on each keystroke}
        onTap: () {},
      ),
    );
  }
}
