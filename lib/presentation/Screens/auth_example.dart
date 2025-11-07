import 'package:flutter/material.dart';
import '../../services/auth_service.dart';

class AuthExampleScreen extends StatefulWidget {
  const AuthExampleScreen({Key? key}) : super(key: key);

  @override
  State<AuthExampleScreen> createState() => _AuthExampleScreenState();
}

class _AuthExampleScreenState extends State<AuthExampleScreen>
    with SingleTickerProviderStateMixin {
  final AuthService _authService = AuthService();

  // Login controllers
  final TextEditingController _loginEmailController = TextEditingController();
  final TextEditingController _loginPasswordController =
      TextEditingController();

  // Register controllers
  final TextEditingController _regNameController = TextEditingController();
  final TextEditingController _regEmailController = TextEditingController();
  final TextEditingController _regPasswordController = TextEditingController();

  late final TabController _tabController;
  bool _isProcessing = false;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _loginEmailController.dispose();
    _loginPasswordController.dispose();
    _regNameController.dispose();
    _regEmailController.dispose();
    _regPasswordController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _showMessage(String message, {bool error = false}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: error ? Colors.red : Colors.green,
      ),
    );
  }

  Future<void> _handleLogin() async {
    setState(() => _isProcessing = true);
    final email = _loginEmailController.text.trim();
    final password = _loginPasswordController.text;

    final result = await _authService.loginUser(
      email: email,
      password: password,
    );

    setState(() => _isProcessing = false);

    if (result['success'] == true) {
      _showMessage('Login exitoso');
      // You can navigate to home or refresh state
    } else {
      _showMessage(
        result['message']?.toString() ?? 'Login fallido',
        error: true,
      );
    }
  }

  Future<void> _handleRegister() async {
    setState(() => _isProcessing = true);
    final name = _regNameController.text.trim();
    final email = _regEmailController.text.trim();
    final password = _regPasswordController.text;

    final result = await _authService.registerUser(
      name: name,
      email: email,
      password: password,
    );

    setState(() => _isProcessing = false);

    if (result['success'] == true) {
      _showMessage('Registro exitoso. Puedes iniciar sesión.');
      // optionally switch to login tab
      _tabController.index = 0;
      _loginEmailController.text = email;
    } else {
      _showMessage(
        result['message']?.toString() ?? 'Registro fallido',
        error: true,
      );
    }
  }

  Widget _buildLoginTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _loginEmailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _loginPasswordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isProcessing ? null : _handleLogin,
            child:
                _isProcessing
                    ? const CircularProgressIndicator()
                    : const Text('Login'),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _regNameController,
            decoration: const InputDecoration(labelText: 'Name'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _regEmailController,
            decoration: const InputDecoration(labelText: 'Email'),
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _regPasswordController,
            decoration: const InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _isProcessing ? null : _handleRegister,
            child:
                _isProcessing
                    ? const CircularProgressIndicator()
                    : const Text('Register'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth Example'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Login'), Tab(text: 'Register')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildLoginTab(), _buildRegisterTab()],
      ),
    );
  }
}
