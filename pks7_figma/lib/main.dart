import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Медицинское приложение',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = const [
    ServicesCatalogScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey[600],
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Главная',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Корзина',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}

class ServicesCatalogScreen extends StatelessWidget {
  const ServicesCatalogScreen({Key? key}) : super(key: key);

  static const Color _textColor = Colors.black;
  static const Color _priceColor = Colors.black;
  static const Color _buttonColor = Color(0xFF2979FF); 
  static const double _titleFontSize = 18;
  static const double _priceFontSize = 16;
  static const double _dayFontSize = 14;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Text(
                'Каталог услуг',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: _textColor,
                ),
              ),
              const SizedBox(height: 40),
              _ServiceCard(
                title: 'ПЦР-тест на определение РНК\nкоронавируса стандартный',
                days: '2 дня',
                price: '1800 ₽',
              ),
              const SizedBox(height: 12),
              _ServiceCard(
                title: 'Клинический анализ крови\nс лейкоцитарной формулировкой',
                days: '1 день',
                price: '690 ₽',
              ),
              const SizedBox(height: 12),
              _ServiceCard(
                title: 'Биохимический анализ крови,\nбазовый',
                days: '1 день',
                price: '2440 ₽',
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ServiceCard extends StatelessWidget {
  final String title;
  final String days;
  final String price;

  const _ServiceCard({
    Key? key,
    required this.title,
    required this.days,
    required this.price,
  }) : super(key: key);

  static const Color _textColor = Colors.black;
  static const Color _priceColor = Colors.black;
  static const Color _buttonColor = Color(0xFF1A6FEE);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: _textColor,
              ),
            ),
            const SizedBox(height: 15),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      days,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      price,
                      style: const TextStyle(
                        fontSize: 16,
                        color: _priceColor,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Добавить',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const Color _textColor = Colors.black;
  static const Color _buttonColor = Color(0xFF2979FF);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Корзина',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: _textColor,
                  ),
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const _CartItemWidget(
                      title: 'Клинический анализ крови с\nлейкоцитарной формулировкой',
                      price: '690 ₽',
                      quantity: 1,
                    ),
                    const _CartItemWidget(
                      title: 'ПЦР-тест на определение РНК\nкоронавируса стандартный',
                      price: '1800 ₽',
                      quantity: 1,
                    ),
                    const SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: Row(
                        children: [
                          Text(
                            'Сумма',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: _textColor,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            '2490 ₽',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: _textColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _buttonColor,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    'Перейти к оформлению заказа',
                    style: TextStyle(fontSize: 17),
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

class _CartItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final int quantity;

  const _CartItemWidget({
    Key? key,
    required this.title,
    required this.price,
    required this.quantity,
  }) : super(key: key);

  static const Color _textColor = Colors.black;
  static const Color _closeColor = Colors.grey;
  static const Color _quantityBoxColor = Color(0xFFF5F5F5);
  static const Color _minusColor = Color(0xFFB8C1CC);
  static const Color _plusColor = Color(0xFF939396);
  static const Color _dividerColor = Color(0xFFEBEBEB);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: const Color(0xFFE0E0E0), width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    color: _textColor,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Icon(
                  Icons.close,
                  color: _closeColor,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            children: [
              Text(
                price,
                style: const TextStyle(
                  fontSize: 16,
                  color: _textColor,
                ),
              ),
              const Spacer(),
              Text(
                '$quantity пациент',
                style: const TextStyle(fontSize: 14),
              ),
              const SizedBox(width: 8),
              Container(
                decoration: BoxDecoration(
                  color: _quantityBoxColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.remove,
                          color: _minusColor,
                          size: 18,
                        ),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 15,
                      color: _dividerColor,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Icon(
                          Icons.add,
                          color: _plusColor,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const Color _textColor = Colors.black;
  static const Color _secondaryTextColor = Color(0xFF939396);
  static const Color _exitColor = Colors.red;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Эдуард',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    color: _textColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '+7 900 800-55-33',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 15),
                Text(
                  'email@gmail.com',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 48),
                _ProfileMenuItem(
                  icon: '📋',
                  title: 'Мои заказы',
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: '📦',
                  title: 'Медицинские карты',
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: '🏠',
                  title: 'Мои адреса',
                  onTap: () {},
                ),
                _ProfileMenuItem(
                  icon: '⚙️',
                  title: 'Настройки',
                  onTap: () {},
                ),
                const SizedBox(height: 48),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _SecondaryTextButton(
                        text: 'Ответы на вопросы',
                        onTap: () {},
                      ),
                      _SecondaryTextButton(
                        text: 'Политика конфиденциальности',
                        onTap: () {},
                      ),
                      _SecondaryTextButton(
                        text: 'Пользовательское соглашение',
                        onTap: () {},
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                Center(
                  child: GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Выход',
                      style: TextStyle(
                        fontSize: 16,
                        color: _exitColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _ProfileMenuItem extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onTap;

  const _ProfileMenuItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  static const Color _textColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Text(
              icon,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: _textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SecondaryTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;

  const _SecondaryTextButton({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  static const Color _textColor = Color(0xFF939396);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: TextButton.styleFrom(
        foregroundColor: _textColor,
        padding: EdgeInsets.zero,
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: _textColor,
        ),
      ),
    );
  }
}
