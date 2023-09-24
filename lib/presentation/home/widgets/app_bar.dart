import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  final TextEditingController controller;
  bool isSearching;
  HomeAppBar({super.key, required this.controller, required this.isSearching});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}



class _HomeAppBarState extends State<HomeAppBar> {

  Widget _searchTextField() {
    return TextField(
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardAppearance: Brightness.dark,
      controller: widget.controller,
      autofocus: true, //Display the keyboard when TextField is displayed
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search, //Specify the action button on the keyboard
      decoration: const InputDecoration( //Style of TextField
        enabledBorder: UnderlineInputBorder( //Default TextField border
          borderSide: BorderSide(color: Colors.white)
        ),
        focusedBorder: UnderlineInputBorder( //Borders when a TextField is in focus
          borderSide: BorderSide(color: Colors.white)
        ),
        hintText: 'Search', //Text that is displayed when nothing is entered.
        hintStyle: TextStyle( //Style of hintText
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: !widget.isSearching ? const Text("Karteikarten") : _searchTextField(),
      centerTitle: true,
      leading: IconButton(onPressed: (){
        //TODO Logut
      }, icon: const Icon(Icons.logout)),
      actions: !widget.isSearching
        ? [
          IconButton(
          icon: Icon(Icons.search),
          onPressed: () {
            setState(() {
              widget.isSearching = true;
            });
          })
        ] 
        : [
          IconButton(
            icon: Icon(Icons.clear),
            onPressed: () {
              setState(() {
                widget.isSearching = false;
              });
            }
          )
      ],
    );
  }
}