import 'package:demo_app/model/category_reponse.dart';
import 'package:demo_app/service/api.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  bool isLoading = true;
  CategoryResponse? response;
  @override
  void initState() {
    apiCall();
    super.initState();
  }

  apiCall() async {
    var json = await sendRequest('get_categories');
    if (json != null) {
      response = CategoryResponse.fromJson(json);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          'Health Care',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
        ),
        elevation: 2,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          Stack(
            children: [
              if (!isLoading)
                Positioned(
                  right: 5,
                  top: 5,
                  child: Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: Text(
                      response!.data!.favouriteCount.toString(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              IconButton(onPressed: () {}, icon: const Icon(Icons.favorite)),
            ],
          ),
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : response == null
              ? const Center(child: Text('Error : Please Retry'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(response!.data!.image!),
                      const SizedBox(
                        height: 20,
                      ),
                      GridView.builder(
                        itemCount: response!.data!.category!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                childAspectRatio: 0.8,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Card(
                                child: Image.network(
                                    response!.data!.category![index].image!),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                response!.data!.category![index].title!,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w300),
                              )
                            ],
                          );
                        },
                      ),
                      const Divider(),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.grey[200]),
                        child: GridView.builder(
                            itemCount: response!.data!.products!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    mainAxisSpacing: 1,
                                    crossAxisSpacing: 1,
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.7),
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                decoration:
                                    const BoxDecoration(color: Colors.white),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(response!
                                                .data!.products![index].uom!),
                                          ],
                                        ),
                                        // if (response!.data!.products![index]
                                        //         .discount !=
                                        //     '')
                                        CustomPaint(
                                            painter: Chevron(),
                                            child: SizedBox(
                                              width: 80.0,
                                              height: 25.0,
                                              child: Align(
                                                  alignment: Alignment.center,
                                                  child: RichText(
                                                    text: TextSpan(children: [
                                                      TextSpan(
                                                          text: response!
                                                              .data!
                                                              .products![index]
                                                              .discount,
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize:
                                                                      12)),
                                                      const TextSpan(
                                                          text: " Discount",
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 8)),
                                                    ]),
                                                  )),
                                            )),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 100,
                                      child: Image.network(response!
                                          .data!.products![index].image!),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(5),
                                      child: Text(
                                        response!.data!.products![index].title!,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "₹ " +
                                              response!.data!.products![index]
                                                  .splPrice!
                                                  .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          response!
                                              .data!.products![index].price!
                                              .toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                              decoration:
                                                  TextDecoration.lineThrough),
                                        ),
                                      ],
                                    ),
                                    TextButton(
                                        onPressed: () {},
                                        child: Material(
                                          elevation: 2,
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 15, vertical: 5),
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Text(
                                              'Add to cart',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            ),
                                          ),
                                        )),
                                    Container()
                                  ],
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                ),
    );
  }
}

class Chevron extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [Colors.red, Colors.red],
      tileMode: TileMode.clamp,
    );

    final Rect colorBounds = Rect.fromLTRB(0, 0, size.width, size.height);
    final Paint paint = Paint()..shader = gradient.createShader(colorBounds);

    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(
      size.width / 10,
      size.height / 2,
    );

    path.lineTo(
      0,
      size.height,
    );
    path.lineTo(
      size.width,
      size.height,
    );
    path.lineTo(size.width, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
