class Language {
  final int hours;
  final String name;

  Language({
    required this.hours,
    required this.name,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      hours: json["hours"],
      name: json["name"] == null ? "" : json['name'],
    );
  }
}
