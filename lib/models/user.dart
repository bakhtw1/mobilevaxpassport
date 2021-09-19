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

class HealthRecord {
  final String dateOfBirth;
  final String doseOneAgent;
  final String doseOneDate;
  final String doseOneLocation;
  final String doseTwoAgent;
  final String doseTwoDate;
  final String doseTwoLocation;

  HealthRecord(
      {required this.dateOfBirth,
      required this.doseOneAgent,
      required this.doseOneDate,
      required this.doseOneLocation,
      required this.doseTwoAgent,
      required this.doseTwoDate,
      required this.doseTwoLocation});
}
