import 'package:segari_app/data/dummy_data.dart';
import 'package:segari_app/screen/main_screen.dart';
import 'package:segari_app/state/auth_controller.dart';
import 'package:segari_app/theme/app_theme.dart';
import 'package:segari_app/widgets/decorative_glow.dart';
import 'package:segari_app/widgets/login_form_card.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: DummyUser.email);
  final _passwordController = TextEditingController(text: DummyUser.password);
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    await Future.delayed(const Duration(microseconds: 600));

    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (!mounted) return;
    setState(() => _isLoading = false);

    if (email == DummyUser.email && password == DummyUser.password) {
      await AuthController.instance.login();

      if (!mounted) return;

      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (_) => const MainScreen()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Email atau password salah. Mohon dicoba kembali'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primary,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppTheme.primary, AppTheme.primary],
          ),
        ),
        child: Stack(
          children: [
            const Positioned(top: -70, right: -50, child: DecorativeGlow(220)),
            const Positioned(
              bottom: -90,
              left: -70,
              child: DecorativeGlow(260),
            ),
            const Positioned(top: 190, left: -40, child: DecorativeGlow(110)),

            SafeArea(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.fromLTRB(24, 16, 24, 28),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // LOGO
                      Image.network(
                        'https://s3-ap-southeast-1.amazonaws.com/blog-assets.segari.id/2021/04/SEGARI---Logo-Round_300px-X-300px.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.contain,
                      ),

                      const SizedBox(height: 12),

                      // TAGLINE
                      const Text(
                        'Your Supermarket at Home',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(height: 28),

                      // LOGIN FORM
                      LoginFormCard(
                        formKey: _formKey,
                        emailController: _emailController,
                        passwordController: _passwordController,
                        isLoading: _isLoading,
                        onSubmit: _login,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
