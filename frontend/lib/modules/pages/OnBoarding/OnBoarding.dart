import 'package:flutter/material.dart';
import 'package:frontend/NavigationMenu.dart';
import 'package:get/get.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  // Controller untuk PageView
  final PageController pageController = PageController();

  // Menyimpan index halaman aktif
  int currentPage = 0;

  // Function next page
  void nextPage() {
    if (currentPage < demoData.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else {
      // TODO:
      // Pindah ke halaman login/home
      Get.offAll(() => NavigationMenu());
      print("Onboarding selesai");
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            // =========================
            // PAGE VIEW
            // =========================
            Expanded(
              flex: 12,
              child: PageView.builder(
                controller: pageController,
                itemCount: demoData.length,

                onPageChanged: (value) {
                  setState(() {
                    currentPage = value;
                  });
                },

                itemBuilder: (context, index) {
                  return OnboardContent(
                    illustration: demoData[index]["illustration"],
                    title: demoData[index]["title"],
                    text: demoData[index]["text"],
                  );
                },
              ),
            ),

            const SizedBox(height: 20),

            // =========================
            // DOT INDICATOR
            // =========================
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                demoData.length,
                (index) => DotIndicator(isActive: index == currentPage),
              ),
            ),

            const Spacer(),

            // =========================
            // BUTTON
            // =========================
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: nextPage,

                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF22A45D),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 55),

                  elevation: 0,

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),

                child: Text(
                  currentPage == demoData.length - 1 ? "GET STARTED" : "NEXT",
                ),
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// =======================================================
// ONBOARD CONTENT
// =======================================================

class OnboardContent extends StatelessWidget {
  const OnboardContent({
    super.key,
    required this.illustration,
    required this.title,
    required this.text,
  });

  final String illustration;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),

      child: Column(
        children: [
          Expanded(child: Image.network(illustration, fit: BoxFit.contain)),

          const SizedBox(height: 24),

          Text(
            title,
            style: Theme.of(
              context,
            ).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 12),

          Text(
            text,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: Colors.black54,
              height: 1.5,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

// =======================================================
// DOT INDICATOR
// =======================================================

class DotIndicator extends StatelessWidget {
  const DotIndicator({super.key, required this.isActive});

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),

      margin: const EdgeInsets.symmetric(horizontal: 4),

      height: 8,

      width: isActive ? 24 : 8,

      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF22A45D) : Colors.grey.shade300,

        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}

// =======================================================
// DATA
// =======================================================

List<Map<String, dynamic>> demoData = [
  {
    "illustration":
        "https://images.unsplash.com/photo-1504674900247-0877df9cc836",

    "title": "All your favorites",

    "text":
        "Order from the best local restaurants with easy, on-demand delivery.",
  },

  {
    "illustration":
        "https://images.unsplash.com/photo-1522202176988-66273c2fd55f",

    "title": "Free delivery offers",

    "text":
        "Free delivery for new customers via Apple Pay and other payment methods.",
  },

  {
    "illustration":
        "https://images.unsplash.com/photo-1498837167922-ddd27525d352",

    "title": "Choose your food",

    "text": "Find your favorite food easily and get fast delivery anytime.",
  },
];
