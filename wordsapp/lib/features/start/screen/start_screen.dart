import 'package:flutter/material.dart';

import '../../../core/app_localization_utils.dart';
import '../../../core/shared/linear_gradient_custom_widget.dart';
import '../../../core/utils/color.dart';
import '../../favorites/presentation/screen/favorites_screen.dart';
import '../../historic/presentation/screen/historic_screen.dart';
import '../../home/presentation/screen/home_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen>
    with TickerProviderStateMixin {
  late final TabController _tabController;
  final _appLocationsUtils = AppLocalizationUtils.instance;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackgroundFooter,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                child: Card(
                  color: Colors.black12,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicator: BoxDecoration(
                      gradient: LinearGradientCustom.get(),
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.orange,
                    ),
                    controller: _tabController,
                    isScrollable: true,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 30),
                    tabs: [
                      Tab(
                        child: Text(
                            _appLocationsUtils
                                .getLocalization(context)
                                .wordList,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Tab(
                        child: Text(
                            _appLocationsUtils.getLocalization(context).history,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ),
                      Tab(
                        child: Text(
                            _appLocationsUtils
                                .getLocalization(context)
                                .favorites,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    HomeScreen(),
                    HistoricScreen(),
                    FavoritesScreen(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
