class UserFormData {
  final dynamic firstname;
  final dynamic lastname;
  final dynamic email;
  final dynamic phonenumber;

  void setFullName(String firstName, String lastName) => '$firstName $lastName';

  UserFormData({
    this.firstname,
    this.lastname,
    this.email,
    this.phonenumber,
  });

  factory UserFormData.fromJson(Map<String, dynamic> json) => UserFormData(
        firstname: json['firstname'],
        lastname: json['lastname'],
        email: json['email'],
        phonenumber: json['phonenumber'],
      );

  Map<String, dynamic> toJson() => {
        'firstname': firstname,
        'lastname': lastname,
        'email': email,
        'phonenumber': phonenumber,
      };
}
