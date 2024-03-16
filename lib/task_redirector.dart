import 'package:flutter/material.dart';
import 'package:stroll_social_assignment/features/task1/presentation/pages/home_page.dart';
import 'package:stroll_social_assignment/features/task2/presentation/pages/recording_page.dart';
import 'package:stroll_social_assignment/utils/app_strings.dart';
import 'package:stroll_social_assignment/features/task3/data/data_sources/cached_video_initialiser.dart';

import 'features/task3/presentation/pages/match_screen.dart';
import 'injection_container.dart';

class TaskRedirector extends StatefulWidget {
  const TaskRedirector({super.key});

  @override
  State<TaskRedirector> createState() => _TaskRedirectorState();
}

class _TaskRedirectorState extends State<TaskRedirector> {

  CachedVideoInitialiser videoInitialiser = sl<CachedVideoInitialiser>();

  @override
  void initState() {
    videoInitialiser.initialise();
    videoInitialiser.startCaching();
    super.initState();
  }

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
            ElevatedButton(
                onPressed: () async {
                  await Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MatchScreen(),
                  ));
                  videoInitialiser.initialise();
                  videoInitialiser.startCaching();
                },
                child: const Text(AppStrings.task3)),

          ],
        ),
      ),
    );
  }
}