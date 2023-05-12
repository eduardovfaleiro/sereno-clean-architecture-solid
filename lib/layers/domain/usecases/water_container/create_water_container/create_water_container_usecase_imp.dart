import '../../../repositories/water_container/create_water_container_repository.dart';
import 'create_water_container_usecase.dart';

class CreateWaterContainerUseCaseImp implements CreateWaterContainerUseCase {
  final CreateWaterContainerRepository _createWaterContainerRepository;

  CreateWaterContainerUseCaseImp(this._createWaterContainerRepository);

  @override
  Future<void> call() async {
    await _createWaterContainerRepository();
  }
}
