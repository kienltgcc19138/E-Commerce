import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youtube_ecommerce/constant/constants.dart';
import 'package:youtube_ecommerce/constant/routes.dart';
import 'package:youtube_ecommerce/models/product_model/product_model.dart';
import 'package:youtube_ecommerce/provider/app_provider.dart';
import 'package:youtube_ecommerce/screens/cart_screen/cart_screen.dart';
import 'package:youtube_ecommerce/screens/favourite_screen/favourite_screen.dart';

class ProductDetails extends StatefulWidget {
  final ProductModel singleProduct;
  const ProductDetails({super.key, required this.singleProduct});

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int qty = 1;

  @override
  Widget build(BuildContext context) {
    AppProvider appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      appBar: AppBar(
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Routes.instance
                      .push(widget: const CartScreen(), context: context);
                },
                icon: const Icon(Icons.shopping_cart),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: Consumer<AppProvider>(
                  builder: (context, appProvider, child) => CircleAvatar(
                    radius: 7,
                    backgroundColor: Colors.red,
                    child: Text(
                      appProvider.getCartProductList.length.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics:
            const BouncingScrollPhysics(), // to make scroll effect more real
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.network(
                widget.singleProduct.image,
                height: 400,
                width: 400,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.singleProduct.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        widget.singleProduct.isFavourite =
                            !widget.singleProduct.isFavourite;
                      });
                      if (widget.singleProduct.isFavourite) {
                        appProvider.addFavouriteProduct(widget.singleProduct);
                      } else {
                        appProvider
                            .removeFavouriteProduct(widget.singleProduct);
                      }
                    },
                    icon: Icon(
                      appProvider.getFavouriteProductList
                              .contains(widget.singleProduct)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              Text(
                widget.singleProduct.description,
                style: const TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        if (qty > 1) {
                          qty--;
                        }
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.remove, color: Colors.white),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Text(
                    qty.toString(),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        qty++;
                      });
                    },
                    padding: EdgeInsets.zero,
                    child: const CircleAvatar(
                      backgroundColor: Colors.red,
                      child: Icon(Icons.add, color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      ProductModel productModel =
                          widget.singleProduct.copyWith(qty: qty);
                      appProvider.addCartProduct(productModel);
                      showMessage("Added to Cart");
                    },
                    child: const Text("Add To Cart",
                        style: TextStyle(fontSize: 18)),
                  ),
                  const SizedBox(
                    width: 24.0,
                  ),
                  SizedBox(
                    height: 45,
                    width: 140,
                    child: ElevatedButton(
                      onPressed: () {
                        Routes.instance.push(
                            widget: const FavouriteScreen(), context: context);
                      },
                      child: const Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
