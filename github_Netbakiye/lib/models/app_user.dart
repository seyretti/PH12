class AppUser {
  final String id; // ? işaretini kaldırdık, ID zorunlu oldu.
  final String email;
  final String firstName;
  final String lastName;
  final String? profilePhoto; // Bu boş olabilir, sorun yok.

  AppUser({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.profilePhoto,
  });

  // Supabase'den veya JSON'dan gelen veriyi çevirirken
  factory AppUser.fromJson(Map<String, dynamic> json) => AppUser(
        id: json["id"] ?? "",
        email: json["email"] ?? "",
        firstName: json["first_name"] ?? "",
        lastName: json["last_name"] ?? "",
        profilePhoto: json["profile_photo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "profile_photo": profilePhoto,
      };

  // Kullanıcının tam adını almak için yardımcı bir getter
  String get fullName => "$firstName $lastName";
}
