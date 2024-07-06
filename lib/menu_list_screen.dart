import 'package:flutter/material.dart';

class MenuListScreen extends StatefulWidget {
  @override
  _MenuListScreenState createState() => _MenuListScreenState();
}

class _MenuListScreenState extends State<MenuListScreen> {
  // This map keeps track of the quantity for each menu item.
  Map<int, int> _selectedItems = {};

  // This method increments the quantity of the selected item.
  void _incrementQuantity(int index) {
    setState(() {
      _selectedItems[index] = (_selectedItems[index] ?? 0) + 1;
    });
  }

  // This method decrements the quantity of the selected item.
  void _decrementQuantity(int index) {
    setState(() {
      if (_selectedItems[index] != null && _selectedItems[index]! > 0) {
        _selectedItems[index] = _selectedItems[index]! - 1;
      }
    });
  }

  // This method toggles the selection state of the item.
  void _toggleSelection(int index) {
    setState(() {
      if (_selectedItems.containsKey(index)) {
        _selectedItems.remove(index);
      } else {
        _selectedItems[index] = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE4CCFF),
      appBar: AppBar(title: Text('Restaurant Name')),
      body: GridView.builder(
        padding: EdgeInsets.all(16.0),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16.0,
          mainAxisSpacing: 16.0,
        ),
        itemCount: 6,
        itemBuilder: (context, index) {
          bool isSelected = _selectedItems.containsKey(index);

          return GestureDetector(
            onTap: () => _toggleSelection(index),
            child: Card(
              child: isSelected
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Menu ${index + 1} Name'),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => _decrementQuantity(index),
                            ),
                            Text('${_selectedItems[index]}'),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => _incrementQuantity(index),
                            ),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Placeholder(
                            fallbackHeight: 80, fallbackWidth: double.infinity),
                        Text('Menu ${index + 1} Name'),
                        Text('₱150.00'),
                      ],
                    ),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/orderSummary',
                arguments: _selectedItems);
          },
          child: Text('Check Out'),
        ),
      ),
    );
  }
}
