import 'package:flutter/material.dart';
import '../home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _emailError = '';
  String _passwordError = '';

  final FocusNode _emailFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool validateEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email);
  }

  bool validatePassword(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*[!@#\$&*~]).{6,}$',
    ).hasMatch(password);
  }

  @override
  void initState() {
    super.initState();
    _emailFocus.addListener(() {
      setState(() {});
    });
    _passwordFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _emailFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    _buildTopBackArrow(context),
                    const SizedBox(height: 60),
                    _buildInstagramLogo(),
                    const SizedBox(height: 50),
                    _buildInputFields(),
                    const SizedBox(height: 20),
                    _buildLoginButton(),
                    const SizedBox(height: 30),
                    _buildFacebookLoginButton(),
                    const SizedBox(height: 40),
                    _buildDivider(),
                    const SizedBox(height: 20),
                    _buildSignupPrompt(),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            _buildFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBackArrow(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.only(top: 56, left: 16.41),
        child: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: SvgPicture.asset(
            'assets/icons/back_icon.svg',
            width: 9.38,
            height: 17.47,
          ),
        ),
      ),
    );
  }

  Widget _buildInstagramLogo() {
    return SvgPicture.asset(
      'assets/icons/instagram_logo.svg',
      width: 182,
      height: 49,
    );
  }

  Widget _buildInputFields() {
    return Column(
      children: [
        TextField(
          controller: _emailController,
          focusNode: _emailFocus,
          decoration: InputDecoration(
            hintText: 'Email',
            errorText: _emailError.isEmpty ? null : _emailError,
            filled: true,
            fillColor: const Color(0xFFFAFAFA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: _emailFocus.hasFocus
                    ? Colors.black
                    : const Color(0xFFEFEFEF),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: _emailFocus.hasFocus
                    ? Colors.black
                    : const Color(0xFFEFEFEF),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: _emailFocus.hasFocus
                    ? Colors.black
                    : const Color(0xFFEFEFEF),
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
        const SizedBox(height: 12),
        TextField(
          controller: _passwordController,
          focusNode: _passwordFocus,
          obscureText: true,
          decoration: InputDecoration(
            hintText: 'Password',
            errorText: _passwordError.isEmpty ? null : _passwordError,
            filled: true,
            fillColor: const Color(0xFFFAFAFA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: _passwordFocus.hasFocus
                    ? Colors.black
                    : const Color(0xFFEFEFEF),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: _passwordFocus.hasFocus
                    ? Colors.black
                    : const Color(0xFFEFEFEF),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: _passwordFocus.hasFocus
                    ? Colors.black
                    : const Color(0xFFEFEFEF),
              ),
            ),
            contentPadding: const EdgeInsets.all(15),
          ),
        ),
        const SizedBox(height: 10),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot password?',
              style: TextStyle(
                color: Color(0xFF0095F6),
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () async {
        setState(() {
          _emailError = validateEmail(_emailController.text)
              ? ''
              : 'Invalid email format';
          _passwordError = validatePassword(_passwordController.text)
              ? ''
              : 'Password must include: Uppercase, Lowercase, Special char';
        });

        if (_emailError.isEmpty && _passwordError.isEmpty) {
          try {
            await _auth.signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          } on FirebaseAuthException catch (e) {
            String errorMsg = '';
            if (e.code == 'user-not-found') {
              errorMsg = 'No user found for that email.';
            } else if (e.code == 'wrong-password') {
              errorMsg = 'Wrong password provided.';
            } else {
              errorMsg = e.message ?? 'Authentication error';
            }
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(errorMsg)));
          }
        }
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(double.infinity, 50),
        backgroundColor: const Color(0xFF0095F6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
        elevation: 0,
      ),
      child: const Text(
        'Log in',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildFacebookLoginButton() {
    return TextButton(
      onPressed: () {},
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/icons/facebook_icon.svg',
              width: 17,
              height: 17,
            ),
            const SizedBox(width: 8),
            const Text(
              'Log in with Facebook',
              style: TextStyle(
                color: Color(0xFF1877F2),
                fontWeight: FontWeight.normal,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Row(
      children: [
        Expanded(child: Divider(color: Color(0xFFB0B0B0), thickness: 0.5)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'OR',
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.normal),
          ),
        ),
        Expanded(child: Divider(color: Color(0xFFB0B0B0), thickness: 0.5)),
      ],
    );
  }

  Widget _buildSignupPrompt() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don't have an account? ",
          style: TextStyle(color: Colors.black54),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Sign up.',
            style: TextStyle(
              color: Color(0xFF0095F6),
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFooter() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFEFEFEF), width: 1.5)),
      ),
      child: const Center(
        child: Text(
          'Instagram от Facebook',
          style: TextStyle(color: Colors.black54, fontSize: 12),
        ),
      ),
    );
  }
}
