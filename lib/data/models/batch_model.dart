class Batch {
  final String date;
  final String time;
  final String days;

  Batch(this.date, this.time, this.days);

  const Batch.empty({this.date = "", this.time = "", this.days = ""});
}
