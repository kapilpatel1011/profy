class UserProfile {
  String? id;
  String? name;
  String? email;
  String? gender;

  UserProfile({this.id, this.name, this.email, this.gender});

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json['id'],
    name: json['name'],
    email: json['email'],
    gender: json['gender'],
  );

  Map<String, dynamic> tojson() => {
    "id": id,
    "name": name,
    "email": email,
    "gender": gender,
  };
}
