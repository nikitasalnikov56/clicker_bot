import 'package:clicker/ui/resources/app_images.dart';
import 'package:clicker/ui/routes/app_navigator.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:clicker/ui/style/app_colors.dart';
import 'package:clicker/ui/style/app_style.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool isHacked = false; // Для отслеживания состояния "HACKED"
  bool _checkingConnection = false; // Для отслеживания проверки соединения
  bool _connectionEstablished = false;

  void _updateHackedStatus() {
    setState(() {
      isHacked = true; // Устанавливаем состояние "HACKED"
    });
    // Задержка перед началом проверки соединения
    Future.delayed(const Duration(seconds: 1), () {
      _checkConnection();
    });
  }

  Future<void> _checkConnection() async {
    setState(() {
      _checkingConnection = true;
    });
    await Future.delayed(const Duration(seconds: 1));
    var connectivityResult = await (Connectivity().checkConnectivity());

// Проверяем, установлено ли подключение
    if (!connectivityResult.contains(ConnectivityResult.none)) {
      // Устанавливаем небольшую задержку перед началом исчезновения линий
      await Future.delayed(const Duration(seconds: 2), () {
        setState(() {
          _connectionEstablished =
              true; // Соединение установлено, запускаем исчезновение линий
        });
      });
      Future.delayed(const Duration(seconds: 1), () {
          // Переход на главную страницу
          navigateToHomePage();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF080808),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: LoadingBlock(
                onCompleted: _updateHackedStatus,
                checkingConnection: _checkingConnection,
                connectionEstablished: _connectionEstablished,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              _connectionEstablished
                  ? 'SUCCESSFULLY' // Если соединение установлено, отображаем SUCCESSFULLY
                  : (_checkingConnection
                      ? 'CONNECTION' // Если проверка соединения, отображаем CONNECTION
                      : (isHacked
                          ? 'HACKED'
                          : 'HACKING')), // Если хак, отображаем HACKED или HACKING
              style: AppStyle.textStyle.copyWith(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: _connectionEstablished
                    ? const Color(0xFF22D7A2) // Цвет при успешном соединении
                    : (_checkingConnection
                        ? const Color(0xFF07DCD8) // Цвет для CONNECTION
                        : AppColors.spalshColor), // Цвет для HACKING или HACKED
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LoadingBlock extends StatefulWidget {
  const LoadingBlock({
    super.key,
    required this.onCompleted,
    required this.checkingConnection,
    required this.connectionEstablished,
  });
  final VoidCallback onCompleted;
  final bool checkingConnection;
  final bool connectionEstablished;
  @override
  State<LoadingBlock> createState() => _LoadingBlockState();
}

class _LoadingBlockState extends State<LoadingBlock>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _stripeController; // Контроллер для анимации полос
  late Animation<double> _stripeAnimation; // Анимация для полос
  late AnimationController
      _glitchController; // Контроллер для анимации исчезновения
  late Animation<double> _glitchAnimation; // Анимация исчезновения полос

  bool _glitchEffectStarted = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onCompleted();
          _stripeController.forward();
        }
      });
    // Контроллер для анимации полос
    _stripeController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    // Анимация для полос
    _stripeAnimation =
        Tween<double>(begin: 0, end: 1).animate(_stripeController)
          ..addListener(() {
            setState(() {});
          });

    _glitchController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    // ..repeat();

    // _glitchAnimation =
    //     Tween<double>(begin: 1, end: 0).animate(_glitchController)
    //       ..addListener(() {
    //         setState(() {});
    //       });

    _glitchAnimation = Tween<double>(begin: 1, end: 0).animate(
      CurvedAnimation(
        parent: _glitchController,
        curve: Curves.easeIn,
      ),
    )..addListener(() {
        setState(() {});
      });
    // Запуск анимации один раз
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _stripeController.dispose(); // Освобождаем контроллер для полос
    _glitchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _animation,
        builder: (context, child) {
          return CustomPaint(
            painter: widget.checkingConnection
                ? ConnectionPainter(
                    animationValue: _stripeAnimation.value,
                    glitchAnimation: _glitchAnimation.value,
                    hideStripes: widget
                        .connectionEstablished, // Контроль видимости полос
                    glitchEffectStarted: _glitchEffectStarted,
                  )
                : LoadingPainter(fillpercent: _animation.value),
            child: SizedBox(
              width: 121,
              height: 150,
              child: widget.connectionEstablished
                  ? Image.asset(AppImages.globe)
                  : null,
            ),
          );
        });
  }
}

