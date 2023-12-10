import 'package:new_dashboard/screen/home_screen.dart';
import 'package:flutter/material.dart';

class KonfirmasiScreen extends StatefulWidget {
  @override
  _KonfirmasiScreenState createState() => _KonfirmasiScreenState();
}

class _KonfirmasiScreenState extends State<KonfirmasiScreen> {
  List<Transaksi> transaksiList = [
    Transaksi(DateTime.now(), 100.0),
    Transaksi(DateTime.now().subtract(Duration(days: 1)), 50.0),
    // Tambahkan transaksi lainnya sesuai kebutuhan
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat KasMu'),
        backgroundColor: Color(0xFFF1F5FF),
      ),
      body: ListView.builder(
        itemCount: transaksiList.length,
        itemBuilder: (context, index) {
          Transaksi transaksi = transaksiList[index];
          return ListTile(
            title: Text('Tanggal: ${_formatTanggal(transaksi.tanggal)}'),
            subtitle: Text('Nominal: ${transaksi.nominal.toString()}'),
            trailing: ElevatedButton(
              onPressed: () {
                _tampilkanBuktiTransfer(transaksi);
              },
              child: Text('Lihat Bukti'),
            ),
          );
        },
      ),
    );
  }

  String _formatTanggal(DateTime tanggal) {
    // Format tanggal sesuai dengan kebutuhan, contoh: "dd/MM/yyyy HH:mm:ss"
    return "${tanggal.day}/${tanggal.month}/${tanggal.year} ${tanggal.hour}:${tanggal.minute}:${tanggal.second}";
  }

    void _tampilkanBuktiTransfer(Transaksi transaksi) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Bukti Transfer'),
          content: Column(
            children: [
              Image.network(
                'https://s0.bukalapak.com/img/0657559704/large/Screenshot_2018_11_22_20_41_14_33.png',
                // Ganti dengan URL gambar bukti transfer Anda
                height: 500.0,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Tutup'),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Transaksi {
  DateTime tanggal;
  double nominal;

  Transaksi(this.tanggal, this.nominal);
}
