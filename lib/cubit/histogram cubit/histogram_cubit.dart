import 'package:app_devfest_batna/api/histogram%20api/histogram_api.dart';
import 'package:app_devfest_batna/cubit/histogram%20cubit/histogram_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardCubit extends Cubit<DashboardState> {
  final SalesHistogramApiService salesHistogramApiService;

  DashboardCubit(SalesHistogramApiService apiService,
      {required this.salesHistogramApiService})
      : super(DashboardInitial());

  Future<void> fetchData() async {
    try {
      emit(DashboardLoading());
      final result = await salesHistogramApiService.fetchSalesHistogram(
          fileId: '675c8b40f94c5b4499876bd6');

      if (result['success'] == true && result['data'] != null) {
        final data = result['data'];
        final categorySales =
            data['histogram_category_sales'] as List<dynamic>? ?? [];
        final genderSales =
            data['histogram_gender_sales'] as List<dynamic>? ?? [];

        emit(DashboardLoaded(
            categorySales: categorySales, genderSales: genderSales));
      } else {
        emit(
            DashboardError(message: result['error'] ?? 'Unexpected API error'));
      }
    } catch (e) {
      emit(DashboardError(message: e.toString()));
    }
  }

  void fetchDashboardData({required fileId}) {}
}