class LoadingPainter extends CustomPainter {
  final double fillpercent;
  LoadingPainter({required this.fillpercent});

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = const Color(0xFFFF1F59)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;
    var borderPath = Path();
    borderPath.lineTo(121, 0);
    borderPath.lineTo(121, 150);
    borderPath.lineTo(21, 150);
    borderPath.lineTo(0, 127);
    borderPath.close();

    canvas.clipPath(borderPath);
    canvas.drawPath(borderPath, borderPaint);

    final fillHeight = size.height * fillpercent;

    final fillPaint = Paint()
      ..color = const Color(0xFFFF1F59)
      ..style = PaintingStyle.fill;

    var fillPath = Path();
    fillPath.moveTo(21, 150); // Начало в x = 21, y = 150
    fillPath.lineTo(0, 127); // Переход на x = 0, y = 127
    fillPath.lineTo(0, size.height - fillHeight); // Подъем на нужную высоту
    fillPath.lineTo(121, size.height - fillHeight); // Переход вправо по заливке
    fillPath.lineTo(121, 150); // Завершение у верхней границы

    fillPath.close();
    canvas.drawPath(fillPath, fillPaint);
  }

  @override
  bool shouldRepaint(covariant LoadingPainter oldDelegate) =>
      oldDelegate.fillpercent != fillpercent;
}

class ConnectionPainter extends CustomPainter {
  final double animationValue;
  final double glitchAnimation; // Добавляем параметр для анимации исчезновения
  final bool hideStripes; // Добавлено для управления полосами
  final bool glitchEffectStarted;

  ConnectionPainter({
    required this.animationValue,
    required this.glitchAnimation,
    required this.hideStripes, // Передаем состояние
    required this.glitchEffectStarted,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final borderPaint = Paint()
      ..color = !hideStripes
          ? const Color(0xFF07DCD8)
          : const Color(0xFF22D7A2) // Синий цвет для границ
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    // Создание пути для границ
    var borderPath = Path();
    borderPath.lineTo(121, 0);
    borderPath.lineTo(121, 150);
    borderPath.lineTo(21, 150);
    borderPath.lineTo(0, 127);
    borderPath.close();

    canvas.clipPath(borderPath);

    // Создаем заливку фоном
    final backgroundPaint = Paint()
      ..color = !hideStripes
          ? const Color(0xFF07DCD8).withOpacity(0.3)
          : const Color(0xFF22D7A2)
              .withOpacity(0.3) // Фоновый цвет с прозрачностью
      ..style = PaintingStyle.fill;

    // Рисуем фон
    canvas.drawRect(
        Rect.fromLTWH(0, 0, size.width, size.height), backgroundPaint);

    canvas.drawPath(borderPath, borderPaint);

    if (!hideStripes) {
      final stripePaint = Paint()
        ..color = const Color(0xFF07DCD8) // Полосы более прозрачные
        ..style = PaintingStyle.fill;

      // Рисуем вертикальные полосы
      double stripeWidth = 1; // Ширина полос
      double stripeSpacing = 20;

      for (double x = 21; x <= 121; x += stripeSpacing) {
        var stripePath = Path();
        if ((x ~/ stripeSpacing) % 2 == 0) {
          // Четная линия - появляется сверху вниз
          double stripeHeight = size.height * animationValue;
          stripePath.addRect(Rect.fromLTWH(x, 0, stripeWidth, stripeHeight));
        } else {
          // Нечетная линия - появляется снизу вверх
          double stripeHeight = size.height * animationValue;
          stripePath.addRect(Rect.fromLTWH(
              x, size.height - stripeHeight, stripeWidth, stripeHeight));
        }
        double flickerOpacity = (sin(glitchAnimation * 10) + 1) / 2;
        if (glitchEffectStarted) {
          // Мигание происходит только в момент исчезновения
          stripePaint.color =
              stripePaint.color.withOpacity(flickerOpacity * glitchAnimation);
        } else {
          // Без мигания, когда линии появляются
          stripePaint.color = stripePaint.color.withOpacity(1.0);
        }

        // stripePath.addRect(Rect.fromLTWH(x, size.height -stripeHeightOffset , stripeWidth,
        //     stripeHeightOffset));
        canvas.drawPath(stripePath, stripePaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
