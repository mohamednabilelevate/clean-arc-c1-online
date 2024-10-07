/// message : "success"
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3MDJhZDM5ZTc3ZDY4NTk1YTI5MWU4YiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzI4MjM1MzU1fQ.1UWlNkdKmHyZRcRhNdm69M0911FOqSmwYo8hgKOAddw"

class AuthResponse {
  AuthResponse({
      this.message, 
      this.token,});

  AuthResponse.fromJson(dynamic json) {
    message = json['message'];
    token = json['token'];
  }
  String? message;
  String? token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = message;
    map['token'] = token;
    return map;
  }

}