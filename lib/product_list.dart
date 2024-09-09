import 'package:flutter/material.dart';
import 'package:flutter_application_1/cart.dart';
import 'package:flutter_application_1/item_list.dart';

class Product_List extends StatefulWidget {
  const Product_List({super.key});

  @override
  State<Product_List> createState() => _Product_ListState();
}

class _Product_ListState extends State<Product_List> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Color.fromARGB(255, 108, 84, 75),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) {
          return const Divider(
            color: Colors.black,
          );
        },
        itemCount: item_list.length,
        itemBuilder: (context, index) {
          return ListTile(
            contentPadding: EdgeInsets.all(30),
            title: Text(item_list[index].product_Name),
            subtitle: Text('\$ ${item_list[index].product_price.toString()}'),
            trailing: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Item need : ${item_list[index].counter} '),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          item_list[index].increase();

                          if (item_list[index].counter == 5) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: Text(
                                        'Congratulations! You\'ve bought 5 ${item_list[index].product_Name}'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('Ok'))
                                    ],
                                  );
                                });
                          }
                        });
                      },
                      child: const Text('Buy Now'))
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Cart_Page()));
        },
        child: Icon(Icons.shopping_cart),
      ),
    );
  }
}
