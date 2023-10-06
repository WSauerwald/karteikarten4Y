import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karteikarten/application/controller/controller_bloc.dart';
import 'package:karteikarten/application/observer/observer_bloc.dart';
import 'package:karteikarten/presentation/config_indexcard/config_indexcard.dart';
import 'package:karteikarten/presentation/home/widgets/delet_dialog.dart';
import 'package:karteikarten/shared/constant.dart';

enum SampleItem { itemOne, itemTwo }

class DeckWidget extends StatefulWidget {
  const DeckWidget({super.key});

  @override
  State<DeckWidget> createState() => _DeckWidgetState();
}

class _DeckWidgetState extends State<DeckWidget> {
  final Color color2 = const Color.fromARGB(255, 184, 69, 69);
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<ObserverBloc, ObserverState>(
      builder: (context, state) {
        if (state is ObserverInitial) {
          return Container();
        } else if (state is ObserverLoading) {
          return Column(
            children: [
              const SizedBox(
                height: padding_50,
              ),
              CircularProgressIndicator(color: Colors.white.withOpacity(.7)),
            ],
          );
        } else if (state is ObserverFailure) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Error by loading data!!!"),
            backgroundColor: Colors.red,
          ));
        } else if (state is ObserverSuccess) {
          return SizedBox(
            height: size.height * .698,
            width: size.width - padding_30,
            child: ListView.builder(          
              shrinkWrap: true,
              itemCount: state.deckEntity.length,
              itemBuilder: (BuildContext context, int index) {
                final deck = state.deckEntity[index];
                return InkWell(
                  onDoubleTap: () {
                    print("drücken auf Karteikarten Lernen");
                  },
                  child: Card(
                    //elevation: 1,
                    child: ListTile(
                        title: Text(deck.title),
                        subtitle: Text("Indexcards: ${deck.indexcards.length}"),
                        trailing: PopupMenuButton(
                            itemBuilder: (BuildContext context) =>
                                <PopupMenuEntry<SampleItem>>[
                                  PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemOne,
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ConfigIndexcard(deckEntity: deck)));
                                      },
                                      child: const Text('Create new indexcard'),
                                    ),
                                  ),
                                  PopupMenuItem<SampleItem>(
                                    value: SampleItem.itemTwo,
                                    child: InkWell(
                                      onTap: () {
                                        final controllerBloc =
                                            context.read<ControllerBloc>();
                                        showDialog<String>(
                                          context: context,
                                          builder: (BuildContext context) =>
                                              DeleteDialog(
                                                  deckEntity:
                                                      state.deckEntity[index],
                                                  bloc: controllerBloc),
                                        );
                                      },
                                      child: const Text('Delete'),
                                    ),
                                  ),
                                ])),
                  ),
                );
              },
            ),
          );
        }
        return Container();
      },
    );
  }
}
