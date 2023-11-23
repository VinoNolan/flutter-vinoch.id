class User {
  String username, imageProfile, email;

  User(
      {required this.username,
      required this.imageProfile,
      required this.email});
}

List<User> datauser = [
  User(
      username: 'Hu Tao',
      imageProfile: 'lib/images/hutao.jpg',
      email: 'HutaoHutao@gmail.com')
];
