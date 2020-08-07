import 'package:profileui/profiles/profile1/user.dart';

class Profile1Provider {
  static Profile getProfile() {
    return Profile(
      user: User(
          name: "Zaid H. Al-Taai",
          address: "Iraq - Samawah ",
          about:
          'This codelab teaches you how to write asynchronous code using futures and the async and await keywords.Using embedded DartPad editors, you can test your knowledge by running example code and completing exercises.'),
      followers: 3445,
      following: 440,
      friends: 200,
    );
  }
}
