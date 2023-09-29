import 'package:get/get_navigation/get_navigation.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'email_hint': 'Email',
          'passwords': 'Password',
          'internet_exceptions':
              "We are unable to show results\n Please check your data\n Conntection",
          'general_exceptions':
              "We are unable to process your request\n Please try again",
          'welcome_back': "Welcome to My App",
          "login": 'Login Page',
          "logout": 'Logout',
          "logout_message": 'Are you sure you want to logout?',
          "ok": "OK",
          "cancel": "Cancel",
          "register": 'Register Page',
          "forget_password": '<PASSWORD>',
          "reset_password": '<PASSWORD>',
          "home": 'Home Page',
          "profile": 'Profile Page',

        },
        'ur_PK': {
          'email_hint': 'ای میل درج کریں۔',
        },
      };
}
