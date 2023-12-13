import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionWidget extends StatefulWidget {
  const TransactionWidget({
    Key? key,
    required this.transaction,
    required this.deleteTx,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTx;

  @override
  State<TransactionWidget> createState() => _TransactionWidgetState();
}

class _TransactionWidgetState extends State<TransactionWidget> {
  Color? _bgColor;
  @override
  void initState() {
    const availableColors = [
      Colors.red,
      Colors.blue,
      Colors.black,
      Colors.purple,
    ];
    _bgColor = availableColors[Random().nextInt(4)];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 5),
      child: ListTile(
          leading: CircleAvatar(
            backgroundColor: _bgColor,
            radius: 30,
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: FittedBox(
                child: Text('₹${widget.transaction.amount}'),
              ),
            ),
          ),
          title: Text(
            widget.transaction.title,
            style: Theme.of(context).textTheme.headline6,
          ),
          subtitle: Text(
            DateFormat.yMMMd().format(widget.transaction.date),
          ),
          trailing: MediaQuery.of(context).size.width > 460
              ? TextButton.icon(
                  style: TextButton.styleFrom(
                      primary: Theme.of(context).errorColor),
                  icon: const Icon(Icons.delete),
                  onPressed: () => widget.deleteTx(widget.transaction.id),
                  label: const Text('Delete'))
              : IconButton(
                  icon: Icon(Icons.delete),
                  color: Theme.of(context).errorColor,
                  onPressed: () => widget.deleteTx(widget.transaction.id),
                )),
    );
  }
}
