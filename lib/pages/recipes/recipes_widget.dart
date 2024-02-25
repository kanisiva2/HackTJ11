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
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'recipes_model.dart';
export 'recipes_model.dart';

class RecipesWidget extends StatefulWidget {
  const RecipesWidget({super.key});

  @override
  State<RecipesWidget> createState() => _RecipesWidgetState();
}

class _RecipesWidgetState extends State<RecipesWidget> {
  late RecipesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool textFieldFocusListenerRegistered = false;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecipesModel());

    _model.textController ??= TextEditingController();
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RecipesRecord>>(
      stream: queryRecipesRecord(
        queryBuilder: (recipesRecord) => recipesRecord.orderBy('name'),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RecipesRecord> recipesRecipesRecordList = snapshot.data!;
        return GestureDetector(
          onTap: () => _model.unfocusNode.canRequestFocus
              ? FocusScope.of(context).requestFocus(_model.unfocusNode)
              : FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(80.0),
              child: AppBar(
                backgroundColor: FlutterFlowTheme.of(context).alternate,
                automaticallyImplyLeading: false,
                title: Text(
                  'Recipes',
                  style: FlutterFlowTheme.of(context).headlineSmall,
                ),
                actions: [],
                centerTitle: true,
                toolbarHeight: 170.0,
                elevation: 2.0,
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(16.0, 8.0, 16.0, 12.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Expanded(
                          child: Autocomplete<String>(
                            initialValue: TextEditingValue(),
                            optionsBuilder: (textEditingValue) {
                              if (textEditingValue.text == '') {
                                return const Iterable<String>.empty();
                              }
                              return recipesRecipesRecordList
                                  .map((e) => e.name)
                                  .toList()
                                  .where((option) {
                                final lowercaseOption = option.toLowerCase();
                                return lowercaseOption.contains(
                                    textEditingValue.text.toLowerCase());
                              });
                            },
                            optionsViewBuilder: (context, onSelected, options) {
                              return AutocompleteOptionsList(
                                textFieldKey: _model.textFieldKey,
                                textController: _model.textController!,
                                options: options.toList(),
                                onSelected: onSelected,
                                textStyle:
                                    FlutterFlowTheme.of(context).bodyMedium,
                                textHighlightStyle: TextStyle(),
                                elevation: 4.0,
                                optionBackgroundColor:
                                    FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                optionHighlightColor:
                                    FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                maxHeight: 200.0,
                              );
                            },
                            onSelected: (String selection) {
                              setState(() =>
                                  _model.textFieldSelectedOption = selection);
                              FocusScope.of(context).unfocus();
                            },
                            fieldViewBuilder: (
                              context,
                              textEditingController,
                              focusNode,
                              onEditingComplete,
                            ) {
                              _model.textFieldFocusNode = focusNode;
                              if (!textFieldFocusListenerRegistered) {
                                textFieldFocusListenerRegistered = true;
                                _model.textFieldFocusNode!
                                    .addListener(() => setState(() {}));
                              }
                              _model.textController = textEditingController;
                              return TextFormField(
                                key: _model.textFieldKey,
                                controller: textEditingController,
                                focusNode: focusNode,
                                onEditingComplete: onEditingComplete,
                                onChanged: (_) => EasyDebounce.debounce(
                                  '_model.textController',
                                  Duration(milliseconds: 2000),
                                  () => setState(() {}),
                                ),
                                onFieldSubmitted: (_) async {
                                  safeSetState(() {
                                    _model.simpleSearchResults = TextSearch(
                                      recipesRecipesRecordList
                                          .map(
                                            (record) =>
                                                TextSearchItem.fromTerms(
                                                    record, [record.name!]),
                                          )
                                          .toList(),
                                    )
                                        .search(_model.textController.text)
                                        .map((r) => r.object)
                                        .toList();
                                    ;
                                  });
                                  setState(() {
                                    _model.searchActive = true;
                                  });
                                },
                                autofocus: true,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Search Items...',
                                  labelStyle:
                                      FlutterFlowTheme.of(context).labelMedium,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: FlutterFlowTheme.of(context).error,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  filled: true,
                                  fillColor:
                                      (_model.textFieldFocusNode?.hasFocus ??
                                              false)
                                          ? FlutterFlowTheme.of(context).accent1
                                          : Color(0x00000000),
                                ),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                                validator: _model.textControllerValidator
                                    .asValidator(context),
                              );
                            },
                          ),
                        ),
                        if (_model.searchActive ?? true)
                          FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 20.0,
                            borderWidth: 1.0,
                            buttonSize: 40.0,
                            fillColor: Colors.transparent,
                            icon: Icon(
                              Icons.clear_sharp,
                              color: Color(0xFFFF0000),
                              size: 24.0,
                            ),
                            onPressed: () async {
                              setState(() {
                                _model.searchActive = false;
                              });
                              setState(() {
                                _model.textController?.clear();
                              });
                            },
                          ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 10.0),
                    child: Container(
                      width: 394.0,
                      height: 50.0,
                      decoration: BoxDecoration(),
                      child: ListView(
                        padding: EdgeInsets.fromLTRB(
                          16.0,
                          0,
                          10.0,
                          0,
                        ),
                        primary: false,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          SelectionArea(
                              child: Text(
                            'Vegetarian:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          )),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: wrapWithModel(
                              model: _model.vegetarianModel,
                              updateCallback: () => setState(() {}),
                              child: VegetarianWidget(),
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'Vegan:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          )),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: wrapWithModel(
                              model: _model.veganModel,
                              updateCallback: () => setState(() {}),
                              child: VeganWidget(),
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'Gluten-Free:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          )),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: wrapWithModel(
                              model: _model.glutenFreeModel,
                              updateCallback: () => setState(() {}),
                              child: GlutenFreeWidget(),
                            ),
                          ),
                          SelectionArea(
                              child: Text(
                            'Nut-Free:',
                            textAlign: TextAlign.center,
                            style: FlutterFlowTheme.of(context).bodyMedium,
                          )),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 5.0),
                            child: wrapWithModel(
                              model: _model.nutFreeModel,
                              updateCallback: () => setState(() {}),
                              child: NutFreeWidget(),
                            ),
                          ),
                        ].divide(SizedBox(width: 0.0)),
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 708.0,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                    ),
                    child: Stack(
                      children: [
                        if (!_model.searchActive!)
                          Builder(
                            builder: (context) {
                              final allListings = recipesRecipesRecordList
                                  .toList()
                                  .take(3)
                                  .toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allListings.length,
                                itemBuilder: (context, allListingsIndex) {
                                  final allListingsItem =
                                      allListings[allListingsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 12.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'Recipe_Details',
                                          queryParameters: {
                                            'recipe': serializeParam(
                                              allListingsItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'recipe': allListingsItem,
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 160.0,
                                        height: 250.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x34090F13),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 18.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  child: Image.network(
                                                    allListingsItem.coverImage,
                                                    width: 400.0,
                                                    height: 180.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  allListingsItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (_model.searchActive ?? true)
                          Builder(
                            builder: (context) {
                              final searchResults =
                                  _model.simpleSearchResults.toList();
                              return ListView.builder(
                                padding: EdgeInsets.zero,
                                primary: false,
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResults.length,
                                itemBuilder: (context, searchResultsIndex) {
                                  final searchResultsItem =
                                      searchResults[searchResultsIndex];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16.0, 12.0, 12.0, 12.0),
                                    child: InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        context.pushNamed(
                                          'Recipe_Details',
                                          queryParameters: {
                                            'recipe': serializeParam(
                                              searchResultsItem,
                                              ParamType.Document,
                                            ),
                                          }.withoutNulls,
                                          extra: <String, dynamic>{
                                            'recipe': searchResultsItem,
                                            kTransitionInfoKey: TransitionInfo(
                                              hasTransition: true,
                                              transitionType: PageTransitionType
                                                  .topToBottom,
                                            ),
                                          },
                                        );
                                      },
                                      child: Container(
                                        width: 160.0,
                                        height: 250.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4.0,
                                              color: Color(0x34090F13),
                                              offset: Offset(0.0, 2.0),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(12.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 15.0, 0.0, 0.0),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          50.0),
                                                  child: Image.network(
                                                    searchResultsItem
                                                        .coverImage,
                                                    width: 400.0,
                                                    height: 180.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 8.0, 0.0, 0.0),
                                                child: Text(
                                                  searchResultsItem.name,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
