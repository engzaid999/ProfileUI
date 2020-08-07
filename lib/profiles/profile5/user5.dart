

class User5 {
  String name, address, about;
  User5({this.name, this.address, this.about});
}

class Profile {
  User5 user5;
  Profile(
      {this.user5});
}

class Profile5Provider {

  static Profile getProfile() {
    return Profile(
      user5: User5(
        name: "Zaid H. Al-Taai",
        address: "Iraq - Samawah ",
      ),
    );
  }

  static List<String> photos(){
    return List.generate(15, (index){
      return 'assets/sheard/daniel.jpg';
    });
  }

  static List<String> videos(){
    return List.generate(15, (index){
      return 'assets/sheard/daniel.jpg';
    });
  }

  static List<String> posts(){
    return List.generate(15, (index){
      return 'assets/sheard/daniel.jpg';
    });
  }

  static List<String> friends(){
    return List.generate(15, (index){
      return 'assets/sheard/daniel.jpg';
    });
  }
}

