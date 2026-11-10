import 'package:flutter/material.dart';

void main() {
  runApp(const NileRadioApp());
}

class NileRadioApp extends StatelessWidget {
  const NileRadioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nile Radio',
      theme: ThemeData.dark(),
      home: const RadioHomePage(),
    );
  }
}

class RadioHomePage extends StatefulWidget {
  const RadioHomePage({super.key});

  @override
  State<RadioHomePage> createState() => _RadioHomePageState();
}

class _RadioHomePageState extends State<RadioHomePage> {
  bool isPlaying = false;
  double volume = 0.7;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFF101521),
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 650),
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    const Icon(Icons.radio, size: 55, color: Color(0xFF36D6A0)),

                    const SizedBox(height: 12),

                    const Text(
                      'NILE RADIO',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 3,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      'صوتك المفضل في كل مكان',
                      style: TextStyle(color: Colors.white60, fontSize: 16),
                    ),

                    const SizedBox(height: 45),

                    Container(
                      width: 270,
                      height: 270,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [Color(0xFF263B52), Color(0xFF172333)],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        border: Border.all(
                          color: const Color(0xFF36D6A0),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFF36D6A0)
                                .withValues(alpha: 0.15),
                            blurRadius: 45,
                            spreadRadius: 8,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.graphic_eq,
                        size: 110,
                        color: Color(0xFF36D6A0),
                      ),
                    ),

                    const SizedBox(height: 35),

                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isPlaying
                            ? const Color(0xFF173D35)
                            : const Color(0xFF303744),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.circle,
                            size: 10,
                            color: isPlaying
                                ? const Color(0xFF36D6A0)
                                : Colors.white54,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            isPlaying ? 'LIVE NOW' : 'OFF AIR',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'إذاعتنا المباشرة',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    Text(
                      isPlaying
                          ? 'أنت تستمع الآن'
                          : 'اضغط تشغيل للاستماع إلى الإذاعة',
                      style: const TextStyle(
                        color: Colors.white60,
                        fontSize: 15,
                      ),
                    ),

                    const SizedBox(height: 30),

                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isPlaying = !isPlaying;
                        });
                      },
                      child: Container(
                        width: 82,
                        height: 82,
                        decoration: const BoxDecoration(
                          color: Color(0xFF36D6A0),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          isPlaying ? Icons.pause : Icons.play_arrow,
                          color: const Color(0xFF101521),
                          size: 45,
                        ),
                      ),
                    ),

                    const SizedBox(height: 35),

                    const Divider(color: Colors.white12),

                    const SizedBox(height: 20),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'مستوى الصوت',
                        style: TextStyle(fontSize: 17),
                      ),
                    ),

                    Row(
                      children: [
                        const Icon(Icons.volume_down),
                        Expanded(
                          child: Slider(
                            value: volume,
                            min: 0,
                            max: 1,
                            activeColor: const Color(0xFF36D6A0),
                            onChanged: (value) {
                              setState(() {
                                volume = value;
                              });
                            },
                          ),
                        ),
                        const Icon(Icons.volume_up),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'NILE RADIO © 2026',
                      style: TextStyle(color: Colors.white38, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
