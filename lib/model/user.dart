part of 'models.dart';

class User {
  final int? id;
  final String? name;
  final String? email;
  final String? password;
  final String? phoneNumber;
  final String? houseNumber;
  final String? city;
  final String? picturePath;


  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phoneNumber,
    this.houseNumber,
    this.city,
    this.picturePath,
  });
}