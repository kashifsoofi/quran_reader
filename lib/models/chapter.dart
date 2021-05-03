class Chapter {
  final int id;
  final int chapterNumber;
  final int revelationOrder;
  final String revelationPlace;
  final String nameComplex;
  final String nameArabic;
  final String nameSimple;
  final int versesCount;
  final TranslatedName translatedName;

  Chapter(
      {required this.id,
      required this.chapterNumber,
      required this.revelationOrder,
      required this.revelationPlace,
      required this.nameComplex,
      required this.nameArabic,
      required this.nameSimple,
      required this.versesCount,
      required this.translatedName});

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
        id: json['id'] as int,
        chapterNumber: json['chapter_name'] as int,
        revelationOrder: json['revelation_order'] as int,
        revelationPlace: json['revelation_place'] as String,
        nameComplex: json['name_complex'] as String,
        nameArabic: json['name_arabic'] as String,
        nameSimple: json['name_simple'] as String,
        versesCount: json['verses_count'] as int,
        translatedName: TranslatedName.fromJson(json));
  }
}

class TranslatedName {
  final String languageName;
  final String name;

  TranslatedName({required this.languageName, required this.name});

  factory TranslatedName.fromJson(Map<String, dynamic> json) {
    return TranslatedName(
        languageName: json['language_name'] as String,
        name: json['name'] as String);
  }
}
