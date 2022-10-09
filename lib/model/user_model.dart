class UserModel {
  String? uid;
  String? fullName;
  String? email;
  String? phoneNumber;
  String? password;
  String? birthdate;
  String? gender;
  String? address;
  String? profileImg;

  UserModel(
      {this.uid,
        this.fullName,
        this.email,
        this.phoneNumber,
        this.password,
        this.birthdate,
        this.gender,
        this.address,
        this.profileImg});

  UserModel.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    fullName = json['fullName'];
    email = json['email'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    birthdate = json['birthdate'];
    gender = json['gender'];
    address = json['address'];
    profileImg = json['profileImg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['fullName'] = this.fullName;
    data['email'] = this.email;
    data['phoneNumber'] = this.phoneNumber;
    data['password'] = this.password;
    data['birthdate'] = this.birthdate;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['profileImg'] = this.profileImg;
    return data;
  }
}