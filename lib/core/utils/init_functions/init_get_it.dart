import 'package:hive/hive.dart';

import '../../../layers/data/datasources/amount_of_water_drank_today_datasource.dart';
import '../../../layers/data/datasources/daily_drinking_frequency_datasource.dart';
import '../../../layers/data/datasources/daily_goal_datasource.dart';
import '../../../layers/data/datasources/sleep_time_datasource.dart';
import '../../../layers/data/datasources/wake_up_time_datasource.dart';
import '../../../layers/data/datasources/water_container_datasource.dart';
import '../../../layers/data/datasources/weekly_workout_days_datasource.dart';
import '../../../layers/data/datasources/weight_datasource.dart';
import '../../../layers/data/repositories/amount_of_water_drank_today_repository_imp.dart';
import '../../../layers/data/repositories/daily_drinking_frequency_repository_imp.dart';
import '../../../layers/data/repositories/daily_goal_repository_imp.dart';
import '../../../layers/data/repositories/user_repository_imp.dart';
import '../../../layers/data/repositories/water_container_repository_imp.dart';
import '../../../layers/domain/entities/user_entity.dart';
import '../../../layers/domain/repositories/amount_of_water_drank_today_repository.dart';
import '../../../layers/domain/repositories/daily_drinking_frequency_repository.dart';
import '../../../layers/domain/repositories/daily_goal_repository.dart';
import '../../../layers/domain/repositories/user_repository.dart';
import '../../../layers/domain/repositories/water_container_repository.dart';
import '../../../layers/domain/usecases/calculate_daily_drinking_goal_usecase.dart';
import '../../../layers/domain/usecases/get_daily_drinking_goal_completion_in_percentage_usecase.dart';
import '../../../layers/domain/usecases/validate_user_entity_usecase.dart';
import '../../../layers/presentation/view_models/save_user_view_model.dart';
import '../../../layers/presentation/view_models/user_view_model.dart';
import '../../../layers/presentation/view_models/water_view_model.dart';
import '../../core.dart';

void initGetIt() {
  // Hive
  getIt.registerLazySingleton<HiveInterface>(() {
    return Hive;
  });

  // Entities
  getIt.registerLazySingleton<UserEntity>(() {
    return UserEntity();
  });

  // Data sources

  getIt.registerLazySingleton<SleepTimeDataSource>(() {
    return HiveSleepTimeDataSourceImp(getIt());
  });

  getIt.registerLazySingleton<WakeUpTimeDataSource>(() {
    return HiveWakeUpTimeDataSourceImp(getIt());
  });

  getIt.registerLazySingleton<WeeklyWorkoutDaysDataSource>(() {
    return HiveWeeklyWorkoutDaysDataSourceImp(getIt());
  });

  getIt.registerLazySingleton<WeightDataSource>(() {
    return HiveWeightDataSourceImp(getIt());
  });

  getIt.registerLazySingleton<WaterContainerDataSource>(() {
    return HiveWaterContainerDataSourceImp(getIt());
  });

  getIt.registerLazySingleton<DailyDrinkingGoalDataSource>(() {
    return HiveDailyDrinkingGoalDataSource(getIt());
  });

  getIt.registerLazySingleton<AmountOfWaterDrankTodayDataSource>(() {
    return HiveAmountOfWaterDrankTodayDataSourceImp(getIt());
  });

  getIt.registerLazySingleton<NumberOfTimesToDrinkWaterDailyDataSource>(() {
    return HiveNumberOfTimesToDrinkWaterDailyDataSourceImp(getIt());
  });

  // Repositories

  getIt.registerLazySingleton<WaterContainerRepository>(() {
    return WaterContainerRepositoryImp(getIt());
  });

  getIt.registerLazySingleton<DailyDrinkingGoalRepository>(() {
    return DailyDrinkingGoalRepositoryImp(getIt());
  });

  getIt.registerLazySingleton<AmountOfWaterDrankTodayRepository>(() {
    return AmountOfWaterDrankTodayRepositoryImp(getIt());
  });

  getIt.registerLazySingleton<NumberOfTimesToDrinkWaterDailyRepository>(() {
    return NumberOfTimesToDrinkWaterDailyRepositoryImp(getIt());
  });

  getIt.registerLazySingleton<UserRepository>(() {
    return UserRepositoryImp(getIt(), getIt(), getIt(), getIt(), getIt());
  });

  // Usecases

  getIt.registerLazySingleton<CalculateDailyDrinkingGoalUseCase>(() {
    return CalculateDailyDrinkingGoalUseCaseImp(getIt());
  });

  getIt.registerLazySingleton<ValidateUserEntityUseCase>(() {
    return ValidateUserEntityUseCaseImp();
  });

  getIt.registerLazySingleton<GetDailyDrinkingGoalCompletedPercentageUseCase>(() {
    return GetDailyDrinkingGoalCompletedPercentageUseCaseImp(getIt(), getIt());
  });

  // View models

  getIt.registerLazySingleton<SaveUserViewModel>(() {
    return SaveUserViewModelImp(getIt(), getIt(), getIt());
  });

  getIt.registerLazySingleton<UserEntityViewModel>(() {
    return UserEntityViewModel(getIt(), getIt());
  });

  getIt.registerLazySingleton<WaterViewModel>(() {
    return WaterViewModelImp(getIt(), getIt(), getIt(), getIt());
  });
}
