import 'package:ezystocks/core/routes/app_route_config.dart';
import 'package:ezystocks/features/home/data/repositories/stock_historical_repo_impl.dart';
import 'package:ezystocks/features/home/data/repositories/user_stock_repo_impl.dart';
import 'package:ezystocks/features/home/domain/use_cases/historical_data_usecases.dart';
import 'package:ezystocks/features/home/domain/use_cases/home_usecases.dart';
import 'package:ezystocks/features/home/presentation/historical_data_bloc/stock_historical_bloc.dart';
import 'package:ezystocks/features/home/presentation/home_bloc/home_bloc.dart';
import 'package:ezystocks/features/splash_screen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final homeStocksRepository = HomeStocksDataRepositoryImpl();
    final stockHistoricalRepositoryImpl = StockHistoricalRepositoryImpl();
    final getUserStocksUseCase = GetUserStocksUseCase(homeStocksRepository);
    final getHistoricalUseCase = GetHistoricalUseCase(
        stockHistoricalRepositoryImpl: stockHistoricalRepositoryImpl);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(getUserStocksUseCase),
        ),
        BlocProvider(
          create: (context) => StockHistoricalBloc(getHistoricalUseCase),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routeInformationProvider: AppRouter.router.routeInformationProvider,
        routeInformationParser: AppRouter.router.routeInformationParser,
        routerDelegate: AppRouter.router.routerDelegate,
      ),
    );
  }
}

