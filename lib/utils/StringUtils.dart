class StringUtils{
  String extractFirstName(String? fullName){
    if(fullName == null){
      return "";
    }
    if(fullName.isEmpty){
      return "";
    }
    return fullName?.split(" ").first ?? "";
  }
  String extractLastName(String fullName){
    return fullName.split(" ")[1];
  }
}