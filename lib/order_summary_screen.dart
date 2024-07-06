import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // *SUPPOSEDLY* retrieves selected item from other screen ambot.
    final Map<int, int> selectedItems =
        ModalRoute.of(context)?.settings.arguments as Map<int, int>? ?? {}; // hope this shit works
        //old context .of(context)!.settings.arguments as Map[int,int] ??? {};
    return Scaffold(
      backgroundColor: Color(0xFFE4CCFF),
      appBar: AppBar(title: Text('Order Summary')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: selectedItems.length,
                itemBuilder: (context, index) {
                  int itemIndex = selectedItems.keys.elementAt(index);
                  int quantity = selectedItems[itemIndex]!;

                  return ListTile(
                    title: Text('Menu ${itemIndex + 1} Name'),
                    subtitle: Text('Quantity: $quantity'),
                    trailing: Text('₱${150 * quantity}.00'),
                  );
                },
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total', style: TextStyle(fontSize: 20)),
                  Text(
                    '₱${selectedItems.values.fold(0, (sum, quantity) => sum + (150 * quantity))}.00',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Proceed to payment
              },
              child: Text('Proceed to Payout'),
            ),
          ],
        ),
      ),
    );
  }
}
