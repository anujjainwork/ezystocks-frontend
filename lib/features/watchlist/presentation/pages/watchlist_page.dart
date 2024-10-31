import 'package:ezystocks/core/common/widgets/bottom_nav_bar.dart';
import 'package:ezystocks/core/common/widgets/custom_text.dart';
import 'package:ezystocks/features/watchlist/business/entities/watchlist_entity.dart';
import 'package:ezystocks/features/watchlist/presentation/bloc/watchlist_bloc.dart';
import 'package:ezystocks/features/watchlist/presentation/widgets/watch_listview_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WatchListPage extends StatefulWidget {
  const WatchListPage({super.key});

  @override
  State<WatchListPage> createState() => _WatchListPageState();
}

class _WatchListPageState extends State<WatchListPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<WatchlistBloc>(context).add(FetchWatchlistEvent());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      bottomNavigationBar: getBottomNavBar(screenHeight, context),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.008),
            Align(
              alignment: Alignment.center,
              child: CustomTextWidget(
                text: 'Your watchlist',
                fontSize: screenHeight * 0.025,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: BlocBuilder<WatchlistBloc, WatchlistState>(
                builder: (context, state) {
                  if (state is WatchlistLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is WatchlistLoaded) {
                    return WatchlistListView(watchlist: state.watchlist);
                  } else if (state is WatchlistError) {
                    return Center(
                      child: CustomTextWidget(
                        text: 'Error: ${state.error}',
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  } else {
                    return Center(
                      child: CustomTextWidget(
                        text: 'No watchlist data available.',
                        fontSize: screenHeight * 0.02,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
