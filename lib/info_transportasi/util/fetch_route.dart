// import 'dart:js_util';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/info_transportasi/model/transportation.dart';
import 'package:si_solo/info_transportasi/model/route.dart';
import 'package:si_solo/info_transportasi/model/stop_point.dart';
import 'package:si_solo/info_transportasi/util/fetch_stop_point.dart';

Future<List<Object>> fetchRoute(int transportation) async {
	var url = Uri.parse('https://si-solo.up.railway.app/info-transportasi-umum/json/route/$transportation');
	var response = await http.get(
		url,
		headers: {
			"Access-Control-Allow-Origin": "*",
			"Content-Type": "application/json",
		},
	);

	// melakukan decode response menjadi bentuk json
	var data = jsonDecode(utf8.decode(response.bodyBytes));

	// melakukan konversi data json menjadi object Route
	List<Object> listRoutes = [];
	for (var d in data) {
    List<Object> pairList = []; // index 0 for route, 1 for the stop points
		if (d != null) {
			pairList.add(Route.fromJson(d));
		}
    // TODO: fetch stop points
    List<StopPoint> listStops = await fetchStopPoint(d['pk']);
    pairList.add(listStops);

    listRoutes.add(pairList);
	}

	return listRoutes;
}