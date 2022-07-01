class User {
  User({
    required this.email,
    this.name,
    this.password,
     this.token,
  });

  String email;
  String? name;
  String? password;
  String? token;

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json["name"],
        email: json["email"],
        password: json["password"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "password": password,
        "token": token,
      };
}
