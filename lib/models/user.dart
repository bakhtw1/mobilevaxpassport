class CustomUser {
  final String uid;

  CustomUser({required this.uid});
}

class UserData {
  final String uid;
  final String name;
  final String email;
  final String healthCardNo;

  UserData(
      {required this.uid,
      required this.name,
      required this.email,
      required this.healthCardNo});
}
