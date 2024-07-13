


class Language {

  static final allLanguage = Language(title: 'All Languages');

  bool get isAllLang => this == allLanguage;
  final String title;
  final String? colorCode;

  Language({required this.title, this.colorCode});

}
