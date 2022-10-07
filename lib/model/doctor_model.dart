class DoctorModel {
  String? doctorId;
  String? fullName;
  String? emailId;
  String? password;
  String? gender;
  String? specialist;
  String? experience;
  String? biography;
  String? phoneNumber;
  String? address;
  String? profileImg;

  DoctorModel(
      {this.doctorId,
        this.fullName,
        this.emailId,
        this.password,
        this.gender,
        this.specialist,
        this.experience,
        this.biography,
        this.phoneNumber,
        this.address,
        this.profileImg});

  DoctorModel.fromJson(Map<String, dynamic> json) {
    doctorId = json['doctor_id'];
    fullName = json['full_name'];
    emailId = json['email_id'];
    password = json['password'];
    gender = json['gender'];
    specialist = json['specialist'];
    experience = json['experience'];
    biography = json['biography'];
    phoneNumber = json['phone_number'];
    address = json['address'];
    profileImg = json['profile_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['doctor_id'] = this.doctorId;
    data['full_name'] = this.fullName;
    data['email_id'] = this.emailId;
    data['password'] = this.password;
    data['gender'] = this.gender;
    data['specialist'] = this.specialist;
    data['experience'] = this.experience;
    data['biography'] = this.biography;
    data['phone_number'] = this.phoneNumber;
    data['address'] = this.address;
    data['profile_img'] = this.profileImg;
    return data;
  }
}
