import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/features/task1/presentation/pages/home_page.dart';
import 'package:stroll_social_assignment/features/task2/presentation/pages/recording_page.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';

class TaskRedirector extends StatelessWidget {
  const TaskRedirector({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.appName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ));
                },
                child: const Text(AppStrings.task1)),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const RecordingPage(),
                  ));
                },
                child: const Text(AppStrings.task2)),
          ],
        ),
      ),
    );
  }
}