import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Iconsax.shopping_cart,
              color: Colors.green,
              fontWeight: FontWeight.w600,
              size: 47,
            ),
            SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: 'e',
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                          height: 1,
                        ),
                      ),
                      TextSpan(
                        text: 'Shop',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          height: 1,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "your daily needs",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.search, color: Colors.black, size: 30),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              SizedBox(height: 10),
              Banners(),
              Column(
                children: [
                  ProductsTitle(title: "Popular Packs"),
                  Container(
                    height: 220,
                    decoration: BoxDecoration(),
                    child: ListView.separated(
                      separatorBuilder: (context, index) => SizedBox(width: 20),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * 0.38,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 3),
                                blurRadius: 3,
                              ),
                            ],
                          ),
                          child: Column(children: [Stack(children: [Image.asset("")])]),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: Colors.green),
              accountName: const Text("Naufal"),
              accountEmail: const Text("naufal@gmail.com"),
              currentAccountPicture: const CircleAvatar(
                child: Icon(Icons.person),
              ),
            ),

            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  DrawerItem(title: "Invite Friend", onTap: () {}),

                  DrawerItem(title: "About Us", onTap: () {}),

                  DrawerItem(title: "FAQs", onTap: () {}),

                  DrawerItem(title: "Terms & Conditions", onTap: () {}),

                  DrawerItem(title: "Help Center", onTap: () {}),

                  DrawerItem(title: "Rate This App", onTap: () {}),

                  DrawerItem(title: "Privacy Policy", onTap: () {}),

                  DrawerItem(title: "Contact Us", onTap: () {}),

                  const SizedBox(height: 30),

                  DrawerItem(title: "Logout", onTap: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProductsTitle extends StatelessWidget {
  const ProductsTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextTheme.of(context).bodyLarge!.copyWith(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        TextButton(
          onPressed: () {},
          style: ButtonStyle(
            overlayColor: WidgetStatePropertyAll(Colors.transparent),
          ),
          child: Text(
            "View All",
            style: TextTheme.of(context).bodySmall!.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}

class Banners extends StatelessWidget {
  const Banners({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(10),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
        child: Image.asset(
          "assets/image/banners/banner1.png",
          fit: BoxFit.fill,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({super.key, required this.title, this.onTap});

  final String title;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        hoverColor: Colors.grey.shade200,
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),

              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
