import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/shared/failed_body_widget.dart';
import '../../../../core/utils/color.dart';
import '../../../home/presentation/screen/components/bottom_loader.dart';
import '../../../home/presentation/screen/components/words_widget.dart';
import '../../favorites_injection.dart';
import '../cubit/favorites_cubit.dart';
import '../cubit/favorites_state.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final _favoritesCubit = CoreConfig.injector<FavoritesCubit>();
  late bool _isLoadingMore = false;
  final _appLocationsUtils = AppLocalizationUtils.instance;

  @override
  void initState() {
    if (_favoritesCubit.isClosed) {
      FavoritesInjection.getInstance(CoreConfig.injector).build();
    }
    _favoritesCubit.call();
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
                _appLocationsUtils.getLocalization(context).favorites,
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
            child: BlocProvider<FavoritesCubit>(
              create: (context) => _favoritesCubit,
              child: BlocListener<FavoritesCubit, FavoritesState>(
                listener: (context, state) {
                  if (state is FavoritesFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.getMessage),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                child: BlocBuilder<FavoritesCubit, FavoritesState>(
                  builder: (_, state) {
                    if (state is FavoritesSuccess) {
                      if (state.data.isEmpty) {
                        return Center(
                          child: Text(
                            _appLocationsUtils
                                .getLocalization(context)
                                .favoritesIsEmpty,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 32,
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        child: WordsWidget(
                          item: state.data.length,
                          data: state.data,
                          currentPage: state.getCurrentPage,
                          isLoadingMore: _isLoadingMore,
                          hasReachedMax: state.isHasReachedMax,
                          callback: () async => _loadMoreDataCallback(state),
                        ),
                      );
                    }
                    if (state is FavoritesFailed) {
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

  Future<void> _loadMoreDataCallback(FavoritesState state) async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    await _favoritesCubit.call(state.getCurrentPage + 1);

    setState(() {
      _isLoadingMore = false;
    });
  }
}
