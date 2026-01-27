import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flowery/core/storage/sharedpreferences_helper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/dependency_injection/di.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("token is: ${getIt<SharedPreferencesHelper>().getToken()}");
    return Scaffold(
      appBar: CustomAppBar(titleText: 'titleText'),
      body: Center(
        child: Column(
          children: [
            Text('data')
          ],
        ),
      ),
    );
  }
}
