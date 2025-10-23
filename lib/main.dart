import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screens/whatsapp_chats_edit.dart';
import 'screens/whatsapp_chat.dart';

void main() {
  runApp(const MyApp());
}

final GoRouter _router = GoRouter(
  initialLocation: '/whatsapp_chats_edit',
  routes: [
    GoRoute(
      path: '/whatsapp_chats_edit',
      builder: (BuildContext context, GoRouterState state) {
        return const WhatsappChatsEdit();
      },
    ),
    GoRoute(
      path: '/whatsapp_chat',
      builder: (BuildContext context, GoRouterState state) {
        return const WhatsappChat();
      },
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routerConfig: _router,
    );
  }
}