import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const SafeSpendApp());
}

// ============================================================
// SAFE SPEND AI APP
// ============================================================

class SafeSpendApp extends StatelessWidget {
  const SafeSpendApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SafeSpend AI',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3157D5),
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7FB),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 17,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Color(0xFF3157D5),
              width: 1.5,
            ),
          ),
        ),
        navigationBarTheme: const NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: Color(0xFFE8EDFF),
          elevation: 8,
          labelTextStyle: WidgetStatePropertyAll(
            TextStyle(fontWeight: FontWeight.w600, fontSize: 12),
          ),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}


// ============================================================
// SAFE SPEND BRANDING
// ============================================================

class SafeSpendLogo extends StatelessWidget {
  final double size;
  final bool showWordmark;

  const SafeSpendLogo({
    super.key,
    this.size = 72,
    this.showWordmark = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size * 0.28),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF496BFF),
                Color(0xFF203A9B),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Color(0x332E4CC5),
                blurRadius: 22,
                offset: Offset(0, 10),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Icon(
                Icons.shield_rounded,
                size: size * 0.72,
                color: Colors.white,
              ),
              Container(
                width: size * 0.36,
                height: size * 0.36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xFFE9B949),
                  border: Border.all(
                    color: Colors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  Icons.currency_rupee_rounded,
                  size: size * 0.20,
                  color: Color(0xFF24346E),
                ),
              ),
              Positioned(
                right: size * 0.15,
                bottom: size * 0.16,
                child: Container(
                  width: size * 0.20,
                  height: size * 0.20,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF39C98A),
                  ),
                  child: Icon(
                    Icons.check_rounded,
                    size: size * 0.14,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        if (showWordmark) ...[
          const SizedBox(height: 16),
          const Text(
            'SafeSpend',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: Color(0xFF18234A),
            ),
          ),
          const Text(
            'AI',
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w800,
              letterSpacing: 4,
              color: Color(0xFF3157D5),
            ),
          ),
        ],
      ],
    );
  }
}

