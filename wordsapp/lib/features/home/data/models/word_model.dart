import '../../domain/entities/word_entity.dart';

class WordModel extends WordEntity {
  WordModel({
    required this.word,
    this.id,
    this.meaning,
    this.idFavored,
    this.favored,
    this.pronunciation,
    this.isValidWordSearch,
    this.hasDefinition,
    this.hasPronunciation,
  }) : super(word: word, id: id, favored: favored);
  late int? id;
  late String word;
  late String? meaning;
  final int? idFavored;
  late String? pronunciation;
  late bool? favored;
  late bool? isValidWordSearch;
  late bool? hasDefinition;
  late bool? hasPronunciation;

  factory WordModel.fromJson(Map<String, dynamic> json) {
    return WordModel(
      id: json["word_id"] ?? 0,
      word: json["word"],
      meaning: json["definition"] ?? "",
      favored: json["is_favorite"] == 1 ? true : false,
      idFavored: json["favorite_word_id"] ?? 0,
      pronunciation: json["pronunciation"] ?? "",
      isValidWordSearch: json["is_valid_word_search"] == 1 ? true : false,
      hasDefinition: json["has_definition"] == 1 ? true : false,
      hasPronunciation: json["has_pronunciation"] == 1 ? true : false,
    );
  }

  Map<String, dynamic> toJson() => {
        'word': word,
        'definition': meaning,
        'pronunciation': pronunciation,
        'word_id': id,
        'is_valid_word_search': isValidWordSearch
      };

  @override
  String toString() {
    return 'WordModel{id: $id, '
        'word: $word,'
        ' meaning: $meaning, '
        'idFavored: $idFavored, '
        'pronunciation: $pronunciation,'
        ' favored: $favored, '
        'isValidWordSearch: $isValidWordSearch,'
        ' hasDefinition: $hasDefinition,'
        ' hasPronunciation: $hasPronunciation}';
  }
}
