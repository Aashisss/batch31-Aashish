
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_and_api_for_class/config/router/app_route.dart';
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart';
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart';
import 'package:hive_and_api_for_class/features/batch/presentation/viewmodel/batch_view_model.dart';
import 'package:hive_and_api_for_class/features/course/domain/entity/course_entity.dart';
import 'package:hive_and_api_for_class/features/course/domain/use_case/course_usecase.dart';
import 'package:hive_and_api_for_class/features/course/presentation/viewmodel/course_viewmodel.dart';
import 'package:mockito/mockito.dart';

import '../../../../../../test_data/batch_entity_test.dart';
import '../../../../../../test_data/course_entity_test.dart';
import '../../../../auth/presentation/view/login_view_test.mocks.dart';

void main() {
  late BatchUseCase mockBatchUsecase;
  late CourseUseCase mockCourseUsecase;
  late List<BatchEntity> batchEntity;
  late List<CourseEntity> courseEntity;

  setUpAll(() async {
    mockBatchUsecase = MockBatchUseCase();
    mockCourseUsecase = MockCourseUseCase();
    batchEntity = await getBatchListTest();
    courseEntity = await getCourseListTest();
  });

  testWidgets(
    'dashboard view ...',
    (tester) async {
      when(mockBatchUsecase.getAllBatches())
          .thenAnswer((_) async => Right(batchEntity));

      when(mockCourseUsecase.getAllCourses())
          .thenAnswer((_) async => Right(courseEntity));

      await tester.pumpWidget(
        ProviderScope(
          overrides: [
            batchViewModelProvider
                .overrideWith((ref) => BatchViewModel(mockBatchUsecase)),
            courseViewModelProvider
                .overrideWith((ref) => CourseViewModel(mockCourseUsecase)),
          ],
          child: MaterialApp(
            routes: AppRoute.getApplicationRoute(),
            initialRoute: AppRoute.homeRoute,
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(GridView), findsNWidgets(2));
    },
  );
}
