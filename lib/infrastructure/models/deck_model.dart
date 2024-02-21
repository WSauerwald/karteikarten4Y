import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/entities/id.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:karteikarten/infrastructure/models/index_card_model.dart';

class DeckModel {
  final String id;
  final String title;
  final List<IndexCardModel> indexcards;
  DeckModel({required this.id, required this.title, required this.indexcards});

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "indexcards": indexcards.map((card) => card.toMap()).toList()
    };
  }

  factory DeckModel.fromMap(Map<String, dynamic> map) {
    return DeckModel(
      id: "",
      title: map["title"] as String,
      indexcards: (map["indexcards"] as List<dynamic>)
          .map((card) => IndexCardModel.fromMap(card))
          .toList(),
    );
  }

  DeckModel copyWith(
      {String? id, String? title, List<IndexCardModel>? indexcards}) {
    return DeckModel(
        id: id ?? this.id,
        title: title ?? this.title,
        indexcards: indexcards ?? this.indexcards);
  }

  factory DeckModel.fromFirestore(
      QueryDocumentSnapshot<Map<String, dynamic>> doc) {
    return DeckModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  DeckEntity toDomain() {
    return DeckEntity(
      id: UniqueID.fromUniqueString(id),
      title: title,
      indexcards: indexcards.map((card) => card.toDomain()).toList(),
    );
  }

  factory DeckModel.fromDomain(DeckEntity deckEntity) {
    return DeckModel(
        id: deckEntity.id.value,
        title: deckEntity.title,
        indexcards: deckEntity.indexcards
            .map((card) => IndexCardModel.fromDomain(card))
            .toList());
  }
}
