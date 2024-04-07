import '/backend/backend.dart';
import '/components/u_i_components/drawer_nav/drawer_nav_widget.dart';
import '/components/u_i_components/notification_trigger/notification_trigger_widget.dart';
import '/components/u_i_components/user_card/user_card_widget.dart';
import '/components/u_i_components/web_nav/web_nav_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'main_team_page_widget.dart' show MainTeamPageWidget;
import 'package:flutter/material.dart';

class MainTeamPageModel extends FlutterFlowModel<MainTeamPageWidget> {
  ///  Local state fields for this page.

  bool? searchActive = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for drawerNav component.
  late DrawerNavModel drawerNavModel;
  // Model for WebNav component.
  late WebNavModel webNavModel;
  // Model for notification_Trigger component.
  late NotificationTriggerModel notificationTriggerModel1;
  // Model for userCard component.
  late UserCardModel userCardModel;
  // Model for notification_Trigger component.
  late NotificationTriggerModel notificationTriggerModel2;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {
    drawerNavModel = createModel(context, () => DrawerNavModel());
    webNavModel = createModel(context, () => WebNavModel());
    notificationTriggerModel1 =
        createModel(context, () => NotificationTriggerModel());
    userCardModel = createModel(context, () => UserCardModel());
    notificationTriggerModel2 =
        createModel(context, () => NotificationTriggerModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    drawerNavModel.dispose();
    webNavModel.dispose();
    notificationTriggerModel1.dispose();
    userCardModel.dispose();
    notificationTriggerModel2.dispose();
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
