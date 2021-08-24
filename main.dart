import 'package:flutter/material.dart';

import './widgets/transaction_list.dart';

import './widgets/new_transaction.dart';
import './models/transaction.dart';




void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  


  // late String titleInput;
  // late String amountInput;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
   final List<Transaction> _userTransactions = [
    Transaction(id: 'T1',title: 'new shoes', amount: 69.99,date: DateTime.now(),),
    Transaction(id: 'T2',title: 'new clothes', amount: 99.99,date: DateTime.now(),),
  ];
  void _addNewTransaction(String txTitle,double txAmount){
    final newTx = Transaction(title: txTitle,
    amount: txAmount,
    date: DateTime.now(),
    id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }


  void _startAddNewTransaction(BuildContext ctx) {
   showModalBottomSheet(context: ctx,builder: (_) {
    return NewTransaction(_addNewTransaction);
   }, );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: <Widget>[
        IconButton( 
          icon: Icon(Icons.add),
          onPressed: () =>_startAddNewTransaction(context),
          )
        ],
      ) ,
      body:  SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                 width: double.infinity,
                 child: Card(
                            color: Colors.blue,
                            child: Text('CHART!'),
                            ),
            ),
            TransactionList(_userTransactions),
           
          ],
         ),
       ),
       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () =>_startAddNewTransaction(context),      
      ),
   );
  }
}

