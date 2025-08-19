import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/widgets/user_card.dart';
import '../../chat/presentation/chat.dart';
import '../data/rebo/fake_data.dart';

class ChatsScreen extends StatelessWidget {
  const ChatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0.w),
      child: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: EdgeInsets.only(top: 0),
            sliver: SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(bottom: 10.h, top: 10.h),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "ask meta or search",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.r),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor:isDark?Color(0xff232D36): Colors.grey.shade200,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(
                        name: fakeChats[index].name,
                        image: fakeChats[index].imageUrl,
                      ),
                      transitionsBuilder: (context, animation, secondaryAnimation, child) {
                        final tween = Tween<Offset>(
                          begin: const Offset(0, 1),
                          end: Offset.zero,
                        ).chain(CurveTween(curve: Curves.easeInOut));

                        return SlideTransition(
                          position: animation.drive(tween),
                          child: child,
                        );
                      },
                    ),
                  );
                },
                child: UserCard(
                  name: fakeChats[index].name,
                  time: fakeChats[index].time,
                  imageUrl: fakeChats[index].imageUrl,
                  isMe: fakeChats[index].isMe,
                  isRead: fakeChats[index].isRead,
                  message: fakeChats[index].message,
                ),
              ),
              childCount: 30,
            ),
          ),
        ],
      ),
    );
  }
}
