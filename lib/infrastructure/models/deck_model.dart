import 'package:karteikarten/domain/entities/deck_entity.dart';
import 'package:karteikarten/domain/entities/id.dart';
import 'package:karteikarten/infrastructure/models/index_card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DeckModel{
  final String id;
  final String title;
  DeckModel({required this.id, required this.title});


  Map<String, dynamic> toMap(){
    return {
      "id": id,
      "title": title,
    };
  }

  factory DeckModel.fromMap(Map<String, dynamic> map){
    return DeckModel(
      id: "",
      title: map["title"] as String,
    );
  }

  DeckModel copyWith({
    String? id,
    String? title,
  }) {
    return DeckModel(
        id: id ?? this.id,
        title: title ?? this.title,);
  }

  factory DeckModel.fromFirestore(QueryDocumentSnapshot<Map<String, dynamic>> doc){
    return DeckModel.fromMap(doc.data()).copyWith(id: doc.id);
  }

  DeckEntity toDomain(){
    return DeckEntity(
      id:  UniqueID.fromUniqueString(id), 
      title: title,
    );
  }

  factory DeckModel.fromDomain(DeckEntity deckEntity){
    return DeckModel(
      id: deckEntity.id.value, 
      title: deckEntity.title
    );
  }
}