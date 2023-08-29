import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/shared/failed_body_widget.dart';
import '../../../../core/utils/color.dart';
import '../../home_injection.dart';
import 'components/bottom_loader.dart';
import 'components/words_widget.dart';
import 'cubit/home_cubi.dart';
import 'cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeCubit = CoreConfig.injector<HomeCubit>();
  late bool _isLoadingMore = false;

  final _appLocationsUtils = AppLocalizationUtils.instance;

  @override
  void initState() {
    if (_homeCubit.isClosed) {
      HomeInjection.getInstance(CoreConfig.injector).build();
    }
    _homeCubit.call();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackgroundFooter,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Text(
                _appLocationsUtils
                    .getLocalization(context)
                    .wordList,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: BlocProvider<HomeCubit>(
              create: (context) => _homeCubit,
              child: BlocListener<HomeCubit, HomeState>(
                listener: (context, state) {
                  if (state is HomeFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.getMessage),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                child: BlocBuilder<HomeCubit, HomeState>(
                  builder: (_, state) {
                    if (state is HomeSuccess) {
                      return WordsWidget(
                        item: state.data.length,
                        data: state.data,
                        currentPage: state.getCurrentPage,
                        isLoadingMore: _isLoadingMore,
                        hasReachedMax: state.isHasReachedMax,
                        callback: () async => _loadMoreDataCallback(state),
                      );
                    }
                    if (state is HomeFailed) {
                      return FailedBodyWidget();
                    }
                    return const BottomLoader();
                  },
                ),
              ),
            ),
          ),
          _isLoadingMore ? const BottomLoader() : Container(),
        ],
      ),
    );
  }

  Future<void> _loadMoreDataCallback(HomeState state) async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    await _homeCubit.call(state.getCurrentPage + 1);

    setState(() {
      _isLoadingMore = false;
    });
  }
}
