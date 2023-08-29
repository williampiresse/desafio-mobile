import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/core_config.dart';
import '../../../../detailWord/presentation/screen/detail_word_screen.dart';
import '../../../../favorites/domain/usecases/save_favorites_usecase_interface.dart';
import '../../../data/models/word_model.dart';
import 'word_list_item_card_widget.dart';

class WordsWidget extends StatefulWidget {
  const WordsWidget({
    required this.item,
    required this.data,
    required this.callback,
    required this.currentPage,
    required this.hasReachedMax,
    this.isLoadingMore = false,
    super.key,
  });

  final int item;
  final int currentPage;
  final bool hasReachedMax;
  final List<WordModel> data;
  final bool? isLoadingMore;
  final Future Function() callback;

  @override
  State<WordsWidget> createState() => _WordsWidgetState();
}

class _WordsWidgetState extends State<WordsWidget> {
  static GetIt injector = CoreConfig.injector;
  final _saveFavoritesUsecaseInterface =
      injector<SaveFavoritesUsecaseInterface>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder: (_, index) {
        if (index >= widget.data.length) {
          return const Center();
        } else {
          return WordListItemCardWidget(
            text: widget.data[index].word,
            isFavorite: widget.data[index].favored!,
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => DetailWordScreen(
                    data: widget.data,
                    position: index,
                  ),
                ),
              );
            },
            buttonFavoriteCallback: () {
              setState(() {
                widget.data[index].favored = !widget.data[index].favored!;
              });
              _saveFavoritesUsecaseInterface.call(widget.data[index]);
            },
          );
        }
      },
      itemCount:
          widget.hasReachedMax ? widget.data.length : widget.data.length + 1,
      controller: _scrollController,
    );
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_onScroll)
      ..dispose();
    super.dispose();
  }

  void _onScroll() {
    if (_isBottom) _loadMoreItems();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }

  Future<void> _loadMoreItems() async {
    final bool loadingMore = widget.isLoadingMore ?? false;
    if (loadingMore) return;
    await widget.callback();
  }
}
