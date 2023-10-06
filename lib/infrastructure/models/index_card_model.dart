import 'package:karteikarten/domain/entities/id.dart';
import 'package:karteikarten/domain/entities/index_card_entity.dart';

class IndexCardModel {
  final String id;
  final String fondside;
  final String backside;
  final String tag;
  IndexCardModel(
      {required this.id,
      required this.fondside,
      required this.backside,
      required this.tag});

  factory IndexCardModel.fromMap(Map<String, dynamic> card) {
    return IndexCardModel(
      id: card["id"] as String,
      fondside: card["fondside"] as String,
      backside: card["backside"] as String,
      tag: card["tag"] as String,
    );
  }

  IndexCardEntity toDomain() {
    return IndexCardEntity(
        id: UniqueID.fromUniqueString(id),
        fondside: fondside,
        backside: backside,
        tag: tag);
  }

  factory IndexCardModel.fromDomain(IndexCardEntity cardEntity) {
    return IndexCardModel(
        id: cardEntity.id.value,
        fondside: cardEntity.fondside,
        backside: cardEntity.backside,
        tag: cardEntity.tag);
  }
}
