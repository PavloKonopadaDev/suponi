mixin RoutePath {
  static String getPageName({required String fullPath}) {
    final firstIndex = fullPath.lastIndexOf('/');
    return fullPath.substring(firstIndex + 1);
  }

  // OnBoarding
  static const onBoarding = '/onboarding';
  static const birthday = '$onBoarding/birthday';
  static const nickname = '$onBoarding/nickname';
  static const gender = '$onBoarding/gender';

  // Photo
  static const photo = '/photo';
  static const takePhoto = '$photo/take_photo';
  static const photoPreview = '$photo/photoPreview';

  // Profile
  static const profile = '/profile';
}
