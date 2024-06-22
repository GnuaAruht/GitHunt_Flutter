enum DateFilter {
  daily("Daily"),
  weekly("Weekly"),
  monthly("Monthly"),
  yearly("Yearly");

  final String title;
  const DateFilter(this.title);
}
