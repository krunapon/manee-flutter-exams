void main() {
  String? shipDate;
  String? date = shipDate ?? "2023-04-03";
  String? date2 = shipDate!.substring(0,5);
  print("date is $date");
  print("date2 is $date2");
}
