import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/auth/auth_bloc.dart';

// ignore: must_be_immutable
class HomeAppBar extends StatefulWidget {
  final TextEditingController controller;
  bool isSearching;
  final Function(String) onSearchTextChanged;
  HomeAppBar(
      {super.key,
      required this.controller,
      required this.isSearching,
      required this.onSearchTextChanged});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  Widget _searchTextField() {
    return TextField(
      onChanged: widget.onSearchTextChanged,
      onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
      keyboardAppearance: Brightness.dark,
      controller: widget.controller,
      autofocus: true,
      cursorColor: Colors.white,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
      ),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.white60,
          fontSize: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          !widget.isSearching ? const Text("Karteikarten") : _searchTextField(),
      centerTitle: true,
      leading: IconButton(
          onPressed: () {
            BlocProvider.of<AuthBloc>(context).add(SignOutPressedEvent());
          },
          icon: const Icon(Icons.logout)),
      actions: !widget.isSearching
          ? [
              IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    setState(() {
                      widget.isSearching = true;
                    });
                  })
            ]
          : [
              IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      widget.isSearching = false;
                    });
                  })
            ],
    );
  }
}
