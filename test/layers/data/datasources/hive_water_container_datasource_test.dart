import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sereno_clean_architecture_solid/core/core.dart';
import 'package:sereno_clean_architecture_solid/layers/data/datasources/water_container_datasource.dart';
import 'package:sereno_clean_architecture_solid/layers/data/dtos/water_container/water_container_dto.dart';
import 'package:sereno_clean_architecture_solid/layers/domain/entities/water_container_entity.dart';

import '../../../mocks.dart';

void main() {
  late MockBox mockBox;
  late MockHiveInterface mockHiveInterface;
  late WaterContainerDataSource dataSource;

  setUp(() {
    mockBox = MockBox();
    mockHiveInterface = MockHiveInterface();
    dataSource = HiveWaterContainerDataSourceImp(mockHiveInterface);
  });

  group('create', () {
    test("Should return the water container index if it's sucessfully added to the box", () async {
      var waterContainerEntity = WaterContainerEntity(amount: 200, description: 'cup', iconName: 'test');

      int number = 1;

      when(() => mockHiveInterface.box(any())).thenReturn(mockBox);
      when(() => mockBox.add(any())).thenAnswer((_) async => number);

      int result = await dataSource.create(waterContainerEntity);

      verifyInOrder([
        () => mockHiveInterface.box(WATER_CONTAINER),
        () => mockBox.add(waterContainerEntity),
      ]);

      expect(result, number);
    });
  });

  group('delete', () {
    test('Should forward the call to HiveInterface', () async {
      int id = 1;

      when(() => mockHiveInterface.box(any())).thenReturn(mockBox);
      when(() => mockBox.delete(any())).thenAnswer((_) async {});

      await dataSource.delete(id);

      verify(() => mockHiveInterface.box(WATER_CONTAINER));
      verify(() => mockBox.delete(id));
    });
  });

  group('getAllContainers', () {
    var allWaterContainers = <WaterContainerDto>[
      WaterContainerDto(amount: 100, description: 'tea cup', iconName: 'test'),
      WaterContainerDto(amount: 200, description: 'normal cup', iconName: 'test'),
      WaterContainerDto(amount: 500, description: 'bottle', iconName: 'test'),
    ];

    test('Should return all water containers if call to datasource is succesful', () async {
      when(() => mockHiveInterface.box(any())).thenReturn(mockBox);
      when(() => mockBox.values).thenReturn(allWaterContainers);

      var result = await dataSource.getAllContainers();

      verifyInOrder([() => mockHiveInterface.box(WATER_CONTAINER), () => mockBox.values]);

      expect(result, allWaterContainers);
    });
  });

  group('get', () {
    test('Should return a water container', () async {
      var waterContainerDto = WaterContainerDto(amount: 200, description: 'cup', iconName: 'test');

      int id = 1;
      var mockBox = MockBox();

      when(() => mockHiveInterface.box(any())).thenReturn(mockBox);
      when(() => mockBox.getAt(id)).thenAnswer((_) async => waterContainerDto);

      var result = await dataSource.get(id);

      verify(() => mockHiveInterface.box(WATER_CONTAINER));
      verify(() => mockBox.getAt(id));

      expect(result, waterContainerDto);
    });
  });
}
