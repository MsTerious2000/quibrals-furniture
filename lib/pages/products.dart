import 'package:flutter/material.dart';
import 'package:quibrals_furniture/widgets/colors.dart';
import 'package:quibrals_furniture/widgets/product_list.dart';
import 'package:quibrals_furniture/widgets/responsive.dart';
import 'package:quibrals_furniture/widgets/texts.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  late List<Map<String, dynamic>> _products;

  @override
  void initState() {
    _products = product_list;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > mobileLayout) {
          return _mainContent(desktopPadding);
        } else {
          return _mainContent(mobilePadding);
        }
      },
    );
  }

  Widget _mainContent(double responsivePadding) {
    return GridView.builder(
      padding: EdgeInsets.symmetric(horizontal: responsivePadding),
      shrinkWrap: true,
      itemCount: _products.length,
      itemBuilder: (context, index) {
        var _index = index + 1;
        var id = '#${_index.toString().padLeft(4, "0")}';
        return _productCard(
          context,
          _products[index]["image"],
          id,
          _products[index]["name"],
          _products[index]["description"],
          _products[index]["price"],
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
    );
  }

  Widget _productCard(
    BuildContext context,
    String _imageAsset,
    String _id,
    String _name,
    String _description,
    String _price,
  ) {
    return Card(
      child: InkWell(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetails(
              imageAsset: _imageAsset,
              id: _id,
              name: _name,
              description: _description,
              price: _price,
            ),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(_imageAsset),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, bottom: 10),
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: beige,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: poppins(_id, maroon, 15, fsNormal, fwBold, taLeft),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductDetails extends StatelessWidget {
  final String imageAsset;
  final String id;
  final String name;
  final String description;
  final String price;

  const ProductDetails({
    super.key,
    required this.imageAsset,
    required this.id,
    required this.name,
    required this.description,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return TooltipVisibility(
      visible: false,
      child: Scaffold(
        appBar: AppBar(
          title: poppins(id, beige, 20, fsNormal, fwBold, taLeft),
          backgroundColor: hickory,
          actions: [
            IconButton(
              onPressed: () => showDialog(
                barrierDismissible: false,
                context: context,
                builder: (detailsDialog) => _detailsDialog(detailsDialog),
              ),
              icon: Icon(Icons.info, color: beige),
            ),
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imageAsset),
            ),
          ),
        ),
      ),
    );
  }

  Widget _detailsDialog(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      content: Column(
        children: [
          poppins(id, maroon, 18, fsNormal, fwBold, taCenter),
          const Divider(thickness: 2),
          poppins(name, hickory, 15, fsNormal, fwBold, taCenter),
          const Divider(thickness: 2),
          Visibility(
            visible: description == "" ? false : true,
            child: poppins(description, gray, 15, fsItalic, fwNormal, taCenter),
          ),
          Visibility(
            visible: description == "" ? false : true,
            child: const Divider(thickness: 2),
          ),
          poppins(price, steelBlue, 15, fsNormal, fwBold, taCenter),
        ],
      ),
      actions: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.check, color: darkGreen),
        ),
      ],
    );
  }
}
