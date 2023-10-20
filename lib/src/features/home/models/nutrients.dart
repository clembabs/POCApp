class Nutrients {
  final double? enercKcal;
  final double? procnt;
  final double? fat;
  final double? chocdf;
  final double? fibtg;

  Nutrients({
    this.enercKcal,
    this.procnt,
    this.fat,
    this.chocdf,
    this.fibtg,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) => Nutrients(
        enercKcal: json['ENERC_KCAL']?.toDouble(),
        procnt: json['PROCNT']?.toDouble(),
        fat: json['FAT']?.toDouble(),
        chocdf: json['CHOCDF']?.toDouble(),
        fibtg: json['FIBTG']?.toDouble(),
      );
}
