import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/entities/id.dart';
import 'package:karteikarten/service/injection.dart';
import 'package:karteikarten/shared/constant.dart';
import 'package:karteikarten/shared/input_text_form_field.dart';

class CreateDialog extends StatefulWidget {
  const CreateDialog({super.key});

  @override
  State<CreateDialog> createState() => _CreateDialogState();
}

class _CreateDialogState extends State<CreateDialog> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    return BlocProvider(
      create: (context) => serviceLocator<ControllerBloc>(),
      child: BlocBuilder<ControllerBloc, ControllerState>(
        builder: (context, state) {
          return Form(
            key: formKey,
            child: AlertDialog(
              titleTextStyle:
                  const TextStyle(color: Colors.white, fontSize: padding_20),
              contentTextStyle: const TextStyle(color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 33, 33, 33),
              title: const Text("Enter a name:"),
              content: InputTextFormField(
                controller: _controller,
                icons: Icons.article,
                labelText: 'Deck name',
                showIcon: true,
              ),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Back")),
                TextButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        DeckEntity deckEntity = DeckEntity(
                            id: UniqueID(),
                            title: _controller.text,
                            indexcards: []);
                        BlocProvider.of<ControllerBloc>(context)
                            .add(CreateDeckEvent(deckEntity: deckEntity));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Create")),
              ],
            ),
          );
        },
      ),
    );
  }
}
