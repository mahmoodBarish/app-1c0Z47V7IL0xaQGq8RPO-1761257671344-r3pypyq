import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class WhatsappChat extends StatelessWidget {
  const WhatsappChat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      appBar: _buildAppBar(context),
      body: Stack(
        children: [
          Image.asset(
            'assets/images/1_147.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
            children: [
              _buildSentMessage('I will write from Japan', '17:47', true),
              _buildSentMessage('Good bye!', '17:47', true),
              _buildDateSeparator('Fri, Jul 26'),
              _buildSentMessage('Good morning!', '10:10', true),
              _buildSentMessage('Japan looks amazing!', '10:10', true),
              _buildFileMessage(true, 'IMG_0475.png', '2.4 MB', '10:15', true),
              _buildFileMessage(true, 'IMG_0481.png', '2.8 MB', '10:15', true),
              _buildReceivedMessage('Do you know what time is it?', '11:40'),
              _buildSentMessage('It’s morning in Tokyo 😎', '11:43', true),
              _buildReceivedMessage('What is the most popular meal in Japan?', '11:45'),
              _buildReceivedMessage('Do you like it?', '11:45'),
              _buildSentMessage('I think top two are:', '11:50', true),
              _buildFileMessage(true, 'IMG_0483.png', '2.8 MB', '11:51', true),
              _buildFileMessage(true, 'IMG_0484.png', '2.6 MB', '11:51', true),
            ],
          ),
        ],
      ),
      bottomNavigationBar: _buildMessageInputBar(),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF6F6F6),
      elevation: 0.8,
      shadowColor: Colors.black.withOpacity(0.2),
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF007AFF)),
        onPressed: () => context.pop(),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage('assets/images/1_339.png'),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Martha Craig',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
              Text(
                'tap here for contact info',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: const Color(0xFF8E8E93),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.videocam, color: Color(0xFF007AFF)),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.call, color: Color(0xFF007AFF)),
          onPressed: () {},
        ),
      ],
    );
  }

  Widget _buildDateSeparator(String date) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 15),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
        decoration: BoxDecoration(
          color: const Color(0xFFDBDBE9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          date,
          style: GoogleFonts.inter(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: const Color(0xFF3C3C42),
          ),
        ),
      ),
    );
  }

  Widget _buildMessageBubble({
    required Widget child,
    required String time,
    required bool isMe,
    bool isRead = false,
  }) {
    final alignment = isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start;
    final color = isMe ? const Color(0xFFDCF8C6) : Colors.white;

    return Column(
      crossAxisAlignment: alignment,
      children: [
        Container(
          constraints: const BoxConstraints(maxWidth: 250),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              child,
              const SizedBox(height: 4),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    time,
                    style: GoogleFonts.inter(
                      fontSize: 11,
                      color: Colors.black.withOpacity(0.4),
                    ),
                  ),
                  if (isMe) ...[
                    const SizedBox(width: 4),
                    Icon(
                      Icons.done_all,
                      size: 16,
                      color: isRead ? const Color(0xFF3283F6) : Colors.grey,
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
  
  Widget _buildSentMessage(String text, String time, bool isRead) {
    return Align(
      alignment: Alignment.centerRight,
      child: _buildMessageBubble(
        isMe: true,
        time: time,
        isRead: isRead,
        child: Text(
          text,
          style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }
  
  Widget _buildReceivedMessage(String text, String time) {
    return Align(
      alignment: Alignment.centerLeft,
      child: _buildMessageBubble(
        isMe: false,
        time: time,
        child: Text(
          text,
          style: GoogleFonts.inter(fontSize: 16, color: Colors.black),
        ),
      ),
    );
  }

  Widget _buildFileMessage(bool isMe, String fileName, String fileSize, String time, bool isRead) {
    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: _buildMessageBubble(
        isMe: isMe,
        time: time,
        isRead: isRead,
        child: Container(
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: isMe ? const Color(0xFFC5EAB5) : const Color(0xFFEAEAEA),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.insert_drive_file, color: Colors.white, size: 30),
              const SizedBox(width: 10),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      fileName,
                      style: GoogleFonts.inter(
                          fontSize: 14, color: Colors.black.withOpacity(0.7)),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      fileSize,
                      style: GoogleFonts.inter(
                          fontSize: 11, color: Colors.black.withOpacity(0.4)),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMessageInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8).copyWith(bottom: 24),
      color: const Color(0xFFF6F6F6),
      child: SafeArea(
        child: Row(
          children: [
            IconButton(
              icon: const Icon(Icons.add, color: Color(0xFF007AFF)),
              onPressed: () {},
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Message',
                          hintStyle: GoogleFonts.inter(color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.only(left: 16),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.sticky_note_2_outlined, color: Colors.grey),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            IconButton(
              icon: const Icon(Icons.camera_alt_outlined, color: Color(0xFF007AFF)),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.mic, color: Color(0xFF007AFF)),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}