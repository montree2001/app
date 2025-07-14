import 'package:flutter/material.dart';

void main() {
  runApp(AttendanceApp());
}

class AttendanceApp extends StatelessWidget {
  const AttendanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เช็คชื่อกิจกรรม',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0xFF1565C0),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1565C0),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        fontFamily: 'Kanit',
      ),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      appBar: AppBar(
        title: Text(
          'ระบบเช็คชื่อกิจกรรม',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.account_circle),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            Container(
              width: double.infinity,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF1565C0), Color(0xFF42A5F5)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.school,
                    color: Colors.white,
                    size: 50,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'วิทยาลัยการอาชีพปราสาท',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 5),
                  Text(
                    'ระบบเช็คชื่อกิจกรรมออนไลน์',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            
            SizedBox(height: 30),
            
            // Quick Stats
            Text(
              'สถิติวันนี้',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(height: 15),
            
            Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.event,
                    title: 'กิจกรรมวันนี้',
                    value: '3',
                    color: Colors.orange,
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: _buildStatCard(
                    icon: Icons.people,
                    title: 'ผู้เข้าร่วม',
                    value: '127',
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            
            SizedBox(height: 30),
            
            // Menu Grid
            Text(
              'เมนูหลัก',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(height: 15),
            
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              children: [
                _buildMenuCard(
                  context,
                  icon: Icons.qr_code_scanner,
                  title: 'เช็คชื่อ QR Code',
                  subtitle: 'สแกน QR เพื่อเช็คชื่อ',
                  color: Color(0xFF4CAF50),
                  onTap: () => _navigateToQRScanner(context),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.edit,
                  title: 'เช็คชื่อด้วยตนเอง',
                  subtitle: 'กรอกรหัสนักเรียน',
                  color: Color(0xFF2196F3),
                  onTap: () => _navigateToManualCheck(context),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.list_alt,
                  title: 'รายชื่อกิจกรรม',
                  subtitle: 'ดูกิจกรรมทั้งหมด',
                  color: Color(0xFF9C27B0),
                  onTap: () => _navigateToActivityList(context),
                ),
                _buildMenuCard(
                  context,
                  icon: Icons.analytics,
                  title: 'รายงานสถิติ',
                  subtitle: 'ดูสถิติการเข้าร่วม',
                  color: Color(0xFFFF9800),
                  onTap: () => _navigateToReports(context),
                ),
              ],
            ),
            
            SizedBox(height: 30),
            
            // Recent Activities
            Text(
              'กิจกรรมล่าสุด',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
            ),
            SizedBox(height: 15),
            
            _buildRecentActivityCard(
              'อบรมเทคโนโลยีสารสนเทศ',
              'วันที่ 12 กรกฎาคม 2567',
              '85 คน',
              Icons.computer,
            ),
            SizedBox(height: 10),
            _buildRecentActivityCard(
              'กิจกรรมวันสิ่งแวดล้อม',
              'วันที่ 11 กรกฎาคม 2567',
              '120 คน',
              Icons.eco,
            ),
            SizedBox(height: 10),
            _buildRecentActivityCard(
              'ประชุมผู้ปกครอง',
              'วันที่ 10 กรกฎาคม 2567',
              '95 คน',
              Icons.groups,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Icon(icon, color: color, size: 30),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color, size: 32),
            ),
            SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivityCard(
    String title,
    String date,
    String participants,
    IconData icon,
  ) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Color(0xFF1565C0).withOpacity(0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Color(0xFF1565C0), size: 24),
          ),
          SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF333333),
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Color(0xFF4CAF50),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              participants,
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateToQRScanner(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('เปิดกล้องสแกน QR Code'),
        backgroundColor: Color(0xFF4CAF50),
      ),
    );
  }

  void _navigateToManualCheck(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('เปิดหน้าเช็คชื่อด้วยตนเอง'),
        backgroundColor: Color(0xFF2196F3),
      ),
    );
  }

  void _navigateToActivityList(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('แสดงรายชื่อกิจกรรม'),
        backgroundColor: Color(0xFF9C27B0),
      ),
    );
  }

  void _navigateToReports(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('แสดงรายงานสถิติ'),
        backgroundColor: Color(0xFFFF9800),
      ),
    );
  }
}


