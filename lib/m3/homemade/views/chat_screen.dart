import 'package:digital/loading_effect.dart';
import 'package:digital/theme/app_theme.dart';
import 'package:digital/theme/material_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:flutx/flutx.dart';

import '../controllers/chat_controller.dart';
import '../models/chat.dart';
import 'single_chat_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late ThemeData theme;
  late MaterialThemeData mTheme;

  late ChatController chatController;

  @override
  void initState() {
    super.initState();
    chatController =
        FxControllerStore.putOrFind<ChatController>(ChatController());
    theme = AppTheme.theme;
    mTheme = MaterialTheme.homemadeTheme;
  }

  List<Widget> _buildChatList() {
    List<Widget> list = [];

    list.add(FxSpacing.width(16));

    for (Chat chat in chatController.chats!) {
      list.add(_buildSingleChat(chat));
    }
    return list;
  }

  Widget _buildSingleChat(Chat chat) {
    return FxContainer(
      onTap: () {
        Navigator.of(context, rootNavigator: true).push(
            MaterialPageRoute(builder: (context) => SingleChatScreen(chat)));
      },
      margin: FxSpacing.bottom(16),
      paddingAll: 16,
      borderRadiusAll: 8,
      child: Row(
        children: [
          Stack(
            children: [
              FxContainer.rounded(
                paddingAll: 0,
                child: Image(
                  height: 54,
                  width: 54,
                  image: AssetImage(chat.url),
                ),
              ),
              Positioned(
                right: 4,
                bottom: 2,
                child: chat.active
                    ? FxContainer.rounded(
                        paddingAll: 5,
                        child: Container(),
                        color: Colors.green,
                      )
                    : Container(),
              )
            ],
          ),
          FxSpacing.width(16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FxText.b2(
                  chat.name,
                  fontWeight: 600,
                ),
                FxSpacing.height(4),
                FxText.b3(
                  chat.chat,
                  xMuted: chat.replied,
                  muted: !chat.replied,
                  fontWeight: chat.replied ? 400 : 600,
                ),
              ],
            ),
          ),
          FxSpacing.width(8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              FxText.b3(
                chat.time,
                fontSize: 10,
                color: theme.colorScheme.onBackground,
                xMuted: true,
              ),
              chat.replied
                  ? FxSpacing.height(16)
                  : FxContainer.rounded(
                      paddingAll: 6,
                      color: mTheme.primary,
                      child: FxText.b3(
                        chat.messages,
                        fontSize: 10,
                        color: mTheme.onPrimary,
                      ),
                    ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FxBuilder<ChatController>(
        controller: chatController,
        builder: (chatController) {
          return _buildBody();
        });
  }

  Widget _buildBody() {
    if (chatController.uiLoading) {
      return Scaffold(
        backgroundColor: mTheme.card,
        body: Container(
            margin: FxSpacing.top(FxSpacing.safeAreaTop(context) + 20),
            child: LoadingEffect.getSearchLoadingScreen(
              context,
              theme,
              mTheme,
            )),
      );
    } else {
      return Scaffold(
        body: ListView(
          padding: FxSpacing.fromLTRB(24, 24, 24, 0),
          children: [
            FxSpacing.height(16),
            Center(
              child: FxText.h3(
                'Chats',
                fontWeight: 700,
              ),
            ),
            FxSpacing.height(16),
            TextFormField(
              controller: chatController.searchController,
              style: FxTextStyle.b2(color: mTheme.onPrimaryContainer),
              cursorColor: mTheme.onPrimaryContainer,
              decoration: InputDecoration(
                hintText: "Search your product",
                hintStyle: FxTextStyle.b2(
                    color: mTheme.onPrimaryContainer.withAlpha(150)),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    borderSide: BorderSide.none),
                filled: true,
                fillColor: mTheme.primaryContainer,
                prefixIcon: Icon(
                  FeatherIcons.search,
                  size: 20,
                  color: theme.colorScheme.onBackground.withAlpha(150),
                ),
                isDense: true,
                contentPadding: EdgeInsets.only(right: 16),
              ),
              textCapitalization: TextCapitalization.sentences,
            ),
            FxSpacing.height(20),
            Column(
              children: _buildChatList(),
            ),
          ],
        ),
      );
    }
  }
}
