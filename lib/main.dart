import 'package:ezystocks/core/routes/app_route_config.dart';
import 'package:ezystocks/features/home/data/repositories/stock_historical_repo_impl.dart';
import 'package:ezystocks/features/home/data/repositories/user_stock_repo_impl.dart';
import 'package:ezystocks/features/home/business/use_cases/historical_data_usecases.dart';
import 'package:ezystocks/features/home/business/use_cases/home_usecases.dart';
import 'package:ezystocks/features/home/presentation/historical_data_bloc/stock_historical_bloc.dart';
import 'package:ezystocks/features/home/presentation/home_bloc/home_bloc.dart';
import 'package:ezystocks/features/prediction/business/usecases/data_pred_usecase.dart';
import 'package:ezystocks/features/prediction/data/repositories/data_pred_repo_impl.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/datapred_bloc.dart';
import 'package:ezystocks/features/prediction/presentation/bloc/prediction_graph_bloc.dart';
import 'package:ezystocks/features/search/data/repositories/add_to_watchlist_repo_impl.dart';
import 'package:ezystocks/features/search/data/repositories/search_stock_repo_impl.dart';
import 'package:ezystocks/features/search/presentation/bloc/add_to_watchlist_bloc_bloc.dart';
import 'package:ezystocks/features/search/presentation/bloc/stock_search_bloc.dart';
import 'package:ezystocks/features/splash_screen/splashscreen.dart';
import 'package:ezystocks/features/watchlist/business/usecases/watchlist_usecase.dart';
import 'package:ezystocks/features/watchlist/data/repositories/watchlist_repo_impl.dart';
import 'package:ezystocks/features/watchlist/presentation/bloc/watchlist_bloc.dart';
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
    final searchStocksRepositoryImpl = SearchStocksRepositoryImpl();
    final addToWatchListRepoImpl = AddToWatchlistRepositoryImpl();
    final repository = DataPredictionRepositoryImpl();
    final getStockPredictionUseCase =
        GetStockPredictionUseCase(repository: repository);
    final watchlistRepository = WatchlistRepositoryImpl();
    final getUserWatchlistUseCase =
        GetUserWatchlistUseCase(watchlistRepository: watchlistRepository);
    
    
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => StockHistoricalBloc(getHistoricalUseCase),
        ),
        BlocProvider(
          create: (context) {
            final stockHistoricalBloc = context.read<StockHistoricalBloc>();
            return HomeBloc(getUserStocksUseCase,stockHistoricalBloc);
          } 
        ),
        BlocProvider(
          create: (context) =>
              WatchlistBloc(getUserWatchlistUseCase: getUserWatchlistUseCase),
        ),
        BlocProvider(
          create: (context) => StockSearchBloc(searchStocksRepositoryImpl),
        ),
        BlocProvider(
          create: (context) => AddToWatchlistBloc(addToWatchListRepoImpl),
        ),
        // First create the PredictionGraphBloc
        BlocProvider(
          create: (context) => PredictionGraphBloc(getHistoricalUseCase),
        ),
        // Now you can access it in DatapredBloc
        BlocProvider(
          create: (context) {
            final predictionGraphBloc = context.read<PredictionGraphBloc>();
            return DatapredBloc(
              getStockPredictionUseCase: getStockPredictionUseCase,
              predictionGraphBloc: predictionGraphBloc,
            );
          },
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
