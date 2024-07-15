
const allLanguages = "All Languages";

class Language {

  static final allLanguage = Language(title: allLanguages);

  bool get isAllLang => this == allLanguage;
  final String title;
  final String? colorCode;

  Language({required this.title, this.colorCode});

}
