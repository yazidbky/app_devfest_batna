import 'package:app_devfest_batna/api/histogram%20api/histogram_api.dart';
import 'package:app_devfest_batna/cubit/histogram%20cubit/histogram_cubit.dart';
import 'package:app_devfest_batna/cubit/histogram%20cubit/histogram_state.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashboardCubit(
          salesHistogramApiService: SalesHistogramApiService(),
          SalesHistogramApiService())
        ..fetchData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Dashboard',
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: BlocBuilder<DashboardCubit, DashboardState>(
          builder: (context, state) {
            if (state is DashboardLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is DashboardLoaded) {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Dashboard Overview',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Data Containers
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: DataContainer(
                            title: 'Total Users',
                            content: '1.5K',
                            raise: '8.5% up from yesterday',
                            icon: Icons.people,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DataContainer(
                            title: 'Total Orders',
                            content: '250',
                            raise: '5.3% up from yesterday',
                            icon: Icons.shopping_cart,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: DataContainer(
                            title: 'Total Sales',
                            content: '\$12K',
                            raise: '12.0% up from yesterday',
                            icon: Icons.attach_money,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),

                    // Graphs
                    Expanded(
                      child: BarChartSample(categorySales: state.categorySales),
                    ),
                    const SizedBox(height: 20),
                    Expanded(
                      child: PieChartSample(genderSales: state.genderSales),
                    ),
                  ],
                ),
              );
            } else if (state is DashboardError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Unexpected state'));
            }
          },
        ),
      ),
    );
  }
}

class DataContainer extends StatelessWidget {
  final String title;
  final String content;
  final String raise;
  final IconData icon;

  const DataContainer({
    required this.title,
    required this.content,
    required this.raise,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 24, color: Colors.blue),
              const SizedBox(width: 8),
              Text(
                title,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            raise,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}

class BarChartSample extends StatelessWidget {
  final List<dynamic> categorySales;

  const BarChartSample({required this.categorySales});

  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
        barGroups: categorySales.map((item) {
          final category = item['category'] ?? 'Unknown';
          final totalSales = item['total_sales'] ?? 0;

          return BarChartGroupData(
            x: categorySales.indexOf(item),
            barRods: [
              BarChartRodData(
                toY: totalSales.toDouble(),
                color: Colors.blue,
                width: 16,
                borderRadius: BorderRadius.circular(4),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}

class PieChartSample extends StatelessWidget {
  final List<dynamic> genderSales;

  const PieChartSample({required this.genderSales});

  @override
  Widget build(BuildContext context) {
    return PieChart(
      PieChartData(
        sections: genderSales.map((item) {
          final gender = item['gender'] ?? 'Unknown';
          final totalSales = item['total_sales'] ?? 0;

          return PieChartSectionData(
            title: gender,
            value: totalSales.toDouble(),
            color: gender == 'Male' ? Colors.blue : Colors.pink,
          );
        }).toList(),
      ),
    );
  }
}
