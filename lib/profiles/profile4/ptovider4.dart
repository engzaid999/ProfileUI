import 'package:profileui/profiles/profile4/user4.dart';

class Profile4Provider {
  static Profile getProfile() {
    return Profile(
      user4: User4(
          name: "Zaid H. Al-Taai",
          address: "Iraq - Samawah ",
          about:
          'This codelab teaches you how to write asynchronous code using futures and the async .'),
      followers: 3445,
      following: 440,
      friends: 200,
      photos: 25,
    );
  }
}