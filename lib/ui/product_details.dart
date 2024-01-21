import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  dynamic productDetail;
  ProductDetailsScreen({
    Key? key,
    required this.productDetail,
  }) : super(key: key);

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    InputDecorationTheme inputDecoration =
        Theme.of(context).inputDecorationTheme;

    return Scaffold(
      appBar: AppBar(title: const Text("Product details")),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.productDetail.itemName,
                  style: const TextStyle(fontSize: 22),
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: CachedNetworkImage(
                    imageUrl:widget.productDetail.itemAvatar,
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${widget.productDetail.invoicePrice}| ${widget.productDetail.itemChain}",
                      style: const TextStyle(fontSize: 18),
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.flash_on_sharp,
                        color: Colors.purple[100],
                        size: 38,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.purple),
                      child: const Text("Buy now"),
                    ),
                    quantity == 0
                        ? IconButton(
                            icon: Icon(
                              Icons.add_box,
                              color: Colors.purple[100],
                              size: 38,
                            ),
                            onPressed: () {
                              setState(() {
                                quantity++;
                              });
                            },
                          )
                        : Row(
                            children: [
                              IconButton(
                                icon: Icon(
                                  Icons.remove_circle_outlined,
                                  color: Colors.purple[100],
                                  size: 38,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity--;
                                  });
                                },
                              ),
                              Text(quantity.toString()),
                              IconButton(
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.purple[100],
                                  size: 38,
                                ),
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                              )
                            ],
                          )
                  ],
                ),
                const Divider(),
                Text(
                  widget.productDetail.flavorName,
                  style: const TextStyle(fontSize: 17),
                ),
                // const Spacer(),
                const SizedBox(
                  height: 35,
                ),
                Center(
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Close",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.purple,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
