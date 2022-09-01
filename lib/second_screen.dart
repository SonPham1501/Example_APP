import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:test_app/core/widgets/app_buttons.dart';
import 'package:test_app/injection.dart';
import 'package:test_app/routes/app_pages.dart';
import 'core/config/palette.dart';
import 'features/test/domain/models/test/test_archived_type/test_archived_type.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
                label: 'Choices + Rearrange',
                onPressed: () async {
                  appRouter.pushNamed(
                    Routes.TEST_DOING,
                    arguments: await _getData(
                        "assets/jsons/tests/choices_rearrange.json"),
                  );
                  // appRouter.push(
                  //   const ExerciseWrapperPage(),
                  // );
                },
              ),
              const SizedBox(height: 12),
              AppButtons.rounded(
                buttonSize: AppButtonSize.big,
                backgroundColor: AppColors.primary,
                label: 'True False + Complete Paragraph',
                onPressed: () async {
                  appRouter.pushNamed(
                    Routes.TEST_DOING,
                    arguments: await _getData(
                        "assets/jsons/tests/true_false_paragraph.json"),
                  );
                  // appRouter.push(
                  //   const ExerciseWrapperPage(),
                  // );
                },
              ),
              const SizedBox(height: 12),
              AppButtons.rounded(
                buttonSize: AppButtonSize.big,
                backgroundColor: AppColors.primary,
                label: 'Input + Write',
                onPressed: () async {
                  appRouter.pushNamed(
                    Routes.TEST_DOING,
                    arguments:
                        await _getData("assets/jsons/tests/input_write.json"),
                  );
                },
              ),
              const SizedBox(height: 12),
              AppButtons.rounded(
                buttonSize: AppButtonSize.big,
                backgroundColor: AppColors.primary,
                label: 'Match + Choose mistake',
                onPressed: () async {
                  appRouter.pushNamed(
                    Routes.TEST_DOING,
                    arguments: await _getData(
                        "assets/jsons/tests/match_choose_mistake.json"),
                  );
                },
              ),
              // AppButtons.rounded(
              //   buttonSize: AppButtonSize.big,
              //   label: 'Tick Options',
              //   backgroundColor: AppColors.primary,
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _getData(String path) async {
    final String response = await rootBundle.loadString(path);

    final data = await json.decode(response);

    return TestArchivedType.fromJson(data);
  }
}
