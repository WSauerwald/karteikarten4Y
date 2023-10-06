import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/service/injection.dart';

class DeleteDialog extends StatelessWidget {
  final DeckEntity deckEntity;
  final ControllerBloc bloc;
  const DeleteDialog({super.key, required this.deckEntity, required this.bloc});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator<ControllerBloc>(),
      child: AlertDialog(
        title: const Text("Selected Deck to delete:"),
        content: Text(deckEntity.title, maxLines: 3, overflow: TextOverflow.ellipsis, style: const TextStyle(fontSize: 25),),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text("CANCEL")),
          TextButton(
            onPressed: () {
              bloc.add(DeleteDeckEvent(deckEntity: deckEntity));
              Navigator.pop(context);
            }, 
            child: const Text("DELETE")),
        ],
      ),  
    );
      
  }
}