// ============================================================
// DUMMY LOGIN
// ============================================================

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;

  void enterApp() {
    setState(() => loading = true);

    Future.delayed(const Duration(milliseconds: 450), () {
      if (!mounted) return;

      Navigator.of(context).pushReplacement(
        PageRouteBuilder(
          pageBuilder: (_, __, ___) => const MainNavigation(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 350),
        ),
      );
    });
  }

  void continueAsGuest() {
    Navigator.of(context).pushReplacement(
      PageRouteBuilder(
        pageBuilder: (_, __, ___) => const MainNavigation(),
        transitionsBuilder: (_, animation, __, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 350),
      ),
    );
  }

  Widget demoInput({
    required IconData icon,
    required String label,
    required String value,
    bool masked = false,
  }) {
    return Container(
      height: 68,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F8FC),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFE6E9F2),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFFEAF0FF),
              borderRadius: BorderRadius.circular(11),
            ),
            child: Icon(
              icon,
              size: 20,
              color: const Color(0xFF3157D5),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF7A8298),
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  masked ? '••••••••' : value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF18234A),
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle_rounded,
            size: 19,
            color: Color(0xFF39C98A),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -110,
            right: -80,
            child: Container(
              width: 280,
              height: 280,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF3157D5).withValues(alpha: 0.09),
              ),
            ),
          ),
          Positioned(
            bottom: -140,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF39C98A).withValues(alpha: 0.08),
              ),
            ),
          ),
          SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(26, 24, 26, 22),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 430),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SafeSpendLogo(size: 82),

                      const SizedBox(height: 26),

                      const Text(
                        'Your money, understood.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w800,
                          letterSpacing: -0.5,
                          color: Color(0xFF18234A),
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'AI-powered financial health, made simple.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey.shade500,
                          height: 1.45,
                        ),
                      ),

                      const SizedBox(height: 28),

                      Container(
                        padding: const EdgeInsets.all(22),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(26),
                          boxShadow: const [
                            BoxShadow(
                              color: Color(0x120E1A40),
                              blurRadius: 30,
                              offset: Offset(0, 14),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const Text(
                              'Welcome back',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF18234A),
                              ),
                            ),

                            const SizedBox(height: 5),

                            Text(
                              'Your secure financial companion is ready.',
                              style: TextStyle(
                                color: Colors.blueGrey.shade400,
                                fontSize: 13,
                              ),
                            ),

                            const SizedBox(height: 20),

                            demoInput(
                              icon: Icons.mail_outline_rounded,
                              label: 'EMAIL',
                              value: 'demo@safespend.ai',
                            ),

                            const SizedBox(height: 12),

                            demoInput(
                              icon: Icons.lock_outline_rounded,
                              label: 'PASSWORD',
                              value: 'SafeSpend2026',
                              masked: true,
                            ),

                            const SizedBox(height: 20),

                            SizedBox(
                              height: 54,
                              child: ElevatedButton(
                                onPressed: loading ? null : enterApp,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF3157D5),
                                  foregroundColor: Colors.white,
                                  elevation: 0,
                                  disabledBackgroundColor:
                                      const Color(0xFF3157D5),
                                  disabledForegroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                child: loading
                                    ? const SizedBox(
                                        width: 21,
                                        height: 21,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2.5,
                                          color: Colors.white,
                                        ),
                                      )
                                    : const Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Enter SafeSpend',
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                          SizedBox(width: 8),
                                          Icon(
                                            Icons.arrow_forward_rounded,
                                          ),
                                        ],
                                      ),
                              ),
                            ),

                            const SizedBox(height: 12),

                            OutlinedButton(
                              onPressed: continueAsGuest,
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF3157D5),
                                side: const BorderSide(
                                  color: Color(0xFFDCE3FA),
                                ),
                                minimumSize: const Size.fromHeight(52),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(16),
                                ),
                              ),
                              child: const Text(
                                'Continue as Guest',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 18),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.verified_user_outlined,
                            size: 15,
                            color: Colors.blueGrey.shade400,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            'Demo login • No real account required',
                            style: TextStyle(
                              color: Colors.blueGrey.shade400,
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// MAIN NAVIGATION
// ============================================================

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int selectedIndex = 0;

  Map<String, dynamic>? latestResult;

  void openResult(Map<String, dynamic> result) {
    setState(() {
      latestResult = result;
      selectedIndex = 1;
    });
  }

  void openAssessment() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => AssessmentScreen(
          onResult: openResult,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screens = [
      DashboardScreen(
        result: latestResult,
        onAnalyze: openAssessment,
      ),
      ResultScreen(
        result: latestResult,
        onAnalyze: openAssessment,
      ),
      InsightsScreen(
        result: latestResult,
      ),
      const ProfileScreen(),
    ];

    return Scaffold(
      body: screens[selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        height: 72,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.analytics_outlined),
            selectedIcon: Icon(Icons.analytics),
            label: 'Analysis',
          ),
          NavigationDestination(
            icon: Icon(Icons.lightbulb_outline),
            selectedIcon: Icon(Icons.lightbulb),
            label: 'Insights',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

// ============================================================
// DASHBOARD
// ============================================================

class DashboardScreen extends StatelessWidget {
  final Map<String, dynamic>? result;
  final VoidCallback onAnalyze;

  const DashboardScreen({
    super.key,
    required this.result,
    required this.onAnalyze,
  });

  // ==========================================================
  // FORMAT NUMBER
  // ==========================================================

  String formatNumber(dynamic value) {
    final number = double.tryParse(value.toString());

    if (number == null) {
      return value.toString();
    }

    if (number == number.roundToDouble()) {
      return number.toInt().toString();
    }

    return number.toStringAsFixed(1);
  }

  // ==========================================================
  // GET METRIC
  // ==========================================================

  String metric(String key) {
    final data = result;

    if (data == null) {
      return '--';
    }

    if (data[key] != null) {
      return formatNumber(data[key]);
    }

    final metrics = data['financial_metrics'];

    if (metrics is Map && metrics[key] != null) {
      return formatNumber(metrics[key]);
    }

    return '--';
  }

  // ==========================================================
  // FIRST AI INSIGHT
  // ==========================================================

  String firstInsight() {
    if (result == null) {
      return 'Complete your assessment to receive personalized financial insights.';
    }

    final insights = result!['insights'];

    if (insights is List && insights.isNotEmpty) {
      return insights.first.toString();
    }

    return 'Your financial health has been analyzed successfully.';
  }

  // ==========================================================
  // GET RISK
  // ==========================================================

  String getRisk() {
    if (result == null) {
      return 'Not analyzed';
    }

    return result!['risk_level']?.toString() ??
        result!['prediction']?.toString() ??
        'Unknown';
  }

  // ==========================================================
  // RISK COLOR
  // ==========================================================

  Color getRiskColor(String risk) {
    final value = risk.toLowerCase();

    if (value.contains('high') ||
        value.contains('risk') ||
        value.contains('poor') ||
        value.contains('critical')) {
      return Colors.red;
    }

    if (value.contains('moderate') ||
        value.contains('medium') ||
        value.contains('average')) {
      return Colors.orange;
    }

    if (value.contains('low') ||
        value.contains('healthy') ||
        value.contains('good')) {
      return Colors.green;
    }

    return Colors.white;
  }

  // ==========================================================
  // SCORE
  // ==========================================================

  double getScore() {
    if (result == null) {
      return 0;
    }

    return double.tryParse(
          result!['financial_health_score']?.toString() ?? '0',
        ) ??
        0;
  }

  @override
  Widget build(BuildContext context) {
    final score = getScore();
    final risk = getRisk();
    final riskColor = getRiskColor(risk);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Row(
          children: [
            SafeSpendLogo(size: 38, showWordmark: false),
            SizedBox(width: 11),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'SafeSpend AI',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 20,
                    color: Color(0xFF18234A),
                  ),
                ),
                Text(
                  'Your intelligent financial companion',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.blueGrey,
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good evening 👋',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.6,
                color: Color(0xFF18234A),
              ),
            ),

            const SizedBox(height: 6),

            const Text(
              'Understand your money. Improve your future.',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 24),

            // ==================================================
            // SCORE CARD
            // ==================================================

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Color(0xFF2563EB),
                    Color(0xFF1D4ED8),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(28),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26315BD5),
                    blurRadius: 24,
                    offset: Offset(0, 12),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'AI Financial Health',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.18),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          'AI POWERED',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 18),

                  Text(
                    result == null
                        ? '--'
                        : score.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 58,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    result == null
                        ? 'Complete your assessment'
                        : '$risk financial position',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),

                  const SizedBox(height: 14),

                  if (result != null)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 7,
                      ),
                      decoration: BoxDecoration(
                        color: riskColor == Colors.white
                            ? Colors.white.withValues(alpha: 0.18)
                            : riskColor.withValues(alpha: 0.18),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        risk.toUpperCase(),
                        style: TextStyle(
                          color: riskColor == Colors.white
                              ? Colors.white
                              : Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),

                  const SizedBox(height: 20),

                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: LinearProgressIndicator(
                      value: result == null
                          ? 0
                          : (score.clamp(0, 100)) / 100,
                      minHeight: 8,
                      backgroundColor: Colors.white24,
                      valueColor:
                          const AlwaysStoppedAnimation<Color>(
                        Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 26),

            // ==================================================
            // FINANCIAL JOURNEY
            // ==================================================

            const Text(
              'Your Financial Journey',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            Row(
              children: [
                Expanded(
                  child: _overviewCard(
                    Icons.account_balance_wallet_outlined,
                    'Income',
                    result == null
                        ? '₹--'
                        : '₹${metric('monthly_income')}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _overviewCard(
                    Icons.shopping_cart_outlined,
                    'Expenses',
                    result == null
                        ? '₹--'
                        : '₹${metric('total_expenses')}',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _overviewCard(
                    Icons.savings_outlined,
                    'Savings',
                    result == null
                        ? '₹--'
                        : '₹${metric('monthly_savings')}',
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _overviewCard(
                    Icons.credit_card_outlined,
                    'Debt',
                    result == null
                        ? '₹--'
                        : '₹${metric('loan_payment')}',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 28),

            // ==================================================
            // AI INSIGHTS
            // ==================================================

            const Text(
              'AI Insights',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 14),

            if (result == null)
              _insightCard(
                Icons.auto_awesome,
                'Get your AI financial score',
                'Complete the assessment to receive personalized financial insights.',
              )
            else
              _insightCard(
                Icons.auto_awesome,
                'AI Insight',
                firstInsight(),
              ),

            const SizedBox(height: 24),

            // ==================================================
            // BUTTON
            // ==================================================

            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton.icon(
                onPressed: onAnalyze,
                icon: const Icon(Icons.auto_awesome),
                label: Text(
                  result == null
                      ? 'Analyze My Financial Health'
                      : 'Update Financial Analysis',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3157D5),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(17),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _overviewCard(
    IconData icon,
    String title,
    String value,
  ) {
    return Container(
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: const Color(0xFF2563EB),
            size: 26,
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  static Widget _insightCard(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEFF6FF),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: const Color(0xFF2563EB),
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 13,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// ASSESSMENT SCREEN
// ============================================================

class AssessmentScreen extends StatefulWidget {
  final Function(Map<String, dynamic>) onResult;

  const AssessmentScreen({
    super.key,
    required this.onResult,
  });

  @override
  State<AssessmentScreen> createState() =>
      _AssessmentScreenState();
}

class _AssessmentScreenState
    extends State<AssessmentScreen> {
  final formKey = GlobalKey<FormState>();

  final ageController =
      TextEditingController(text: '20');

  final incomeController =
      TextEditingController();

  final dependentsController =
      TextEditingController(text: '0');

  final rentController =
      TextEditingController(text: '0');

  final loanController =
      TextEditingController(text: '0');

  final insuranceController =
      TextEditingController(text: '0');

  final groceriesController =
      TextEditingController(text: '0');

  final transportController =
      TextEditingController(text: '0');

  final eatingOutController =
      TextEditingController(text: '0');

  final entertainmentController =
      TextEditingController(text: '0');

  final utilitiesController =
      TextEditingController(text: '0');

  final healthcareController =
      TextEditingController(text: '0');

  final educationController =
      TextEditingController(text: '0');

  final otherController =
      TextEditingController(text: '0');

  final savingsGoalController =
      TextEditingController(text: '0');

  String occupation = 'Student';
  String cityTier = 'Tier 1';

  bool loading = false;

  @override
  void dispose() {
    ageController.dispose();
    incomeController.dispose();
    dependentsController.dispose();
    rentController.dispose();
    loanController.dispose();
    insuranceController.dispose();
    groceriesController.dispose();
    transportController.dispose();
    eatingOutController.dispose();
    entertainmentController.dispose();
    utilitiesController.dispose();
    healthcareController.dispose();
    educationController.dispose();
    otherController.dispose();
    savingsGoalController.dispose();

    super.dispose();
  }

  double number(TextEditingController controller) {
    return double.tryParse(controller.text) ?? 0;
  }

  Future<void> analyze() async {
    if (!formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      loading = true;
    });

    final data = {
      'age': int.tryParse(ageController.text) ?? 20,
      'monthly_income': number(incomeController),
      'occupation': occupation,
      'city_tier': cityTier,
      'dependents':
          int.tryParse(dependentsController.text) ?? 0,
      'rent': number(rentController),
      'loan_payment': number(loanController),
      'insurance': number(insuranceController),
      'groceries': number(groceriesController),
      'transport': number(transportController),
      'eating_out': number(eatingOutController),
      'entertainment': number(entertainmentController),
      'utilities': number(utilitiesController),
      'healthcare': number(healthcareController),
      'education': number(educationController),
      'other_expenses': number(otherController),

      // FastAPI expects savings_goal as STRING.
      'savings_goal':
          savingsGoalController.text.trim(),
    };

    try {
      debugPrint(
        'Sending SafeSpend request: ${jsonEncode(data)}',
      );

      final response =
          await SafeSpendApi.predict(data);

      debugPrint(
        'SafeSpend response: ${jsonEncode(response)}',
      );

      if (!mounted) return;

      setState(() {
        loading = false;
      });

      widget.onResult(response);

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      setState(() {
        loading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'SafeSpend AI error:\n$e',
          ),
          duration: const Duration(seconds: 8),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Financial Assessment',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF18234A),
          ),
        ),
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Center(
              child: SafeSpendLogo(size: 54, showWordmark: false),
            ),
            const SizedBox(height: 18),
            const Text(
              'Tell us about your finances',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Our AI will analyze your financial habits and generate a personalized health score.',
              style: TextStyle(
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 28),

            _sectionTitle('Personal Information'),

            _numberField(
              ageController,
              'Age',
              Icons.person_outline,
              required: true,
            ),

            _dropdown(
              label: 'Occupation',
              value: occupation,
              items: const [
                'Student',
                'Employed',
                'Self Employed',
                'Business',
                'Other',
              ],
              onChanged: (value) {
                setState(() {
                  occupation = value!;
                });
              },
            ),

            _dropdown(
              label: 'City Tier',
              value: cityTier,
              items: const [
                'Tier 1',
                'Tier 2',
                'Tier 3',
              ],
              onChanged: (value) {
                setState(() {
                  cityTier = value!;
                });
              },
            ),

            _numberField(
              dependentsController,
              'Number of Dependents',
              Icons.family_restroom,
            ),

            const SizedBox(height: 20),

            _sectionTitle('Income'),

            _numberField(
              incomeController,
              'Monthly Income (₹)',
              Icons.currency_rupee,
              required: true,
            ),

            const SizedBox(height: 20),

            _sectionTitle('Monthly Expenses'),

            _numberField(
              rentController,
              'Rent / Housing (₹)',
              Icons.home_outlined,
            ),

            _numberField(
              loanController,
              'Loan Payment (₹)',
              Icons.credit_card_outlined,
            ),

            _numberField(
              insuranceController,
              'Insurance (₹)',
              Icons.security_outlined,
            ),

            _numberField(
              groceriesController,
              'Groceries (₹)',
              Icons.shopping_cart_outlined,
            ),

            _numberField(
              transportController,
              'Transport (₹)',
              Icons.directions_bus_outlined,
            ),

            _numberField(
              eatingOutController,
              'Eating Out (₹)',
              Icons.restaurant_outlined,
            ),

            _numberField(
              entertainmentController,
              'Entertainment (₹)',
              Icons.movie_outlined,
            ),

            _numberField(
              utilitiesController,
              'Utilities (₹)',
              Icons.bolt_outlined,
            ),

            _numberField(
              healthcareController,
              'Healthcare (₹)',
              Icons.health_and_safety_outlined,
            ),

            _numberField(
              educationController,
              'Education (₹)',
              Icons.school_outlined,
            ),

            _numberField(
              otherController,
              'Other Expenses (₹)',
              Icons.more_horiz,
            ),

            const SizedBox(height: 20),

            _sectionTitle('Savings Goal'),

            _numberField(
              savingsGoalController,
              'Monthly Savings Goal (₹)',
              Icons.savings_outlined,
            ),

            const SizedBox(height: 30),

            SizedBox(
              height: 58,
              child: ElevatedButton.icon(
                onPressed:
                    loading ? null : analyze,
                icon: loading
                    ? const SizedBox(
                        width: 20,
                        height: 20,
                        child:
                            CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : const Icon(
                        Icons.auto_awesome,
                      ),
                label: Text(
                  loading
                      ? 'Analyzing...'
                      : 'Analyze My Financial Health',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF3157D5),
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(16),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 12),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _numberField(
    TextEditingController controller,
    String label,
    IconData icon, {
    bool required = false,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 12),
      child: TextFormField(
        controller: controller,
        keyboardType:
            const TextInputType.numberWithOptions(
          decimal: true,
        ),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        validator: required
            ? (value) {
                if (value == null ||
                    value.trim().isEmpty) {
                  return 'This field is required';
                }

                if (double.tryParse(value) ==
                    null) {
                  return 'Enter a valid number';
                }

                if (label.contains('Income') &&
                    double.parse(value) <= 0) {
                  return 'Income must be greater than 0';
                }

                return null;
              }
            : null,
      ),
    );
  }

  Widget _dropdown({
    required String label,
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Padding(
      padding:
          const EdgeInsets.only(bottom: 12),
      child: DropdownButtonFormField<String>(
        initialValue: value,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon:
              const Icon(Icons.list_alt_outlined),
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(15),
            borderSide: BorderSide.none,
          ),
        ),
        items: items
            .map(
              (item) =>
                  DropdownMenuItem<String>(
                value: item,
                child: Text(item),
              ),
            )
            .toList(),
        onChanged: onChanged,
      ),
    );
  }
}

// ============================================================
// RESULT SCREEN
// ============================================================

class ResultScreen extends StatelessWidget {
  final Map<String, dynamic>? result;
  final VoidCallback onAnalyze;

  const ResultScreen({
    super.key,
    required this.result,
    required this.onAnalyze,
  });

  String getMetric(
    String key, {
    String? fallback,
  }) {
    final data = result;

    if (data == null) {
      return '--';
    }

    if (data[key] != null) {
      return formatNumber(data[key]);
    }

    final metrics = data['financial_metrics'];

    if (metrics is Map) {
      if (metrics[key] != null) {
        return formatNumber(metrics[key]);
      }

      if (fallback != null &&
          metrics[fallback] != null) {
        return formatNumber(metrics[fallback]);
      }
    }

    return '--';
  }

  String formatNumber(dynamic value) {
    final number =
        double.tryParse(value.toString());

    if (number == null) {
      return value.toString();
    }

    if (number == number.roundToDouble()) {
      return number.toInt().toString();
    }

    return number.toStringAsFixed(1);
  }

  Color riskColor(String risk) {
    final value = risk.toLowerCase();

    if (value.contains('high') ||
        value.contains('risk') ||
        value.contains('poor') ||
        value.contains('critical')) {
      return Colors.red;
    }

    if (value.contains('moderate') ||
        value.contains('medium') ||
        value.contains('average')) {
      return Colors.orange;
    }

    if (value.contains('low') ||
        value.contains('healthy') ||
        value.contains('good')) {
      return Colors.green;
    }

    return const Color(0xFF2563EB);
  }

  @override
  Widget build(BuildContext context) {
    if (result == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('AI Analysis'),
        ),
        body: Center(
          child: Padding(
            padding:
                const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.analytics_outlined,
                  size: 80,
                  color: Color(0xFF2563EB),
                ),

                const SizedBox(height: 20),

                const Text(
                  'No analysis yet',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 10),

                const Text(
                  'Complete your financial assessment to receive your AI-powered financial health score.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),

                const SizedBox(height: 25),

                ElevatedButton(
                  onPressed: onAnalyze,
                  child: const Text(
                    'Start Assessment',
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    final data = result!;

    final score = double.tryParse(
          data['financial_health_score']
                  ?.toString() ??
              '0',
        ) ??
        0;

    final risk =
        data['risk_level']?.toString() ??
        data['prediction']?.toString() ??
        'Unknown';

    final confidence =
        double.tryParse(
              data['confidence']?.toString() ??
                  '0',
            ) ??
            0;

    final color = riskColor(risk);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Analysis',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: Color(0xFF18234A),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding:
            const EdgeInsets.all(20),
        child: Column(
          children: [
            // ==================================================
            // SCORE
            // ==================================================

            Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.all(28),
              decoration: BoxDecoration(
                gradient:
                    const LinearGradient(
                  colors: [
                    Color(0xFF2563EB),
                    Color(0xFF1D4ED8),
                  ],
                ),
                borderRadius:
                    BorderRadius.circular(30),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x26315BD5),
                    blurRadius: 26,
                    offset: Offset(0, 13),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'FINANCIAL HEALTH SCORE',
                    style: TextStyle(
                      color: Colors.white70,
                      fontWeight:
                          FontWeight.bold,
                      letterSpacing: 1,
                      fontSize: 12,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Text(
                    score.toStringAsFixed(1),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 72,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  const Text(
                    '/ 100',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                    ),
                  ),

                  const SizedBox(height: 15),

                  Container(
                    padding:
                        const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 8,
                    ),
                    decoration:
                        BoxDecoration(
                      color: color.withValues(
                        alpha: 0.20,
                      ),
                      borderRadius:
                          BorderRadius.circular(
                        20,
                      ),
                    ),
                    child: Text(
                      risk.toUpperCase(),
                      style:
                          const TextStyle(
                        color: Colors.white,
                        fontWeight:
                            FontWeight.bold,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  Text(
                    'Confidence: ${confidence.toStringAsFixed(1)}%',
                    style:
                        const TextStyle(
                      color: Colors.white70,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 25),

            // ==================================================
            // METRICS
            // ==================================================

            const Align(
              alignment:
                  Alignment.centerLeft,
              child: Text(
                'Financial Metrics',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 14),

            _metricTile(
              'Total Expenses',
              '₹${getMetric('total_expenses')}',
              Icons.shopping_cart_outlined,
            ),

            _metricTile(
              'Monthly Savings',
              '₹${getMetric('monthly_savings')}',
              Icons.savings_outlined,
            ),

            _metricTile(
              'Savings Rate',
              '${getMetric('savings_rate')}%',
              Icons.savings_outlined,
            ),

            _metricTile(
              'Debt Ratio',
              '${getMetric('debt_ratio')}%',
              Icons.credit_card_outlined,
            ),

            _metricTile(
              'Expense Ratio',
              '${getMetric('expense_ratio')}%',
              Icons.pie_chart_outline,
            ),

            _metricTile(
              'Discretionary Spending',
              '${getMetric(
                'discretionary_spending_ratio',
                fallback:
                    'discretionary_ratio',
              )}%',
              Icons.shopping_bag_outlined,
            ),

            const SizedBox(height: 25),

            // ==================================================
            // AI INSIGHTS
            // ==================================================

            if (data['insights'] is List &&
                (data['insights'] as List).isNotEmpty)
              _insightsSection(
                data['insights'] as List,
              ),

            const SizedBox(height: 25),

            // ==================================================
            // RECOMMENDATIONS
            // ==================================================

            if (data['recommendations'] is List &&
                (data['recommendations'] as List)
                    .isNotEmpty)
              _recommendations(
                data['recommendations'] as List,
              ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 54,
              child: OutlinedButton.icon(
                onPressed: onAnalyze,
                icon: const Icon(
                  Icons.refresh,
                ),
                label: const Text(
                  'Run New Analysis',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _metricTile(
    String title,
    String value,
    IconData icon,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 12,
      ),
      padding:
          const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Container(
            padding:
                const EdgeInsets.all(11),
            decoration:
                BoxDecoration(
              color:
                  const Color(0xFFEFF6FF),
              borderRadius:
                  BorderRadius.circular(
                12,
              ),
            ),
            child: Icon(
              icon,
              color:
                  const Color(0xFF2563EB),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Text(
              title,
              style:
                  const TextStyle(
                fontWeight:
                    FontWeight.w600,
              ),
            ),
          ),

          Text(
            value,
            style:
                const TextStyle(
              fontSize: 17,
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _insightsSection(List insights) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'AI Insights',
          style: TextStyle(
            fontSize: 20,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 14),

        ...insights.map(
          (item) => Container(
            margin:
                const EdgeInsets.only(
              bottom: 10,
            ),
            padding:
                const EdgeInsets.all(17),
            decoration:
                BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(
                16,
              ),
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.auto_awesome,
                  color:
                      Color(0xFF2563EB),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    item.toString(),
                    style:
                        const TextStyle(
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _recommendations(
    List recommendations,
  ) {
    return Column(
      crossAxisAlignment:
          CrossAxisAlignment.start,
      children: [
        const Text(
          'AI Recommendations',
          style: TextStyle(
            fontSize: 20,
            fontWeight:
                FontWeight.bold,
          ),
        ),

        const SizedBox(height: 14),

        ...recommendations.map(
          (item) => Container(
            margin:
                const EdgeInsets.only(
              bottom: 10,
            ),
            padding:
                const EdgeInsets.all(17),
            decoration:
                BoxDecoration(
              color: Colors.white,
              borderRadius:
                  BorderRadius.circular(
                16,
              ),
            ),
            child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.lightbulb_outline,
                  color:
                      Color(0xFF2563EB),
                ),

                const SizedBox(width: 12),

                Expanded(
                  child: Text(
                    item.toString(),
                    style:
                        const TextStyle(
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// ============================================================
// INSIGHTS SCREEN
// ============================================================

class InsightsScreen extends StatelessWidget {
  final Map<String, dynamic>? result;

  const InsightsScreen({
    super.key,
    this.result,
  });

  @override
  Widget build(BuildContext context) {
    final insights =
        result?['insights'];

    final recommendations =
        result?['recommendations'];

    if (insights is List &&
        insights.isNotEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'AI Insights',
            style: TextStyle(
              fontWeight:
                  FontWeight.bold,
            ),
          ),
        ),
        body: ListView(
          padding:
              const EdgeInsets.all(20),
          children: [
            const Text(
              'Your Personalized Insights',
              style: TextStyle(
                fontSize: 26,
                fontWeight:
                    FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'AI-generated insights based on your financial assessment.',
              style: TextStyle(
                color: Colors.grey,
                height: 1.4,
              ),
            ),

            const SizedBox(height: 25),

            ...insights.map(
              (item) => _card(
                Icons.auto_awesome,
                'AI Insight',
                item.toString(),
              ),
            ),

            if (recommendations is List &&
                recommendations.isNotEmpty) ...[
              const SizedBox(height: 15),

              const Text(
                'Recommendations',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,
                ),
              ),

              const SizedBox(height: 14),

              ...recommendations.map(
                (item) => _card(
                  Icons.lightbulb_outline,
                  'Recommendation',
                  item.toString(),
                ),
              ),
            ],
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AI Insights',
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.all(20),
        children: [
          const Text(
            'Smart Financial Guidance',
            style: TextStyle(
              fontSize: 26,
              fontWeight:
                  FontWeight.bold,
            ),
          ),

          const SizedBox(height: 8),

          const Text(
            'Complete your financial assessment to receive personalized AI insights.',
            style: TextStyle(
              color: Colors.grey,
              height: 1.4,
            ),
          ),

          const SizedBox(height: 25),

          _card(
            Icons.savings_outlined,
            'Build your savings',
            'Aim to maintain a consistent savings rate every month.',
          ),

          _card(
            Icons.credit_card_outlined,
            'Control debt',
            'Keep loan payments at a manageable percentage of your income.',
          ),

          _card(
            Icons.shopping_cart_outlined,
            'Watch discretionary spending',
            'Eating out, entertainment and other optional expenses can quickly add up.',
          ),

          _card(
            Icons.emergency_outlined,
            'Prepare for emergencies',
            'Build an emergency fund to protect yourself against unexpected expenses.',
          ),
        ],
      ),
    );
  }

  Widget _card(
    IconData icon,
    String title,
    String description,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 14,
      ),
      padding:
          const EdgeInsets.all(20),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(20),
      ),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Container(
            padding:
                const EdgeInsets.all(12),
            decoration:
                BoxDecoration(
              color:
                  const Color(0xFFEFF6FF),
              borderRadius:
                  BorderRadius.circular(
                14,
              ),
            ),
            child: Icon(
              icon,
              color:
                  const Color(0xFF2563EB),
            ),
          ),

          const SizedBox(width: 15),

          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                      const TextStyle(
                    fontSize: 16,
                    fontWeight:
                        FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 6),

                Text(
                  description,
                  style:
                      const TextStyle(
                    color: Colors.grey,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// PROFILE SCREEN
// ============================================================

class ProfileScreen
    extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontWeight:
                FontWeight.bold,
          ),
        ),
      ),
      body: ListView(
        padding:
            const EdgeInsets.all(20),
        children: [
          Center(
            child: CircleAvatar(
              radius: 42,
              backgroundColor:
                  const Color(0xFFEFF6FF),
              child: const Icon(
                Icons.person,
                size: 45,
                color:
                    Color(0xFF2563EB),
              ),
            ),
          ),

          const SizedBox(height: 15),

          const Center(
            child: Text(
              'SafeSpend User',
              style: TextStyle(
                fontSize: 20,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 30),

          _profileItem(
            Icons.security_outlined,
            'Privacy & Security',
          ),

          _profileItem(
            Icons.notifications_outlined,
            'Notifications',
          ),

          _profileItem(
            Icons.info_outline,
            'About SafeSpend AI',
          ),

          _profileItem(
            Icons.help_outline,
            'Help & Support',
          ),
        ],
      ),
    );
  }

  Widget _profileItem(
    IconData icon,
    String title,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
        bottom: 10,
      ),
      decoration:
          BoxDecoration(
        color: Colors.white,
        borderRadius:
            BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color:
              const Color(0xFF2563EB),
        ),
        title: Text(title),
        trailing: const Icon(
          Icons.chevron_right,
          color: Colors.grey,
        ),
        onTap: () {},
      ),
    );
  }
}

// ============================================================
// FASTAPI SERVICE
// ============================================================

class SafeSpendApi {
  // Android emulator accesses host PC through 10.0.2.2
  static const String baseUrl =
      'http://10.0.2.2:8000';

  static Future<Map<String, dynamic>> predict(
    Map<String, dynamic> data,
  ) async {
    final url =
        Uri.parse('$baseUrl/predict');

    try {
      final response =
          await http
              .post(
                url,
                headers: {
                  'Accept':
                      'application/json',
                  'Content-Type':
                      'application/json',
                },
                body: jsonEncode(data),
              )
              .timeout(
                const Duration(seconds: 30),
              );

      debugPrint(
        'HTTP status: ${response.statusCode}',
      );

      debugPrint(
        'HTTP response: ${response.body}',
      );

      if (response.statusCode >= 200 &&
          response.statusCode < 300) {
        final decoded =
            jsonDecode(response.body);

        if (decoded
            is Map<String, dynamic>) {
          return decoded;
        }

        throw Exception(
          'Unexpected response format from SafeSpend AI.',
        );
      }

      if (response.statusCode == 422) {
        throw Exception(
          'FastAPI validation error (422): ${response.body}',
        );
      }

      throw Exception(
        'Server returned ${response.statusCode}: ${response.body}',
      );
    } on http.ClientException catch (e) {
      throw Exception(
        'Network error: $e',
      );
    } on FormatException catch (e) {
      throw Exception(
        'Invalid JSON response from server: $e',
      );
    } catch (e) {
      throw Exception(
        e.toString(),
      );
    }
  }
}