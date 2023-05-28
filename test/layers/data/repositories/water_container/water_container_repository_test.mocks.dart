// Mocks generated by Mockito 5.4.0 from annotations
// in sereno_clean_architecture_solid/test/layers/data/repositories/water_container/water_container_repository_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:mockito/mockito.dart' as _i1;
import 'package:sereno_clean_architecture_solid/layers/data/datasources/water_container/water_container_datasource.dart'
    as _i3;
import 'package:sereno_clean_architecture_solid/layers/data/dtos/water_container_dto.dart'
    as _i2;
import 'package:sereno_clean_architecture_solid/layers/domain/entities/water_container_entity.dart'
    as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeWaterContainerDto_0 extends _i1.SmartFake
    implements _i2.WaterContainerDto {
  _FakeWaterContainerDto_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [WaterContainerDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockWaterContainerDataSource extends _i1.Mock
    implements _i3.WaterContainerDataSource {
  @override
  _i4.Future<_i2.WaterContainerDto> get(int? id) => (super.noSuchMethod(
        Invocation.method(
          #get,
          [id],
        ),
        returnValue:
            _i4.Future<_i2.WaterContainerDto>.value(_FakeWaterContainerDto_0(
          this,
          Invocation.method(
            #get,
            [id],
          ),
        )),
        returnValueForMissingStub:
            _i4.Future<_i2.WaterContainerDto>.value(_FakeWaterContainerDto_0(
          this,
          Invocation.method(
            #get,
            [id],
          ),
        )),
      ) as _i4.Future<_i2.WaterContainerDto>);
  @override
  _i4.Future<int> create(_i5.WaterContainerEntity? waterContainerEntity) =>
      (super.noSuchMethod(
        Invocation.method(
          #create,
          [waterContainerEntity],
        ),
        returnValue: _i4.Future<int>.value(0),
        returnValueForMissingStub: _i4.Future<int>.value(0),
      ) as _i4.Future<int>);
  @override
  _i4.Future<void> delete(int? id) => (super.noSuchMethod(
        Invocation.method(
          #delete,
          [id],
        ),
        returnValue: _i4.Future<void>.value(),
        returnValueForMissingStub: _i4.Future<void>.value(),
      ) as _i4.Future<void>);
}