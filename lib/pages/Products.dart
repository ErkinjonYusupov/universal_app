import 'package:insta_image_viewer/insta_image_viewer.dart';
import 'package:universal_app/config/Imports.dart';
import 'package:universal_app/models/products_model.dart';

class Products extends StatefulWidget {
  const Products({super.key});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  ProductsController controller = Get.put(ProductsController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductsController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Mahsulotlar"),
          ),
          body: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: controller.loading
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                  child: Wrap(
                      spacing: 5,
                      runSpacing: 5,
                      children: List.generate(controller.products.length, (index){
                        var item = controller.products[index];
                        return ProductCard(product:item);
                      })
                    ),
                ),
          ),
        );
      },
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductsModel product;
   ProductCard({
    super.key,
    required this.product
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.44,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.blue, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          InstaImageViewer(
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: CachedNetworkImageProvider(
                          product.image),
                      fit: BoxFit.cover)),
            ),
          ),
          Text(
            product.title,
            style: const TextStyle(fontSize: 12),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.violet),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              '${product.price}',
              style: const TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
