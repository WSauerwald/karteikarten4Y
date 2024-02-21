import 'package:karteikarten/domain/entities/index_card_entity.dart';

class IndexCardModel {
  final String fondside;
  final String backside;
  final String tag;
  IndexCardModel(
      {required this.fondside, required this.backside, required this.tag});

  factory IndexCardModel.fromMap(Map<String, dynamic> card) {
    return IndexCardModel(
      fondside: card["fondside"] as String,
      backside: card["backside"] as String,
      tag: card["tag"] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fondside': fondside,
      'backside': backside,
      'tag': tag,
    };
  }

  IndexCardEntity toDomain() {
    return IndexCardEntity(fondside: fondside, backside: backside, tag: tag);
  }

  factory IndexCardModel.fromDomain(IndexCardEntity cardEntity) {
    return IndexCardModel(
        fondside: cardEntity.fondside,
        backside: cardEntity.backside,
        tag: cardEntity.tag);
  }
}
