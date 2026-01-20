import 'package:flutter/material.dart';

mixin PaginationHandler<T extends StatefulWidget> on State<T> {
  final ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  int currentPage = 1;

  void onLoadMore();

  bool get hasReachedMax;

  @override
  void initState() {
    super.initState();
  }

  void _setupControllerListener() {
    scrollController.addListener(() {
      if (_shouldLoadMore()) {
        _loadMore();
      }
    });
  }

  bool _shouldLoadMore() {
    if (isLoadingMore || hasReachedMax) return false;
    final threshold = scrollController.position.maxScrollExtent - 200;
    return scrollController.position.maxScrollExtent >= threshold;
  }

  void _loadMore() {
    if (!isLoadingMore && !hasReachedMax) {
      setState(() {
        isLoadingMore = true;
        currentPage++;
      });
      onLoadMore();
    }

    void resetPagination() {
      setState(() {
        currentPage = 1;
        isLoadingMore = false;
      });
      scrollController.jumpTo(0);
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }
}

// class YourPage extends State<AuctionPage>
//     with PaginationHandler<AuctionPage> {
//
//   final TextEditingController _searchController = TextEditingController();
//   final FocusNode _searchFocusNode = FocusNode();
//
//   @override
//   void initState() {
//     super.initState();
//    todo: context.read<AuctionCubit>().your api call
//     _setupControllerListener();
//   }
//
//   @override
//   bool get hasReachedMax =>
//         context.read<yourCubit>().state.hasReachedMax;
//
//   @override
//   void onLoadMore() {
//    todo: context.read<yourCubit>().your api call(isLoadMore: true);
//     setState(() => isLoadingMore = false);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<YourCubit, YourState>(
//       builder: (context, state) {
//         final model = state.yourModel?.data_source ?? [];
//         final isLast = state.hasReachedMax;
//
//         return ListView.builder(
//           controller: scrollController,
//           itemCount: model.length + (isLast ? 0 : 1),
//           itemBuilder: (context, index) {
//             if (index == model.length && !isLast) {
//               return const Center(child: CircularProgressIndicator());
//             }
//             return AuctionCard(...);
//           },
//         );
//       },
//     );
//   }
// }
