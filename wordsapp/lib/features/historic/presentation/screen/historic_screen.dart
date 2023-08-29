import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/shared/failed_body_widget.dart';
import '../../../../core/utils/color.dart';
import '../../../home/presentation/screen/components/bottom_loader.dart';
import '../../../home/presentation/screen/components/words_widget.dart';
import '../../historic_injection.dart';
import 'cubit/historic_cubit.dart';
import 'cubit/historic_state.dart';

class HistoricScreen extends StatefulWidget {
  const HistoricScreen({super.key});

  @override
  State<HistoricScreen> createState() => _HistoricScreenState();
}

class _HistoricScreenState extends State<HistoricScreen> {
  final _historicCubit = CoreConfig.injector<HistoricCubit>();

  final _appLocationsUtils = AppLocalizationUtils.instance;

  late bool _isLoadingMore = false;

  @override
  void initState() {
    if (_historicCubit.isClosed) {
      HistoricInjection.getInstance(CoreConfig.injector).build();
    }
    _historicCubit.call();
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
                _appLocationsUtils.getLocalization(context).history,
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
            child: BlocProvider<HistoricCubit>(
              create: (context) => _historicCubit,
              child: BlocListener<HistoricCubit, HistoricState>(
                listener: (context, state) {
                  if (state is HistoricFailed) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(state.getMessage),
                      behavior: SnackBarBehavior.floating,
                    ));
                  }
                },
                child: BlocBuilder<HistoricCubit, HistoricState>(
                  builder: (_, state) {
                    if (state is HistoricSuccess) {
                      if (state.data.isEmpty) {
                        return Center(
                          child: Text(
                            _appLocationsUtils
                                .getLocalization(context)
                                .historicIsEmpty,
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
                          currentPage: state.getCurrentPage + 1,
                          hasReachedMax: state.isHasReachedMax,
                          isLoadingMore: _isLoadingMore,
                          callback: () async => _loadMoreDataCallback(state),
                        ),
                      );
                    }
                    if (state is HistoricFailed) {
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

  Future<void> _loadMoreDataCallback(HistoricSuccess state) async {
    if (_isLoadingMore) return;

    setState(() {
      _isLoadingMore = true;
    });

    await _historicCubit.call(state.getCurrentPage + 1);

    setState(() {
      _isLoadingMore = false;
    });
  }
}
