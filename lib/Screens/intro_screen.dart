import 'package:flutter/material.dart';
import 'package:do_it/Constants/app_colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:do_it/Screens/Auth/login.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_IntroData> _pages = const [
    _IntroData(
      title: 'Stay Organized.',
      description:
          'Keep all your tasks in one place and stay organized every day.',
    ),
    _IntroData(
      title: 'Focus on What Matters',
      description:
          'Keep all your tasks in one place and stay organized every day.',
    ),
    _IntroData(
      title: 'Get Things Done',
      description: 'Turn your plans into achievements.',
    ),
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(seconds: 1),
        curve: Curves.easeInOutCubic,
      );
    } else {
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const LogIn()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: _pageController,
          builder: (context, child) {
            final page = _pageController.hasClients
                ? (_pageController.page ?? _currentPage.toDouble())
                : _currentPage.toDouble();

            return Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(painter: _RibbonPainter(page: page)),
                ),
                PageView.builder(
                  controller: _pageController,
                  itemCount: _pages.length,
                  onPageChanged: (index) {
                    setState(() => _currentPage = index);
                  },
                  itemBuilder: (context, index) {
                    final data = _pages[index];

                    return Column(
                      children: [
                        const Spacer(flex: 14),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                right: index == 0 ? 90 : 60,
                                left: index == 2 ? 90 : 60,
                              ),
                              child: Text(
                                data.title,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: index == 1 ? 27 : 23,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                  ).fontFamily,
                                  shadows: index != 1
                                      ? []
                                      : [
                                          BoxShadow(
                                            color: AppColor.lightGrey
                                                .withOpacity(.70),
                                            blurRadius: 4,
                                            offset: Offset(0, 4),
                                          ),
                                        ],
                                  color: index == 1
                                      ? AppColor.primaryColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: index == 1 ? 80 : 130),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40),
                              child: Text(
                                data.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 16,
                                  height: 1.5,
                                  fontFamily: GoogleFonts.poppins().fontFamily,
                                  color: AppColor.textColor,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const Spacer(flex: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            3,
                            (dotIndex) => AnimatedContainer(
                              duration: const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(horizontal: 4),
                              width: _currentPage == dotIndex ? 24 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == dotIndex
                                    ? const Color(0xFF173B6B)
                                    : const Color(0xFF9BAFC1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 28),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(
                                    context,
                                  ).pushReplacement(MaterialPageRoute(builder: (_) => const LogIn()));
                                },
                                child: Text(
                                  'Skip',
                                  style: TextStyle(
                                    color: AppColor.lightGrey,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                    ).fontFamily,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: _nextPage,
                                // style: ElevatedButton.styleFrom(
                                //   backgroundColor: const Color(0xFF173B6B),
                                //   foregroundColor: Colors.white,
                                //   padding: const EdgeInsets.symmetric(
                                //     horizontal: 32,
                                //     vertical: 14,
                                //   ),
                                //   shape: RoundedRectangleBorder(
                                //     borderRadius: BorderRadius.circular(30),
                                //   ),
                                // ),
                                child: Text(
                                  _currentPage == 2 ? 'Start' : 'Next',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: GoogleFonts.cairo(
                                      fontWeight: FontWeight.bold,
                                    ).fontFamily,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _IntroData {
  final String title;
  final String description;

  const _IntroData({required this.title, required this.description});
}

class _RibbonPainter extends CustomPainter {
  final double page;

  const _RibbonPainter({required this.page});

  @override
  void paint(Canvas canvas, Size size) {
    final screenWidth = size.width;
    final screenHeight = size.height;
    final totalWidth = screenWidth * 3;

    canvas.save();
    canvas.translate(-page * screenWidth, 0);

    final path = Path()
      ..moveTo(screenWidth * 0.45, screenHeight * 0.47)
      ..cubicTo(
        screenWidth * 0.85,
        screenHeight * 0.1,
        screenWidth * 2.30,
        screenHeight * 0.12,
        totalWidth - screenWidth * 0.45,
        screenHeight * 0.47,
      );

    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = screenHeight * 0.30
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          Color(0xFF63BBA5),
          Color(0xFF36B3B5),
          Color(0xFF5199AD),
          Color(0xFF1C3B69),
        ],
        stops: [0.40, 0.50, 0.60, 0.80],
      ).createShader(Rect.fromLTWH(0, 0, totalWidth, screenHeight));

    final shadowPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = screenHeight * 0.40
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 22)
      ..color = const Color(0xFF36B3B5).withValues(alpha: 0.25);

    canvas.drawPath(path.shift(const Offset(0, 8)), shadowPaint);

    canvas.drawPath(path, paint);

    canvas.restore();
  }

  @override
  bool shouldRepaint(covariant _RibbonPainter oldDelegate) {
    return oldDelegate.page != page;
  }
}
