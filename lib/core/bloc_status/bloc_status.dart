import 'package:freezed_annotation/freezed_annotation.dart';

part 'bloc_status.freezed.dart';

enum Status { initial, loading, success, error }

@freezed
class BlocStatus<T> with _$BlocStatus<T> {
  const BlocStatus._();

  /// Initial state
  const factory BlocStatus.initial() = _Initial<T>;

  /// Loading state
  const factory BlocStatus.loading() = _Loading<T>;

  /// Success state (must have data)
  const factory BlocStatus.success({required T data}) = _Success<T>;

  /// Error state (must have message)
  const factory BlocStatus.error({required String message}) = _Error<T>;
}

/// Helpers
extension BlocStatusX<T> on BlocStatus<T> {
  Status get status => when(
    initial: () => Status.initial,
    loading: () => Status.loading,
    success: (_) => Status.success,
    error: (_) => Status.error,
  );

  bool get isInitial => this is _Initial<T>;

  bool get isLoading => this is _Loading<T>;

  bool get isSuccess => this is _Success<T>;

  bool get isError => this is _Error<T>;
}

extension BlocStatusAccessX<T> on BlocStatus<T> {
  T get data {
    return when(
      success: (data) => data,
      initial: () => throw StateError('No data: initial'),
      loading: () => throw StateError('No data: loading'),
      error: (_) => throw StateError('No data: error'),
    );
  }

  String? get errorMessage => whenOrNull(error: (msg) => msg);
}

// todo:  ================ How to Use in class State ======================

// ======================== from chatGPT ===========================
// @freezed
// class HomeState with _$HomeState {
//   const HomeState._();
//
//   const factory HomeState({
//     required BlocStatus<CategoryResponse> categories,
//     required BlocStatus<List<BannerModel>> banners,
//   }) = _HomeState;
//
//   factory HomeState.initial() => HomeState(
//     categories: const BlocStatus.initial(),
//     banners: const BlocStatus.initial(),
//   );
// }

// ======================== from gemini   ===========================
// @freezed
// class HomeState with _$HomeState {
//   factory HomeState({
//     @Default(BlocStatus.initial()) BlocStatus<CategoryResponse> categoryStatus,
//     @Default(BlocStatus.initial()) BlocStatus<ProductResponse> productsStatus,
//     @Default(BlocStatus.initial()) BlocStatus<UserInfo> userStatus,
//   }) = _HomeState;
// }

// todo:  ================ How to Use in class Cubit ======================
// class HomeCubit extends Cubit<HomeState> {
//   final HomeRepo repo;
//
//   HomeCubit(this.repo) : super(HomeState.initial());
//
//   Future<void> getCategories() async {
//     emit(
//       state.copyWith(
//         categories: const BlocStatus.loading(),
//       ),
//     );
//
//     final result = await repo.getCategories();
//
//     result.when(
//       success: (data) {
//         emit(
//           state.copyWith(
//             categories: BlocStatus.success(data),
//           ),
//         );
//       },
//       error: (error) {
//         emit(
//           state.copyWith(
//             categories: BlocStatus.error(error.message),
//           ),
//         );
//       },
//     );
//   }
//
//   Future<void> getBanners() async {
//     emit(
//       state.copyWith(
//         banners: const BlocStatus.loading(),
//       ),
//     );
//
//     final result = await repo.getBanners();
//
//     result.when(
//       success: (data) {
//         emit(
//           state.copyWith(
//             banners: BlocStatus.success(data),
//           ),
//         );
//       },
//       error: (error) {
//         emit(
//           state.copyWith(
//             banners: BlocStatus.error(error.message),
//           ),
//         );
//       },
//     );
//   }
// }

// todo:  ================ How to Use in Ui ======================
// BlocBuilder<HomeCubit, HomeState>(
// builder: (context, state) {
// return Column(
// children: [
// state.categories.when(
// initial: () => const SizedBox(),
// loading: () => const CircularProgressIndicator(),
// success: (data) => CategoriesSection(data),
// error: (message) => ErrorView(message),
// ),
//
// state.banners.when(
// initial: () => const SizedBox(),
// loading: () => const CircularProgressIndicator(),
// success: (data) => BannersSection(data),
// error: (message) => ErrorView(message),
// ),
// ],
// );
// },
// );
