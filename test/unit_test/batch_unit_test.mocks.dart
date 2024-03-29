
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:hive_and_api_for_class/core/failure/failure.dart' as _i6;
import 'package:hive_and_api_for_class/features/auth/domain/entity/auth_entity.dart'
    as _i8;
import 'package:hive_and_api_for_class/features/batch/domain/entity/batch_entity.dart'
    as _i7;
import 'package:hive_and_api_for_class/features/batch/domain/repository/batch_repository.dart'
    as _i2;
import 'package:hive_and_api_for_class/features/batch/domain/use_case/batch_use_case.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;


class _FakeIBatchRepository_0 extends _i1.SmartFake
    implements _i2.IBatchRepository {
  _FakeIBatchRepository_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEither_1<L, R> extends _i1.SmartFake implements _i3.Either<L, R> {
  _FakeEither_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [BatchUseCase].
///
/// See the documentation for Mockito's code generation for more information.
class MockBatchUseCase extends _i1.Mock implements _i4.BatchUseCase {
  @override
  _i2.IBatchRepository get batchRepository => (super.noSuchMethod(
        Invocation.getter(#batchRepository),
        returnValue: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#batchRepository),
        ),
        returnValueForMissingStub: _FakeIBatchRepository_0(
          this,
          Invocation.getter(#batchRepository),
        ),
      ) as _i2.IBatchRepository);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>> getAllBatches() =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllBatches,
          [],
        ),
        returnValue:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BatchEntity>>(
          this,
          Invocation.method(
            #getAllBatches,
            [],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>>.value(
                _FakeEither_1<_i6.Failure, List<_i7.BatchEntity>>(
          this,
          Invocation.method(
            #getAllBatches,
            [],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, List<_i7.BatchEntity>>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, bool>> addBatch(_i7.BatchEntity? batch) =>
      (super.noSuchMethod(
        Invocation.method(
          #addBatch,
          [batch],
        ),
        returnValue: _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
            _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addBatch,
            [batch],
          ),
        )),
        returnValueForMissingStub:
            _i5.Future<_i3.Either<_i6.Failure, bool>>.value(
                _FakeEither_1<_i6.Failure, bool>(
          this,
          Invocation.method(
            #addBatch,
            [batch],
          ),
        )),
      ) as _i5.Future<_i3.Either<_i6.Failure, bool>>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<_i8.AuthEntity>>>
      getAllStudentsByBatch(String? batchId) => (super.noSuchMethod(
            Invocation.method(
              #getAllStudentsByBatch,
              [batchId],
            ),
            returnValue:
                _i5.Future<_i3.Either<_i6.Failure, List<_i8.AuthEntity>>>.value(
                    _FakeEither_1<_i6.Failure, List<_i8.AuthEntity>>(
              this,
              Invocation.method(
                #getAllStudentsByBatch,
                [batchId],
              ),
            )),
            returnValueForMissingStub:
                _i5.Future<_i3.Either<_i6.Failure, List<_i8.AuthEntity>>>.value(
                    _FakeEither_1<_i6.Failure, List<_i8.AuthEntity>>(
              this,
              Invocation.method(
                #getAllStudentsByBatch,
                [batchId],
              ),
            )),
          ) as _i5.Future<_i3.Either<_i6.Failure, List<_i8.AuthEntity>>>);
}
