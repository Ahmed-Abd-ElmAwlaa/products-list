import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:list_of_products/domain/model/Product.dart';

class ProductComponent extends StatelessWidget {
  Product product;
  ProductComponent(this.product, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.lightBlue,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      height: 220,
      width: 100,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: product.images!.isNotEmpty
                      ? Image.network(
                          product.images ?? "",
                          fit: BoxFit.cover,
                          height: 80,
                          width: double.infinity,
                        )
                      : const Icon(
                          Icons.error,
                          size: 25,
                        ),
                ),

                // Heart Icon
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Icon(IconlyLight.heart),
                      ),
                    ),
                  ),
                )
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Name Product
                  Text(
                    product.title ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.deepPurpleAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                  // Desc Product
                  Text(
                    product.description ?? "",
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.deepPurpleAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Price
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'EGP: ${product.price}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: Colors.deepPurpleAccent,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Text(
                          '${product.discountPercentage} EGP',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                color: Colors.lightBlue,
                                fontSize: 14,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: Colors.deepPurpleAccent,
                              ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 10,
                  ),

                  // Rating
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Text(
                          'Review (${product.rating})',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: const Color(0xff1e4067),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Icon(
                          Icons.star,
                          size: 20,
                          color: Colors.yellow,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xff1e4067),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(2.0),
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 19,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
