import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monon/app_starting/welcome_page.dart';
import 'package:monon/ui/feelings/feelings_main_view.dart';
import 'package:monon/ui/feelings/feelings_view.dart';
import 'package:monon/ui/folder/folder_view.dart';
import 'package:monon/ui/info/info_view.dart';
import 'package:monon/ui/password_changer/password_changer.dart';
import 'package:monon/ui/submit/language_setting.dart';
import 'package:monon/ui/submit/submit_view.dart';
import 'package:monon/ui/video/vide_main.dart';

import '../app_starting/intro_emotion_setup.dart';
import '../app_starting/intro_page.dart';
import '../app_starting/personal_info.dart';
import '../splashscreen.dart';
import '../ui/activities/activities_main.dart';
import '../ui/audio/audio_sub.dart';
import '../ui/audio/main_audio.dart';
import '../ui/home/home_view.dart';
import '../ui/login/login_view_state.dart';
import '../ui/submit/settings_submit.dart';
import '../ui/written_documents/written_documents_main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      // case '/':
      //   return navigateToRoute(
      //     builder: (_) => LoginViewFinal(),
      //   );

      case '/':
        return navigateToRoute(
          builder: (_) => const SplashScreen(),
        );

      case '/login':
        return navigateToRoute(
          builder: (_) => const LoginViewFinal(),
        );


      case '/home':
        if (args is int) {
          int index = args;

          return navigateToRoute(
            builder: (_) => HomeView(index),
          );
        }

        return _underConstructionRoute('Error');

      case '/welcome':
        return navigateToRoute(
          builder: (_) => const WelcomePage(),
        );

      case '/personal_info':
        return navigateToRoute(
          builder: (_) => const PersonalInfoForm(),
        );

      case '/intro_page':
        return navigateToRoute(
          builder: (_) => const IntroPage(),
        );

      case '/intro_emotion_setup':
        return navigateToRoute(
          builder: (_) => const IntroEmotionSetup(),
        );

      case '/feelings_main':
        return navigateToRoute(
          builder: (_) => const FeelingsMainView(),
        );

      case '/emotions_first_submit':
        return navigateToRoute(
          builder: (_) => const FeelingsView(),
        );

      case '/folder':
        return navigateToRoute(
          builder: (_) => const FolderView(),
        );

      case '/info':
        return navigateToRoute(
          builder: (_) => const InfoView(),
        );

      case '/Password_changer':
        return navigateToRoute(
          builder: (_) => const PasswordChanger(),
        );

      case '/submit':
        return navigateToRoute(
          builder: (_) => const SubmitView(),
        );

      case '/video':
        return navigateToRoute(
          builder: (_) => const VideoMain(),
        );

      case '/written_documents':
        return navigateToRoute(
          builder: (_) =>  WrittenDocumentsPage(),
        );

      case '/main_audio':
        return navigateToRoute(
          builder: (_) => const MainAudio(),
        );

      case '/audio_sub':
        if (args is int) {
          int pageNumber = args;

          return navigateToRoute(
            builder: (_) => AudioSub(pageNumber: pageNumber,),
          );
        }

        return _underConstructionRoute('Error');
        // return navigateToRoute(
        //   builder: (_) => const AudioSub(),
        // );
        //

      case '/activities_main':
        return navigateToRoute(
          builder: (_) => const ActivitiesMain(),
        );

      case '/settings_submit':
        return navigateToRoute(
          builder: (_) => const SettingsSubmitView(),
        );

      case '/language_setting':
        return navigateToRoute(
          builder: (_) => const LanguageSettingsView(),
        );

      default:
        return _underConstructionRoute('Error');
    }
  }

  static navigateToRoute({required Widget Function(BuildContext) builder}) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: builder);
    } else {
      return MaterialPageRoute(builder: builder);
    }
  }

  static Route<dynamic> _underConstructionRoute(String title) {
    return navigateToRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: Text(
              (title == 'Error') ? 'ERROR' : 'Under Construction',
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        );
      },
    );
  }
}
