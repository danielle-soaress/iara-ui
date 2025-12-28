import 'package:flutter/material.dart';
import 'package:iara/core/configs/theme/app_colors.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class InputBar extends StatefulWidget {
  final Function(String) onSend;
  final String hintText;

  const InputBar({super.key, required this.onSend, required this.hintText});

  @override
  State<InputBar> createState() => _InputBarState();
}

class _InputBarState extends State<InputBar> {
  SpeechToText _speechToText = SpeechToText();
  // ignore: unused_field
  bool _speechEnabled = false;
  // ignore: unused_field
  String _lastWords = '';

  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
    _initSpeech();
  }

  void _initSpeech() async {
    try {
      var available = await _speechToText.initialize(
        onError: (val) => print('Erro de inicialização: $val'),
        onStatus: (val) => print('Status: $val'),
      );

      if (mounted) {
        setState(() {
          _speechEnabled = available;
        });
      }
    } catch (e) {
      print("Crash na inicialização: $e");
      setState(() => _speechEnabled = false);
    }
  }

  void _startListening() async {
    if (!_speechEnabled || !_speechToText.isAvailable) {
      print("Ainda não inicializou ou não tem permissão!");
      return;
    }

    try {
      await _speechToText.listen(
        onResult: _onSpeechResult,
        pauseFor: const Duration(seconds: 3),
        listenOptions: SpeechListenOptions(
          partialResults: true,
          cancelOnError: true,
        ),
      );
      setState(() {});
    } catch (e) {
      print("Erro ao tentar ouvir: $e");
    }
  }

  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = result.recognizedWords;
      _controller.text = result.recognizedWords;
      _controller.selection = TextSelection.fromPosition(
        TextPosition(offset: _controller.text.length),
      );
      print("resultado: ${result.recognizedWords}");
    });
  }

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isNotEmpty) {
      widget.onSend(text);
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.15),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: 15),
          Flexible(
            child: TextField(
              controller: _controller,
              focusNode: _focusNode,
              style: TextStyle(fontSize: 16),
              textCapitalization: TextCapitalization.sentences,
              textAlignVertical: TextAlignVertical.center,
              decoration: const InputDecoration(
                hintText: "Inicie uma conversa livre...",
                hintStyle: TextStyle(fontSize: 16),
                focusColor: Colors.red,
                border: InputBorder.none,
                alignLabelWithHint: true,
                isCollapsed: true,
              ),
              onSubmitted: (_) => _handleSend(),
            ),
          ),
          const SizedBox(width: 15),

          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            transitionBuilder: (child, anim) =>
                ScaleTransition(scale: anim, child: child),
            child: isFocused
                ? Container(
                    key: const ValueKey('send'),
                    width: 40,
                    height: 40,
                    decoration: const BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color(AppColors.primaryPink),
                          Color(AppColors.primaryPurple),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Color(AppColors.white),
                        size: 20,
                      ),
                      onPressed: _handleSend,
                    ),
                  )
                : Container(
                    key: ValueKey(_speechToText.isListening ? 'stop' : 'mic'),
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: _speechToText.isListening ? Colors.red : null,
                      gradient: _speechToText.isListening
                          ? null
                          : const LinearGradient(
                              colors: [
                                Color(AppColors.primaryPink),
                                Color(AppColors.primaryPurple),
                              ],
                            ),
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.mic,
                        color: Color(AppColors.white),
                        size: 24,
                      ),
                      onPressed: () {
                        if (!_speechEnabled) return;
                        if (_speechToText.isListening) {
                          _stopListening();
                        } else {
                          _startListening();
                        }
                      },
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
