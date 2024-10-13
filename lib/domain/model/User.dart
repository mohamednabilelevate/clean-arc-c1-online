/// id : "6702ad39e77d68595a291e8b"
/// username : "elevate123"
/// firstName : "Elevate"
/// lastName : "Tech"
/// email : "admin123@elevate.com"
/// phone : "01094155711"
/// isVerified : false

class User {
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
  bool operator ==(Object other) {
    if(other is User){
      // other is of type user
      if(id != other.id){
        return false;
      }
      if(token != other.token){
        return false;
      }
      if(email != other.email){
        return false;
      }
      return true;
    }
    return false;
  }

}