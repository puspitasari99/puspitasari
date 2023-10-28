import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text(
          'Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "assets/HIJAU.jpg"), // Ganti dengan path ke gambar latar belakang
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Selamat datang di Dashboard",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              const SizedBox(height: 20),
              DashboardIconsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 4),
              ),
              child: const CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage(
                    'assets/FTprofil.jpg'), // Ganti dengan path ke gambar profil
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Nama:Dui Puspitasari",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const Text(
              "NPM: 21670023",
              style: TextStyle(fontSize: 18),
            ),
            const Text(
              "Kelas: 5A",
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class DashboardIconsGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      children: <Widget>[
        DashboardIcon(
          icon: Icons.person,
          label: "Profil", // Tambahkan label sesuai ikon
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProfileScreen(),
              ),
            );
          },
        ),
        DashboardIcon(
          icon: Icons.auto_awesome,
          label: "Hobby", // Tambahkan label sesuai ikon
        ),
        DashboardIcon(
          icon: Icons.email,
          label: "Email", // Tambahkan label sesuai ikon
        ),
        
        DashboardIcon(
          icon: Icons.home_filled,
          label: "Alamat" , 
          // Tambahkan label sesuai ikon
        ),
        
      ],
    );
  }
}

class DashboardIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;
  final Color iconColor; // Tambahkan properti warna ikon

  DashboardIcon({
    required this.icon,
    required this.label,
    this.onPressed = _dummyOnPressed,
    this.iconColor = Colors.blue, // Warna ikon default adalah hitam
  });

  static void _dummyOnPressed() {
    print("Tombol belum dikonfigurasi.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          IconButton(
            icon: Icon(
              icon,
              color: Colors.white, // Gunakan warna ikon yang telah ditentukan
            ),
            iconSize: 48,
            onPressed: onPressed,
          ),
          Text(
            label,
            style: TextStyle(fontSize: 16, color: Colors.white),
            
          ),
        ],
      ),
    );
  }
}
