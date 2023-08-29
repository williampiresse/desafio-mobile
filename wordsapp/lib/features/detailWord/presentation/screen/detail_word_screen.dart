import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/app_localization_utils.dart';
import '../../../../core/core_config.dart';
import '../../../../core/utils/color.dart';
import '../../../../core/voice/flutter_tts_interface.dart';
import '../../../home/data/models/word_model.dart';
import '../components/body_simmer_widget.dart';
import '../components/word_body_widget.dart';
import '../cubit/detail_cubit.dart';
import '../cubit/detail_state.dart';

class DetailWordScreen extends StatefulWidget {
  const DetailWordScreen({
    required this.data,
    required this.position,
    super.key,
  });

  final List<WordModel> data;
  final int position;

  @override
  State<DetailWordScreen> createState() => _DetailWordScreenState();
}

class _DetailWordScreenState extends State<DetailWordScreen> {
  final _detailCubit = CoreConfig.injector<DetailCubit>();
  final _appLocationsUtils = AppLocalizationUtils.instance;

  int _indexWordDetail = 0;
  int _itemsCount = 0;

  @override
  void initState() {
    _indexWordDetail = widget.position;
    _itemsCount = widget.data.length;

    _detailCubit.saveHistoric(widget.data[widget.position]);
    _detailCubit.requestWordDetail(widget.data, _indexWordDetail);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.colorBackgroundFooter,
      appBar: AppBar(
        title: Text(_appLocationsUtils.getLocalization(context).detail),
        backgroundColor: AppColors.colorBackgroundFooter,
      ),
      body: BlocProvider<DetailCubit>(
        create: (context) => _detailCubit,
        child: BlocBuilder<DetailCubit, DetailState>(
          builder: (_, state) {
            if (state is DetailLoading) {
              return const BodySummerWidget();
            }
            if (state is DetailFailed) {
              return WordBodyWidget(
                data: state.data!,
                buttonBackCallback: _handleBack,
                buttonNextCallback: _handleNext,
                buttonPlayCallback: _handlePlay,
                disableButtonNext: _indexWordDetail == (_itemsCount - 1),
                disableButtonBack: _indexWordDetail == 0,
              );
            }
            if (state is DetailSuccess) {
              return WordBodyWidget(
                data: state.data!,
                buttonBackCallback: _handleBack,
                buttonNextCallback: _handleNext,
                buttonPlayCallback: _handlePlay,
                disableButtonNext: _indexWordDetail == (_itemsCount - 1),
                disableButtonBack: _indexWordDetail == 0,
              );
            }
            return WordBodyWidget(
              data: widget.data[_indexWordDetail],
              buttonBackCallback: _handleBack,
              buttonNextCallback: _handleNext,
              buttonPlayCallback: _handlePlay,
              disableButtonNext: _indexWordDetail == (_itemsCount - 1),
              disableButtonBack: _indexWordDetail == 0,
            );
          },
        ),
      ),
    );
  }

  _handlePlay() async {
    CoreConfig.injector<FlutterTtsInterface>()
        .speak(widget.data[_indexWordDetail].word);
  }

  _handleNext() {
    if (_indexWordDetail < (_itemsCount - 1)) {
      _indexWordDetail += 1;
      _detailCubit.requestWordDetail(widget.data, _indexWordDetail);

      setState(() {
        _indexWordDetail;
      });
    }
  }

  _handleBack() {
    if (_indexWordDetail >= 1) {
      _indexWordDetail -= 1;
      _detailCubit.requestWordDetail(widget.data, _indexWordDetail);

      setState(() {
        _indexWordDetail;
      });
    } else {
      _detailCubit.requestWordDetail(widget.data, _indexWordDetail);

      setState(() {
        _indexWordDetail;
      });
    }
  }
}
