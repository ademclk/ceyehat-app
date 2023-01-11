class Images {
  static String asPng(String path) => 'assets/images/$path.png';
  static String asJpg(String path) => 'assets/images/$path.jpg';

  static final String chefLogo = asPng('chef_logo');
  static final String welcomeBackground = asJpg('welcome_background');
}
