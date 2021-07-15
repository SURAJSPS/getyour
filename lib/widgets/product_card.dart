import 'package:flutter/material.dart';
import 'package:getyour/widgets/models/product_model.dart';

// ignore: must_be_immutable
class ProductCard extends StatelessWidget {
  ProductCard({Key? key, this.productModel}) : super(key: key);
  ProductModel? productModel;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return new Padding(
      padding: const EdgeInsets.all(12.0),
      child: new Container(
        height: size.height * .20,
        width: size.width * .40,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20), color: Colors.transparent),
        child: new Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: new Column(
            children: [
              new Expanded(
                flex: 2,
                child: new Image.asset(
                  "${productModel?.image}",
                  height: 10,
                  width: 100,
                ),
              ),
              new Text(
                "${productModel?.name}",
                style: TextStyle(fontSize: 18),
              ),
              new SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
