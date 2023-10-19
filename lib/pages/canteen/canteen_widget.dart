import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_ad_banner.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'canteen_model.dart';
export 'canteen_model.dart';

class CanteenWidget extends StatefulWidget {
  const CanteenWidget({Key? key}) : super(key: key);

  @override
  _CanteenWidgetState createState() => _CanteenWidgetState();
}

class _CanteenWidgetState extends State<CanteenWidget> {
  late CanteenModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CanteenModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.apiResultj4q = await CanteenCall.call();
      if ((_model.apiResultj4q?.succeeded ?? true)) {
        setState(() {
          FFAppState().jsondata = CanteenCall.items(
            (_model.apiResultj4q?.jsonBody ?? ''),
          )!
              .toList()
              .cast<dynamic>();
        });
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).whiteBg,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).whiteBg,
        automaticallyImplyLeading: false,
        title: Text(
          'Canteen',
          style: FlutterFlowTheme.of(context).titleLarge.override(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
              ),
        ),
        actions: [],
        centerTitle: false,
        elevation: 0.5,
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              if (getRemoteConfigBool('ad'))
                FlutterFlowAdBanner(
                  width: MediaQuery.sizeOf(context).width * 1.0,
                  height: 50.0,
                  showsTestAd: false,
                  androidAdUnitID: 'ca-app-pub-3991707481593664/4811954613',
                ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: FlutterFlowChoiceChips(
                  options: [
                    ChipData('Biryani\'s'),
                    ChipData('Chinese'),
                    ChipData('Non-Veg Starters'),
                    ChipData('Tandoori Starters'),
                    ChipData('Veg Starters'),
                    ChipData('Non-Veg Main course'),
                    ChipData('Veg Main course'),
                    ChipData('Ice Creams'),
                    ChipData('Breads')
                  ],
                  onChanged: (val) =>
                      setState(() => _model.choiceChipsValue = val?.first),
                  selectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).primary,
                    textStyle: FlutterFlowTheme.of(context).bodyLarge.override(
                          fontFamily: 'Readex Pro',
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                    iconColor: FlutterFlowTheme.of(context).primaryText,
                    iconSize: 0.0,
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  unselectedChipStyle: ChipStyle(
                    backgroundColor: FlutterFlowTheme.of(context).alternate,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Readex Pro',
                          color: FlutterFlowTheme.of(context).secondaryText,
                        ),
                    iconColor: FlutterFlowTheme.of(context).secondaryText,
                    iconSize: 18.0,
                    elevation: 0.0,
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  chipSpacing: 12.0,
                  rowSpacing: 12.0,
                  multiselect: false,
                  initialized: _model.choiceChipsValue != null,
                  alignment: WrapAlignment.start,
                  controller: _model.choiceChipsValueController ??=
                      FormFieldController<List<String>>(
                    ['Biryani\'s'],
                  ),
                  wrapped: true,
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Builder(
                  builder: (context) {
                    final info = functions
                        .jsonfilter(FFAppState().jsondata.toList(),
                            _model.choiceChipsValue)
                        .toList();
                    return Column(
                      mainAxisSize: MainAxisSize.max,
                      children: List.generate(info.length, (infoIndex) {
                        final infoItem = info[infoIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  15.0, 0.0, 0.0, 0.0),
                              child: Text(
                                getJsonField(
                                  infoItem,
                                  r'''$.name''',
                                ).toString(),
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 15.0, 0.0),
                              child: Text(
                                '₹${getJsonField(
                                  infoItem,
                                  r'''$.price''',
                                ).toString()}',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Readex Pro',
                                      color:
                                          FlutterFlowTheme.of(context).primary,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                            ),
                          ],
                        );
                      })
                          .divide(SizedBox(height: 25.0))
                          .around(SizedBox(height: 25.0)),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
