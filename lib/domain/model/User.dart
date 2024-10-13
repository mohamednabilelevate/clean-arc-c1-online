import 'package:equatable/equatable.dart';

/// id : "6702ad39e77d68595a291e8b"
/// username : "elevate123"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin123@elevate.com"
/// phone : "01094155711"
/// isVerified : false

class User extends Equatable{
  User({
    this.id,
    this.username,
    this.firstName,
    this.lastName,
    this.email,
    this.phone,
    this.isVerified,
    this.token});

  String? id;
  String? username;
  String? firstName;
  String? lastName;
  String? email;
  String? phone;
  bool? isVerified;
  String? token;

  @override
  // TODO: implement props
  List<Object?> get props => [id,username];
}