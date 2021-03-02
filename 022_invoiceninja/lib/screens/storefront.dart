import 'package:flutter/material.dart';
import 'package:invoiceninja/invoiceninja.dart';
import 'package:invoiceninja/models/client.dart';
import 'package:invoiceninja/models/invoice.dart';
import 'package:invoiceninja/models/product.dart';
import 'package:url_launcher/url_launcher.dart';

class MyStoreFront extends StatefulWidget {
  MyStoreFront({Key key}) : super(key: key);

  @override
  _MyStoreFrontState createState() => _MyStoreFrontState();
}

class _MyStoreFrontState extends State<MyStoreFront> with WidgetsBindingObserver {
  List<Product> _products = [];

  String _email = '';
  Product _product;
  Invoice _invoice;

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);

    InvoiceNinja.configure(
      'KEY', // Set your company key or use 'KEY' to test
      url: 'https://demo.invoiceninja.com', // Set your selfhost app URL
      debugEnabled: true,
    );

    InvoiceNinja.products.load().then((products) {
      setState(() {
        _products = products;
      });
    });
  }

  void _createInvoice() async {
    var client = Client.forContact(email: _email);
    client = await InvoiceNinja.clients.save(client);

    var invoice = Invoice.forClient(client, products: [_product]);
    invoice = await InvoiceNinja.invoices.save(invoice);

    setState(() {
      _invoice = invoice;
    });
  }

  void _viewPdf() {
    launch(
      'https://docs.google.com/gview?embedded=true&url=${_invoice.pdfUrl}',
      forceWebView: true,
    );
  }

  void _viewPortal() {
    final invitation = _invoice.invitations.first;
    launch(invitation.url);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    // checks whether the app has resumed, so you can check if the invoice has been paid
    if (_invoice == null || state != AppLifecycleState.resumed) {
      return;
    }

    final invoice = await InvoiceNinja.invoices.findByKey(_invoice.key);

    if (invoice.isPaid) {
      // ...
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
        title: Text('Invoice Ninja Storefront'),
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
                  DropdownButtonFormField<Product>(
                    decoration: InputDecoration(
                      labelText: 'Product',
                    ),
                    onChanged: (value) => setState(() => _product = value),
                    items: _products
                        .map((product) => DropdownMenuItem(
                              child: Text(product.productKey),
                              value: product,
                            ))
                        .toList(),
                  ),
                  SizedBox(height: 16),
                  OutlineButton(
                    child: Text('Create Invoice'),
                    onPressed: (_email.isNotEmpty && _product != null) ? () => _createInvoice() : null,
                  ),
                  OutlineButton(
                    child: Text('View PDF'),
                    onPressed: (_invoice != null) ? () => _viewPdf() : null,
                  ),
                  OutlineButton(
                    child: Text('View Portal'),
                    onPressed: (_invoice != null) ? () => _viewPortal() : null,
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
