import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'pantry_widget.dart' show PantryWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class PantryModel extends FlutterFlowModel<PantryWidget> {
  ///  Local state fields for this page.

  bool? searchActive = false;

  List<FoodsRecord> stuff = [];
  void addToStuff(FoodsRecord item) => stuff.add(item);
  void removeFromStuff(FoodsRecord item) => stuff.remove(item);
  void removeAtIndexFromStuff(int index) => stuff.removeAt(index);
  void insertAtIndexInStuff(int index, FoodsRecord item) =>
      stuff.insert(index, item);
  void updateStuffAtIndex(int index, Function(FoodsRecord) updateFn) =>
      stuff[index] = updateFn(stuff[index]);

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<FoodsRecord> simpleSearchResults = [];

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
