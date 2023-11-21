import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int items = 2;
  List<Map> item_types = [
    {
      "Name": "Nike Air Zoom 38",
      "Color": "Black",
      "Quantity": "1",
      "Size": "41",
      "price": 159,
      "pic":
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/e2ff01fa-7e97-4536-b4f8-a9f21992cba3/pegasus-38-road-running-shoes-5HVSDm.png"
    },
    {
      "Name": "Nike Zoom fly 5",
      "Color": "Green",
      "Quantity": "1",
      "Size": "41",
      "price": 234,
      "pic":
          "https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/f04c7808-4b70-431a-8fc1-ba7e8cb18aae/zoom-fly-5-eliud-kipchoge-mens-road-racing-shoes-jGsdSl.png"
    }
  ];
  double subtotal = 0;

  List<String> getAmount() {
    for (int i = 0; i < items; i++) {
      subtotal += item_types[i]["price"];
    }
    double tax = subtotal * .15;
    return [subtotal.toString(), tax.toString(), (subtotal + tax).toString()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(
                top: 15.0,
              ),
              color: Colors.grey[200],
              height: MediaQuery.of(context).size.height * .13,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Icon(Icons.check_circle_sharp),
                      Text(" Your order is confirmed!"),
                    ],
                  ),
                  Directionality(
                    textDirection: TextDirection.rtl,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      label: Text("Save"),
                      icon: Icon(Icons.save_alt),
                    ),
                  ),
                ],
              ),
            ),
            Card(
              margin: EdgeInsets.all(MediaQuery.of(context).size.height * .03),
              color: Colors.white,
              child: Column(
                children: [
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Order Number"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    trailing: Text("234SDEW"),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Order Date"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    trailing: Text("13 Nov 2023"),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Shipping Address"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    trailing: Text("22 Megenagna, Addis Ababa"),
                  ),
                  ListTile(
                    title: Text("Payment Method"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    trailing: Image.network(
                        "https://www.ethiotelecom.et/wp-content/uploads/2021/04/TeleBirr-Logo.png"),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 0.0),
              child: Text(
                "Items (${items})",
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * .028,
                  fontWeight: FontWeight.w900,
                ),
              ),
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * .05,
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: items,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: Image.network(item_types[index]["pic"]),
                    title: Text(
                      item_types[index]["Name"],
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    titleAlignment: ListTileTitleAlignment.top,
                    trailing: RichText(
                      text: TextSpan(
                        text: item_types[index]["price"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.w900, color: Colors.black),
                        children: [
                          TextSpan(
                              text: " ETB",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal)),
                          TextSpan(
                              text: "/Pcs",
                              style: TextStyle(color: Colors.grey)),
                        ],
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Color: ${item_types[index]["Color"]}"),
                        Text("Quantity: ${item_types[index]["Quantity"]}"),
                        Text("Size: ${item_types[index]["Size"]}"),
                      ],
                    ),
                  );
                }),
            Container(
              width: MediaQuery.of(context).size.width * .6, 
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Subtotal"),
                    trailing: Text("14 ETB"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Tax(15%)"),
                    trailing: Text("12 ETB"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Discount"),
                    trailing: Text("0 ETB"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -4),
                    title: Text("Shipping Fee"),
                    trailing: Text("10 ETB"),
                    titleTextStyle: TextStyle(
                      color: Colors.grey,
                    ),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  ListTile(
                    visualDensity: VisualDensity(vertical: -3),
                    title: Text("Total"),
                    trailing: Text("234 ETB"),
                    titleTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                    leadingAndTrailingTextStyle: TextStyle(
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
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
