import 'package:karteikarten/domain/entities/id.dart';

class IndexCardEntity {
  final String fondside;
  final String backside;
  final String tag;
  IndexCardEntity(
      {
      required this.fondside,
      required this.backside,
      required this.tag});

  IndexCardEntity copyWith({
    UniqueID? id,
    String? fondside,
    String? backside,
    String? tag,
  }) {
    return IndexCardEntity(
        fondside: fondside ?? this.fondside,
        backside: backside ?? this.backside,
        tag: tag ?? this.tag);
  }
}
