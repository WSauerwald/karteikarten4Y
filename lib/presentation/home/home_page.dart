import 'package:flutter/material.dart';
import 'package:karteikarten/presentation/home/widgets/add_deck.dart';
import 'package:karteikarten/presentation/home/widgets/deck_list.dart';
import 'package:karteikarten/shared/constant.dart';

import 'widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final TextEditingController _searchController = TextEditingController();
  final bool _searchBoolean = false;
  //TODO Liste füllen mit den such tags
  final List<String> _searchlist = ["E"];

  List<Widget> deckList = [const Text("Hi")];

  Widget _searchListView() {
    //add
    return ListView.builder(
        itemCount: _searchlist.length,
        itemBuilder: (context, index) {
          return Card(child: ListTile(title: Text(_searchlist[index])));
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: HomeAppBar(
              controller: _searchController, isSearching: _searchBoolean)),
      body: !_searchBoolean
          ? Column(
              children: [
                const AddDeck(),
                const SizedBox(
                  height: padding_20,
                ),
                DeckList(
                  widgets: [deckList],
                )
              ],
            )
          : _searchListView(),
    );
  }
}
