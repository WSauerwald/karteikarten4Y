import 'package:flutter/material.dart';
import 'package:karteikarten/presentation/home/widgets/card_deck.dart';

import 'widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _searchController = TextEditingController();
  bool _searchBoolean = false;
  //TODO Liste füllen mit den such tags
  List<String> _list = ["E"];

  Widget _searchListView() { //add
    return ListView.builder(
      itemCount: _list.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(_list[index])
          )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: HomeAppBar(controller: _searchController, isSearching: _searchBoolean)),
      body: !_searchBoolean ? const CardDeck() : _searchListView(),
    );
  }
}