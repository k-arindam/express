class ExpressUser {
  final String id;
  final String name;
  final String email;

  const ExpressUser({
    required this.id,
    required this.name,
    required this.email,
  });

  factory ExpressUser.fromJson(Map json) => ExpressUser(
        id: json['id'],
        name: json['name'],
        email: json['email'],
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
