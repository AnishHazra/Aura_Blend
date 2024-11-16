import 'package:flutter/material.dart';
import 'package:aura_blend/components/my_receipt.dart';
import 'package:aura_blend/services/database/firestore.dart';

class DeliveryProgressPage extends StatefulWidget {
  final String receipt;
  const DeliveryProgressPage({super.key, required this.receipt});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {
  //! get access to db
  FireStoreService db = FireStoreService();

  @override
  void initState() {
    super.initState();
    db.saveOrderToDatabase(widget.receipt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          MyReceipt(receipt: widget.receipt),
        ],
      ),
    );
  }
}
