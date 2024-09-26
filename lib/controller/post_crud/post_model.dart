class PostModel{
  final String? id;
  final String? name;
  final String? phone;
  final String? patientProblem;
  final String? bloodAmount;
  final String? donationDate;
  final String? donationTime;
  final String? patientGender;
  final String? patientBloodGroup;
  final String? hemoglobin;
  final String? location;
  final String? mobileNo;
  final String? referenceMblNo;
  final String? img;

  PostModel({
    this.id,
    this.name,
    this.phone,
    this.patientProblem,
    this.bloodAmount,
    this.donationDate,
    this.donationTime,
    this.patientGender,
    this.patientBloodGroup,
    this.hemoglobin,
    this.location,
    this.mobileNo,
    this.referenceMblNo,
    this.img,
  });

}

class Response {
  int statusCode;
  dynamic data;

  Response({
    this.statusCode = 200,
    this.data
  });
}