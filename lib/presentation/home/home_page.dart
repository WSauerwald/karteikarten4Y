import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/auth/auth_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/application/observer/observer_bloc.dart';
import 'package:karteikarten/core/failures/deck_failures.dart';
import 'package:karteikarten/presentation/home/widgets/add_deck.dart';
import 'package:karteikarten/presentation/home/widgets/deck_widget.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/animated_signup_background.dart';
import 'package:karteikarten/shared/constant.dart';

import 'widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

    String _mapFailureToMessage(DeckFailure deckFailure){
      switch(deckFailure.runtimeType){
        case InsufficientPermisssons:
          return "You have not the permission to do that";
        case UnexpectedFailure:
          return "Something went wrong";
        case ContainsNotFoundFailure:
          return "Not Found sry";
        default:
          return "Something went wrong";
      }
    }

  final TextEditingController _searchController = TextEditingController();
  final bool _searchBoolean = false;
  //TODO Liste füllen mit den such tags
  final List<String> _searchlist = ["E"];

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
    final observerBloc = serviceLocator<ObserverBloc>()..add(ObserverAllEvent());
    return MultiBlocProvider(
      providers: [
        BlocProvider<ObserverBloc>(create: (context) => observerBloc),
        BlocProvider<ControllerBloc>(create: (context) => serviceLocator<ControllerBloc>())
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<AuthBloc, AuthState>(listener: (context, state){
            if(state is AuthStateUnauthenticated){
              Navigator.of(context).pushNamedAndRemoveUntil("/signupPage", (route) => false);
            }
          }),
          BlocListener<ControllerBloc, ControllerState>(listener: (context, state){
            if(state is ControllerFailure){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(_mapFailureToMessage(state.deckFailure)),
                      backgroundColor: Colors.red,
                    ));
            }
          }),
        ],
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight),
              child: HomeAppBar(
                  controller: _searchController, isSearching: _searchBoolean)),
          body: !_searchBoolean
              ? const Stack(
                children: [
                  //TODO
                  //const AnimatedBackground(),
                  Column(
                      children: [
                        AddDeck(),
                        SizedBox(
                          height: padding_20,
                        ),
                        DeckWidget(),
                      ],
                    ),
                ],
              )
              : _searchListView(),
        ),
      ),
    );
  }
}
