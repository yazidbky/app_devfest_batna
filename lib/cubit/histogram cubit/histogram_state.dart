abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<dynamic> categorySales;
  final List<dynamic> genderSales;

  DashboardLoaded({required this.categorySales, required this.genderSales});
}

class DashboardError extends DashboardState {
  final String message;

  DashboardError({required this.message});
}
