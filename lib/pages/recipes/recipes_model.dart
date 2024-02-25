import '/backend/backend.dart';
import '/components/gluten_free_widget.dart';
import '/components/nut_free_widget.dart';
import '/components/vegan_widget.dart';
import '/components/vegetarian_widget.dart';
import '/flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'recipes_widget.dart' show RecipesWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class RecipesModel extends FlutterFlowModel<RecipesWidget> {
  ///  Local state fields for this page.

  bool? searchActive = false;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextField widget.
  final textFieldKey = GlobalKey();
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? textFieldSelectedOption;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<RecipesRecord> simpleSearchResults = [];
  // Model for Vegetarian component.
  late VegetarianModel vegetarianModel;
  // Model for Vegan component.
  late VeganModel veganModel;
  // Model for GlutenFree component.
  late GlutenFreeModel glutenFreeModel;
  // Model for NutFree component.
  late NutFreeModel nutFreeModel;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {
    vegetarianModel = createModel(context, () => VegetarianModel());
    veganModel = createModel(context, () => VeganModel());
    glutenFreeModel = createModel(context, () => GlutenFreeModel());
    nutFreeModel = createModel(context, () => NutFreeModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldFocusNode?.dispose();

    vegetarianModel.dispose();
    veganModel.dispose();
    glutenFreeModel.dispose();
    nutFreeModel.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
