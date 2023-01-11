extension StringExtension on String {
  bool isNumeric() => double.tryParse(this) != null;
  String getFirstLetters() => split(" ").map((e) => e[0]).take(2).join("");
}
