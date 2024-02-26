// ignore_for_file: prefer_const_constructors, unused_import

import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:lottie/lottie.dart';
import 'package:iaappp/prompt/bloc/bloc/prompt_bloc.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  final PromptBloc promptBloc = PromptBloc();
  Uint8List? _imageData;

  @override
  void initState() {
    promptBloc.add(PromptInitialEvent());
    super.initState();
  }

  void saveImage() async {
    if (_imageData != null) {
      try {
        final result = await ImageGallerySaver.saveImage(
          _imageData!,
          quality: 80,
        );
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Image saved to gallery')),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to save image')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to save image: $e')),
        );
      }
    }
  }

  void clean() {
    setState(() {
      _imageData = null;
      controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Image Generator AI 🤖",style: TextStyle(fontFamily: "Exo"),)),
        leading: IconButton(
           icon: const Icon(
                  Icons.history_rounded,
                  color: Color(0xFFA200FF),
                ),
          onPressed: clean,
        ),
        actions: [
          IconButton(
            onPressed: saveImage,
           icon: const Icon(
                    Icons.download_outlined,
                    color: Color(0xFFA200FF),
                  ),
          ),
        ],
      ),
      body: BlocConsumer<PromptBloc, PromptState>(
        bloc: promptBloc,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case PromptGeneratingImageLoadState:
              return Center(child: Lottie.asset('assets/loading.json'));
            case PromptGeneratingImageErrorState:
              return Center(child: Text("Something went wrong"));
            case PromptGeneratingImageSuccessState:
              final successState = state as PromptGeneratingImageSuccessState;
              _imageData = successState.uint8list;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1E1E1E),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: MemoryImage(successState.uint8list),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 240,
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Enter your prompt",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold,fontFamily: "Exo"),
                        ),
                        const SizedBox(height: 20),
                        TextField(
                          controller: controller,
                          cursorColor: Colors.deepPurple,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.deepPurple),
                                  borderRadius: BorderRadius.circular(12)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(12))),
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          height: 48,
                          width: double.maxFinite,
                          child: ElevatedButton.icon(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.deepPurple)),
                              onPressed: () {
                                if (controller.text.isNotEmpty) {
                                  promptBloc.add(PromptEnteredEvent(
                                      prompt: controller.text));
                                }
                              },
                              icon: Icon(Icons.generating_tokens),
                              label: Text("Generate",style: TextStyle(color: Colors.grey.shade100),)),
                        ),
                      ],
                    ),
                  )
                ],
              );
            default:
              return Lottie.asset('assets/ai_logo.json');
          }
        },
      ),
    );
  }
}
