import 'package:flutter/material.dart';
import 'package:test_app/core/widgets/app_buttons.dart';
import 'package:test_app/injection.dart';

import 'core/config/palette.dart';
import 'features/exercises/presentation/di.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.scaffold,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppButtons.rounded(
                buttonSize: AppButtonSize.big,
                backgroundColor: AppColors.primary,
                label: 'Choices',
                onPressed: () {
                  // appRouter.push(
                  //   const ExerciseWrapperPage(model: ChoicesExerciseData(),),
                  // );
                  appRouter.push(
                    const ExerciseWrapperPage(),
                  );
                },
              ),
              const SizedBox(height: 12),
              AppButtons.rounded(
                buttonSize: AppButtonSize.big,
                label: 'Tick Options',
                backgroundColor: AppColors.primary,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
