import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/auth/auth_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/application/observer/observer_bloc.dart';
import 'package:karteikarten/core/failures/map/map_failures.dart';
import 'package:karteikarten/presentation/home/widgets/add_deck.dart';
import 'package:karteikarten/presentation/home/widgets/deck_widget.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/animated_signup_background.dart';
import 'package:karteikarten/shared/constant.dart';

import 'widgets/app_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  bool _searchBoolean = false;

  final List<String> _searchlist = [];

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
    final observerBloc = serviceLocator<ObserverBloc>()
      ..add(ObserverAllEvent());
    return MultiBlocProvider(
        providers: [
          BlocProvider<ObserverBloc>(create: (context) => observerBloc),
          BlocProvider<ControllerBloc>(
              create: (context) => serviceLocator<ControllerBloc>())
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthStateUnauthenticated) {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("/signupPage", (route) => false);
              }
            }),
            BlocListener<ControllerBloc, ControllerState>(
                listener: (context, state) {
              if (state is ControllerFailure) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(mapDeckFailureToMessage(state.deckFailure)),
                  backgroundColor: Colors.red,
                ));
              }
            }),
          ],
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize: const Size.fromHeight(kToolbarHeight),
                child: HomeAppBar(
                    onSearchTextChanged: (text) {
                      setState(() {
                        _searchlist
                            .clear(); // Die Liste löschen, um die Ergebnisse neu zu erstellen
                        _searchBoolean =
                            text.isNotEmpty; // Suchstatus aktualisieren
                      });
                    },
                    controller: _searchController,
                    isSearching: _searchBoolean)),
            body: !_searchBoolean
                ? const Stack(
                    children: [
                      AnimatedBackground(),
                      SingleChildScrollView(
                        child: Column(
                          children: [
                            AddDeck(),
                            SizedBox(
                              height: padding_20,
                            ),
                            DeckWidget(),
                          ],
                        ),
                      ),
                    ],
                  )
                : BlocBuilder<ObserverBloc, ObserverState>(
                    builder: (context, state) {
                    if (state is ObserverSuccess) {
                      for (var deck in state.deckEntity) {
                        for (var card in deck.indexcards) {
                          if (_searchController.text == card.tag) {
                            _searchlist.add(card.tag);
                          }
                        }
                      }
                      return _searchListView();
                    } else {
                      return Container();
                    }
                  }),
          ),
        ));
  }
}
