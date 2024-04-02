class NetworkConstants {
  NetworkConstants._();

  ///Base Url
  ///
  static const String baseUrl = 'https://system.ahmedhf.com';
  static const String apiPrefix = '/api/v1';

  ///End Points
  /// Home
  static const String families = '/cases';
  static const String orphanFamilies = '/orphan_families';
  static const String aidFamilies = '/aid_families';
  static const String foodBankFamilies = '/food_bank_families';
  static const String mahgoubFamilies = '/mahgoub_families';

  ///appPages
  static const String terms = '/terms';
  static const String aboutUs = '/about';
  static const String privacy = '/policies';
  static const String contactUsTypes = '/contact-types';
  static const String contactUs = '/contact-us'; //not exist

  ///Auth
  static const String countries = '/location/countries';
  static const String login = '/login';
  static const String register = '/register';
  static const String verifyAccount = '/verify';
  static const String resendCode = '/resend_verify_code';
  static const String logout = '/logout';
  static const String forgotPassword = '/forget-password';
  static const String resetPassword = '/reset-password';
  static const String verifyForgotPassword = '/auth/verify-token';
  static const String verifyUpdatePhone = '/profile/verify-phone';
  static const String deleteAccount = '/request-delete-account';

  ///profile
  static const String profile = '/profile';
  static const String addresses = '/profile/user-addresses';
  static const String changePassword = '/profile/change-password';

  /// More
  static const String categories = '/categories';

  /// Chat
  static const String chat = '/chats';
  static const String getChat = '/chats/get-chat';
  static const String sendChat = '/chats/send';

  ///notification
  static const String notification = '/user-notification';
  static const String notificationCount = '/user-notifications/count';
}
