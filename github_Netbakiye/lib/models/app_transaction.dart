class AppTransaction {
  final String? id;
  final String? amount;
  final String? description;
  final String? type;
  final DateTime? date;
  final String? categoryId;
  final String? userId;
  final String? categoryName;
  final String? categoryIcon;
  final bool isExcluded;

  AppTransaction({
    this.id,
    this.amount,
    this.description,
    this.type,
    this.date,
    this.categoryId,
    this.userId,
    this.categoryName,
    this.categoryIcon,
    this.isExcluded = false,
  });

  factory AppTransaction.fromJson(Map<String, dynamic> json) {
    String? dbIcon = json['saved_icon']?.toString();
    if (dbIcon == null || dbIcon == "null" || dbIcon.isEmpty) {
      if (json['categories'] != null && json['categories'] is Map) {
        dbIcon = json['categories']['icon']?.toString();
      }
    }

    return AppTransaction(
      id: json["id"]?.toString(),
      amount: json["miktar"]?.toString() ?? json["amount"]?.toString() ?? "0",
      description:
          json["baslik"]?.toString() ?? json["description"]?.toString() ?? "",
      type: json["tur"]?.toString() ?? json["type"]?.toString() ?? "gider",
      date: json["tarih"] != null
          ? DateTime.tryParse(json["tarih"].toString())
          : null,
      userId: json["user_id"]?.toString(),
      categoryId: json["category_id"]?.toString(),
      categoryIcon: dbIcon,
      categoryName: (json['categories'] != null && json['categories'] is Map)
          ? json['categories']['name']?.toString()
          : json["category_name"]?.toString(),
      isExcluded: json['is_excluded'] == true,
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "miktar": amount,
    "baslik": description,
    "tur": type,
    "tarih": date?.toIso8601String(),
    "user_id": userId,
    "category_id": categoryId,
    "saved_icon": categoryIcon,
    "category_name": categoryName,
    "is_excluded": isExcluded,
  };

  AppTransaction copyWith({
    String? id,
    String? amount,
    String? description,
    String? type,
    DateTime? date,
    String? categoryId,
    String? userId,
    String? categoryName,
    String? categoryIcon,
    bool? isExcluded,
  }) {
    return AppTransaction(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      type: type ?? this.type,
      date: date ?? this.date,
      categoryId: categoryId ?? this.categoryId,
      userId: userId ?? this.userId,
      categoryName: categoryName ?? this.categoryName,
      categoryIcon: categoryIcon ?? this.categoryIcon,
      isExcluded: isExcluded ?? this.isExcluded,
    );
  }
}
