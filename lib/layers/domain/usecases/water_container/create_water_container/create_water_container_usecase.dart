import 'package:hive/hive.dart';

abstract interface class CreateWaterContainerUseCase {
  Future<Box> call();
}
