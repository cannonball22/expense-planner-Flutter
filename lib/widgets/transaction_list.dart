import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (ctx, constratins) {
            return Column(
              children: [
                Text(
                  'No Transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: constratins.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                )
              ],
            );
          })
        : ListView(
            children: transactions
                .map((tx) =>
                    TransactionItem(transaction: tx, deleteTx: deleteTx))
                .toList(),
          );
    // : ListView.builder(
    //     itemBuilder: (ctx, index) {
    //       return TransactionItem(
    //           transaction: transactions[index], deleteTx: deleteTx);
    //     },
    //     itemCount: transactions.length,
    //   );
  }
}

// Card(
// child: Row(
// children: <Widget>[
// Container(
// child: Text(
// '\$${transactions[index].amount.toStringAsFixed(2)}',
// style: TextStyle(
// fontWeight: FontWeight.bold,
// fontSize: 20,
// color: Theme.of(context).primaryColor,
// ),
// ),
// margin: EdgeInsets.symmetric(
// horizontal: 15,
// vertical: 10,
// ),
// decoration: BoxDecoration(
// border: Border.all(
// color: Theme.of(context).primaryColor,
// width: 2,
// ),
// ),
// padding: EdgeInsets.all(10),
// ),
// Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: <Widget>[
// Text(
// transactions[index].title,
// style: Theme.of(context).textTheme.title,
// ),
// Text(
// DateFormat.yMMMMd('en_us')
// .format(transactions[index].date),
// style: TextStyle(
// color: Colors.grey,
// fontSize: 12,
// ),
// ),
// ],
// ),
// ],
// ),
// );
