import 'package:flowery/core/common/widgets/appBar/custom_app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
