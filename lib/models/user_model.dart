class UserModel {
  final String uid;
  final String name;
  final String email;
  final String authProvider;

  const UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.authProvider,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String? ?? '',
      name: map['name'] as String? ?? '',
      email: map['email'] as String? ?? '',
      authProvider: map['authProvider'] as String? ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'name': name,
      'email': email,
      'authProvider': authProvider,
    };
  }
}
