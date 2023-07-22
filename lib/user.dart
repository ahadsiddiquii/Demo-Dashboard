class User {
  late int id;
  late String email;
  late String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson(User user) {
    Map<String, dynamic> userMap = {
      "id": id,
      "email": email,
      "password": password,
    };
    return userMap;
  }
}
