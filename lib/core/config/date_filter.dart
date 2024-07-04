enum DateFilter {
  daily("Daily"),
  weekly("Weekly"),
  monthly("Monthly"),
  yearly("Yearly");

  final String title;
  const DateFilter(this.title);

  String get status {
    switch(this) {
      case DateFilter.daily:
        return "day";
      case DateFilter.weekly:
        return "week";
      case DateFilter.monthly:
        return "month";
      case DateFilter.yearly:
        return "year";
    }
  }

}
