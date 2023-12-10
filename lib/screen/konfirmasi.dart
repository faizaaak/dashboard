import 'package:flutter/material.dart';
import 'package:new_dashboard/screen/home_screen.dart';

class Transaction {
  final DateTime date;
  final String userName;
  final String category;
  final double amount;

  Transaction({
    required this.date,
    required this.userName,
    required this.category,
    required this.amount,
  });
}

class TransactionCard extends StatefulWidget {
  final Transaction transaction;

  TransactionCard({required this.transaction});

  @override
  _TransactionCardState createState() => _TransactionCardState();
}

class _TransactionCardState extends State<TransactionCard> {
  bool isConfirmationEnabled = true;

  void _onKonfirmasiPressed() {
    // Add your confirmation logic here
    setState(() {
      isConfirmationEnabled = false; // Disable the button after it's clicked
    });
  }

  void _onBuktiTransferPressed() {
    // Add your "Bukti Transfer" logic here
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Bukti Transfer'),
          content: Column(
            children: [
              Image.network('https://s0.bukalapak.com/img/0657559704/large/Screenshot_2018_11_22_20_41_14_33.png'), // Replace with your image URL
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: Text('Close'),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(5.0),
      child: ListTile(
        title: Text('Date: ${widget.transaction.date.toString()}'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('User: ${widget.transaction.userName}'),
            Text('Kategori: ${widget.transaction.category}'),
            Text('Total: ${widget.transaction.amount.toString()}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: isConfirmationEnabled ? _onKonfirmasiPressed : null,
                  child: Text('Konfirmasi'),
                ),
                ElevatedButton(
                  onPressed: _onBuktiTransferPressed,
                  child: Text('Bukti Transfer'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class HistoryScreen extends StatelessWidget {
  final List<Transaction> transactions;

  HistoryScreen({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TransactionHistoryPage(transactions: transactions),
    );
  }
}

class TransactionHistoryPage extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionHistoryPage({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
         onPressed: () {
           Navigator.pushReplacement(
             context,
             MaterialPageRoute(builder: (context) => HomeScreen()), // Ganti HomeScreen dengan nama sesuai halaman utama Anda
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (context, index) {
          return TransactionCard(transaction: transactions[index]);
        },
      ),
    );
  }
}
