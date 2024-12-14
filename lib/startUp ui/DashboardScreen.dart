import 'package:app_devfest_batna/components/main_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Overall padding for the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dashboard Overview',
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold, fontSize: 24),
            ),
            const SizedBox(height: 20), // Spacing

            // Row of Data Containers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                    child: DataContainer(
                        title: 'Total Users',
                        content: '40,000',
                        raise: '8.5% up from yesterday',
                        icon: Icons.people)),
                const SizedBox(width: 10), // Spacing between containers
                Expanded(
                    child: DataContainer(
                        title: 'Total Orders',
                        content: '10,000',
                        raise: '5.3% up from yesterday',
                        icon: Icons.shopping_cart)),
                const SizedBox(width: 10), // Spacing between containers
                Expanded(
                    child: DataContainer(
                        title: 'Total Sales',
                        content: '\$89,000',
                        raise: '12.0% up from yesterday',
                        icon: Icons.attach_money)),
              ],
            ),
            const SizedBox(height: 30), // Spacing before graph

            // Graph Section
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        spreadRadius: 1,
                        blurRadius: 8,
                        offset: const Offset(0, 4)),
                  ],
                ),
                padding: const EdgeInsets.all(16),
                child: LineChartSample(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Custom Widget for Data Container with improved design
  Widget DataContainer(
      {required String title,
      required String content,
      required String raise,
      required IconData icon}) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 28, color: mainColor),
                const SizedBox(width: 10),
                Text(
                  title,
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ],
            ),
            const SizedBox(height: 10), // Spacing
            Text(
              content,
              style: GoogleFonts.poppins(
                  fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5), // Spacing
            Text(
              raise,
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

// Line Chart Widget
class LineChartSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Colors.grey.shade300,
              strokeWidth: 1,
            );
          },
        ),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              reservedSize: 40,
              getTitlesWidget: (value, meta) {
                return Text('${value.toInt()}%',
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ));
              },
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                const months = [
                  "jan",
                  "feb",
                  "mar",
                  "apr",
                  "mai",
                  "jun",
                  "jul",
                  "aou",
                  "sep",
                  "oct",
                  "nov",
                  "dec"
                ];
                return Text(
                  months[value.toInt()],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                );
              },
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: Colors.grey.shade300, width: 1),
        ),
        minX: 0,
        maxX: 11,
        minY: 0,
        maxY: 100,
        lineBarsData: [
          LineChartBarData(
            spots: [
              FlSpot(0, 20),
              FlSpot(1, 50),
              FlSpot(2, 40),
              FlSpot(3, 80),
              FlSpot(4, 70),
              FlSpot(5, 60),
              FlSpot(6, 90),
              FlSpot(7, 70),
              FlSpot(8, 50),
              FlSpot(9, 60),
              FlSpot(10, 40),
              FlSpot(11, 50),
            ],
            isCurved: true,
            color: Colors.blue,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                return FlDotCirclePainter(
                  radius: 4,
                  color: Colors.blue,
                  strokeColor: Colors.white,
                  strokeWidth: 2,
                );
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: Colors.blue.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}
