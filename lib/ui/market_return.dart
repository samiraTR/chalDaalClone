
import 'package:flutter/material.dart';
import 'package:tst_app2/local_storage/boxes.dart';
import 'package:tst_app2/model/Hive_model/stock_model.dart';
import 'package:tst_app2/model/sku_list_model.dart';
import 'package:tst_app2/utils/theme.dart';
class MarketReturnScreen extends StatefulWidget {
  @override
  _MarketReturnScreenState createState() => _MarketReturnScreenState();
}

class _MarketReturnScreenState extends State<MarketReturnScreen> {
  List<String> brands = ['Brand A', 'Brand B', 'Brand C'];
  Map<String, List<String>> skus = {
    'Brand A': ['SKU1', 'SKU2', 'SKU3'],
    'Brand B': ['SKU4', 'SKU5', 'SKU6'],
    'Brand C': ['SKU7', 'SKU8', 'SKU9'],
  };

  String? selectedBrand;
  String? selectedSku;
  String reason = '';
  String qty = '';

  List<Map<String, String>> tableData = [];
  StockReturnList? stockReturnList;
  //List<List<ItemList>> itemList;

  


  @override
  void initState() {
    stockReturnList = Boxes.getStockForSync().get('syncStock');
    // itemList=stockReturnList!.brandListStock.map((e) => e.itemListStock).toList();

      
   
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        backgroundColor: mainColor,
        centerTitle: true,
        title: Text('Market Return',style: TextStyle(color: white)),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          dataRowHeight: 40.0,
          headingRowColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.hovered)) {
                return mainColor.withOpacity(0.3);
              }
              return mainColor;
            },
          ),
          columns:const [
            DataColumn(label: Text('Brand', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text('SKU', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text('Reason', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text('Qty', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
            DataColumn(label: Text('Action', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white))),
          ],
          rows: tableData.asMap().entries.map((entry) {
            final int index = entry.key;
            final Map<String, String> data = entry.value;

            return DataRow(
              cells: [
                DataCell(Text(data['Brand'] ?? '')),
                DataCell(Text(data['SKU'] ?? '')),
                DataCell(Text(data['Reason'] ?? '')),
                DataCell(Text(data['Qty'] ?? '')),
                DataCell(
                  IconButton(
                    icon:const Icon(Icons.delete,color: Colors.red,),
                    onPressed: () {
                      _deleteRow(index);
                    },
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: mainColor,
        onPressed: _showAddItemDialog,
        label:const Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text("ADD SKU", style: TextStyle(color: Colors.white)),
            ],
          ),
        ),
      ),
    );
  }

//==========================widgte====================================
void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: ThemeData(
            dialogBackgroundColor: Colors.white,
            dialogTheme: DialogTheme(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
            ),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState2) {
              return AlertDialog(
                title: const Text('Add SKU'),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedBrand,
                        hint: const Text('Select Brand'),
                        onChanged: (value) {
                          setState(() {
                            selectedBrand = value;
                            selectedSku = null; // Reset SKU when brand changes
                          });
                        },
                        items: brands.map((brand) {
                          return DropdownMenuItem<String>(
                            value: brand,
                            child: Text(brand),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 10),
                      DropdownButtonFormField<String>(
                        value: selectedSku,
                        hint: Text('Select SKU'),
                        onChanged: (value) {
                          setState(() {
                            selectedSku = value;
                          });
                        },
                        items: skus[selectedBrand]?.map((sku) {
                              return DropdownMenuItem<String>(
                                value: sku,
                                child: Text(sku),
                              );
                            }).toList() ??
                            [],
                      ),
                     const SizedBox(height: 10),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            reason = value;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Reason'),
                      ),
                      TextFormField(
                        onChanged: (value) {
                          setState(() {
                            qty = value;
                          });
                        },
                        decoration: InputDecoration(labelText: 'Qty'),
                      ),
                    ],
                  ),
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tableData.add({
                          'Brand': selectedBrand!,
                          'SKU': selectedSku ?? '',
                          'Reason': reason,
                          'Qty': qty,
                        });
                      });

                      selectedBrand = null;
                      selectedSku = null;
                      reason = '';
                      qty = '';

                      Navigator.of(context).pop();
                      setState2(() {}); // Trigger a rebuild
                    },
                    child: Text('Add'),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  void _deleteRow(int index) {
    setState(() {
      tableData.removeAt(index);
    });
  }

}