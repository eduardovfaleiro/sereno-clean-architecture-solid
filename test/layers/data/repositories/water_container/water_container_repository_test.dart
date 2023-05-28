import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sereno_clean_architecture_solid/core/error/exceptions.dart';
import 'package:sereno_clean_architecture_solid/core/error/failures.dart';
import 'package:sereno_clean_architecture_solid/layers/data/datasources/water_container/water_container_datasource.dart';
import 'package:sereno_clean_architecture_solid/layers/data/dtos/water_container_dto.dart';
import 'package:sereno_clean_architecture_solid/layers/data/repositories/water_container_repository_imp.dart';
import 'package:sereno_clean_architecture_solid/layers/domain/entities/water_container_entity.dart';
import 'package:sereno_clean_architecture_solid/layers/domain/repositories/water_container_repository.dart';

import 'water_container_repository_test.mocks.dart';

@GenerateNiceMocks([MockSpec<WaterContainerDataSource>()])
void main() {
  late MockWaterContainerDataSource mockWaterContainerDataSource;
  late WaterContainerRepository repository;

  setUp(() {
    mockWaterContainerDataSource = MockWaterContainerDataSource();
    repository = WaterContainerRepositoryImp(mockWaterContainerDataSource);
  });

  group('get', () {
    int id = 1;
    var waterContainerDto = WaterContainerDto(200, 'cup', id);

    test('Should return a water container when call to datasource is sucessful', () async {
      when(mockWaterContainerDataSource.get(any)).thenAnswer((_) async => waterContainerDto);

      var result = await repository.get(id);

      verify(mockWaterContainerDataSource.get(id));

      expect(result, Right(waterContainerDto));
    });

    test('Should return a CacheFailure when call to datasource fails', () async {
      when(mockWaterContainerDataSource.get(any)).thenThrow(CacheException());

      var result = await repository.get(id);
      var expectedResult = result.fold((l) => l, (r) => null);

      verify(mockWaterContainerDataSource.get(id));

      expect(expectedResult, isA<CacheFailure>());
    });
  });

  group('create', () {
    int id = 1;
    var waterContainerEntity = WaterContainerEntity(200, 'cup');

    test('Should return an int when call to datasource is sucessful', () async {
      when(mockWaterContainerDataSource.create(any)).thenAnswer((_) async => id);

      var result = await repository.create(waterContainerEntity);

      verify(mockWaterContainerDataSource.create(waterContainerEntity));

      expect(result, id);
    });
  });

  group('delete', () {
    int id = 1;

    test('Should return a CacheFailure when call to datasource fails', () async {
      when(mockWaterContainerDataSource.delete(any)).thenThrow(CacheException());

      var result = await repository.delete(id);
      var expectedResult = result.fold((l) => l, (r) => null);

      verify(mockWaterContainerDataSource.delete(id));

      expect(expectedResult, isA<CacheFailure>());
    });
  });
}