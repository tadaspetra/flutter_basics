import 'package:flutter/material.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/invoice.dart';

class MyAdmin extends StatefulWidget {
  MyAdmin({Key key}) : super(key: key);

  @override
  _MyAdminState createState() => _MyAdminState();
}

class _MyAdminState extends State<MyAdmin> with WidgetsBindingObserver {
  String _email = '';
  Invoice _invoice;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    InvoiceNinjaAdmin.configure(
      'TOKEN', // Set your API token or use 'TOKEN' to test
      url: 'https://demo.invoiceninja.com', // Set your selfhost app URL
      debugEnabled: true,
    );
  }

  void _findClient() async {
    try {
      final client = await InvoiceNinjaAdmin.clients.findByEmail(_email);
      print(client.name);
    } catch (e) {
      print("Client not found");
    }
  }

  void _loadInvoices() async {
    try {
      final invoices = await InvoiceNinjaAdmin.invoices.load();
      print(invoices);
    } catch (e) {
      print("Invoice not found");
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (_invoice == null || state != AppLifecycleState.resumed) {
      return;
    }
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Invoice Ninja Example'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      suffixIcon: Icon(Icons.email),
                    ),
                    onChanged: (value) => setState(() => _email = value),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 16),
                  OutlineButton(
                    child: Text('Find Client'),
                    onPressed: (_email.isNotEmpty != null) ? () => _findClient() : null,
                  ),
                  OutlineButton(
                    child: Text('Load all Invoices'),
                    onPressed: () => _loadInvoices(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
