import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class WhatsappChatsEdit extends StatelessWidget {
  const WhatsappChatsEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final List<ChatItem> chatItems = [
      ChatItem(
        imagePath: 'assets/images/1_90.png',
        name: 'Martin Randolph',
        message: 'Yes, 2pm is awesome',
        time: '11/19/19',
        isRead: true,
      ),
      ChatItem(
        imagePath: 'assets/images/1_78.png',
        name: 'Andrew Parker',
        message: 'What kind of strategy is better?',
        time: '11/16/19',
        isRead: true,
      ),
      ChatItem(
        imagePath: 'assets/images/1_66.png',
        name: 'Karen Castillo',
        message: '0:14',
        time: '11/15/19',
        messageType: MessageType.voice,
      ),
      ChatItem(
        imagePath: 'assets/images/1_54.png',
        name: 'Maximillian Jacobson',
        message: 'Bro, I have a good idea!',
        time: '10/30/19',
        isRead: true,
      ),
      ChatItem(
        imagePath: 'assets/images/1_39.png',
        name: 'Martha Craig',
        message: 'Photo',
        time: '10/28/19',
        messageType: MessageType.photo,
      ),
      ChatItem(
        imagePath: 'assets/images/1_31.png',
        name: 'Tabitha Potter',
        message:
            'Actually I wanted to check with you about your online business plan on…',
        time: '8/25/19',
      ),
      ChatItem(
        imagePath: 'assets/images/1_17.png',
        name: 'Maisy Humphrey',
        message: 'Welcome, to make design',
        time: '8/20/19',
        isRead: true,
      ),
      ChatItem(
        imagePath: 'assets/images/1_5.png',
        name: 'Kieron Dotson',
        message: 'Ok, have a good trip!',
        time: '7/29/19',
        isRead: true,
      ),
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            _buildActionsBar(),
            Expanded(
              child: ListView.separated(
                itemCount: chatItems.length,
                itemBuilder: (context, index) {
                  return _ChatListItem(chat: chatItems[index]);
                },
                separatorBuilder: (context, index) => const Divider(
                  height: 1,
                  thickness: 0.5,
                  indent: 85,
                  color: Color(0x4A3C3C43),
                ),
              ),
            ),
            _buildBottomActions(),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: () => context.go('/whatsapp_chat'),
              style: TextButton.styleFrom(
                padding: EdgeInsets.zero,
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Text(
                'Done',
                style: GoogleFonts.lato(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: const Color(0xFF007AFF),
                  letterSpacing: -0.4,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          Text(
            'Chats',
            style: GoogleFonts.lato(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionsBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Color(0x4A3C3C43), width: 0.5)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Broadcast Lists',
              style: GoogleFonts.lato(
                fontSize: 17,
                color: const Color(0xFFC7C7CC),
                fontWeight: FontWeight.normal,
                letterSpacing: -0.4,
              ),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'New Group',
              style: GoogleFonts.lato(
                fontSize: 17,
                color: const Color(0xFFC7C7CC),
                fontWeight: FontWeight.normal,
                letterSpacing: -0.4,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomActions() {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF6F6F6),
        border: Border(
          top: BorderSide(
            color: const Color(0xFF3C3C43).withOpacity(0.36),
            width: 0.5,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Archive',
              style: GoogleFonts.lato(
                  fontSize: 17,
                  color: const Color(0xFFC7C7CC),
                  letterSpacing: -0.4),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Read All',
              style: GoogleFonts.lato(
                  fontSize: 17,
                  color: const Color(0xFFC7C7CC),
                  letterSpacing: -0.4),
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Delete',
              style: GoogleFonts.lato(
                  fontSize: 17,
                  color: const Color(0xFFC7C7CC),
                  letterSpacing: -0.4),
            ),
          ),
        ],
      ),
    );
  }
}

enum MessageType { text, photo, voice }

class ChatItem {
  final String imagePath;
  final String name;
  final String message;
  final String time;
  final bool isRead;
  final MessageType messageType;

  ChatItem({
    required this.imagePath,
    required this.name,
    required this.message,
    required this.time,
    this.isRead = false,
    this.messageType = MessageType.text,
  });
}

class _ChatListItem extends StatelessWidget {
  final ChatItem chat;
  const _ChatListItem({required this.chat});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => context.go('/whatsapp_chat'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF3C3C43).withOpacity(0.36),
                  width: 1.5,
                ),
              ),
            ),
            const SizedBox(width: 12),
            CircleAvatar(
              radius: 26,
              backgroundImage: AssetImage(chat.imagePath),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    chat.name,
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Row(
                    children: [
                      if (chat.isRead)
                        const Icon(Icons.done_all,
                            size: 18, color: Color(0xFF3498DB)),
                      if (chat.messageType == MessageType.photo)
                        const Icon(Icons.photo_camera,
                            size: 16, color: Color(0xFF8E8E93)),
                      if (chat.messageType == MessageType.voice)
                        const Icon(Icons.mic,
                            size: 16, color: Color(0xFF8E8E93)),
                      if (chat.isRead ||
                          chat.messageType != MessageType.text)
                        const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          chat.message,
                          style: GoogleFonts.lato(
                            fontSize: 14,
                            color: const Color(0xFF8E8E93),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Text(
              chat.time,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: const Color(0xFF8E8E93),
              ),
            ),
          ],
        ),
      ),
    );
  }
}