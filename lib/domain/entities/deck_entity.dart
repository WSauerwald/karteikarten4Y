import 'package:karteikarten/domain/entities/index_card_entity.dart';

import 'id.dart';

class DeckEntity {
  final UniqueID id;
  final String title;
  final List<IndexCardEntity> indexcards;
  DeckEntity({required this.id, required this.title, required this.indexcards});

  factory DeckEntity.empty() {
    return DeckEntity(id: UniqueID(), title: "", indexcards: []);
  }

  DeckEntity copyWith({
    UniqueID? id,
    String? title,
    List<IndexCardEntity>? indexcards,
  }) {
    return DeckEntity(
        id: id ?? this.id,
        title: title ?? this.title,
        indexcards: indexcards ?? this.indexcards);
  }
}
