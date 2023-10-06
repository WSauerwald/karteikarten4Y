import 'id.dart';

class DeckEntity {
  final UniqueID id;
  final String title;
  DeckEntity({required this.id, required this.title});

  factory DeckEntity.empty() {
    return DeckEntity(id: UniqueID(), title: "");
  }

  DeckEntity copyWith({
    UniqueID? id,
    String? title,
  }) {
    return DeckEntity(
        id: id ?? this.id,
        title: title ?? this.title);
  }
}
