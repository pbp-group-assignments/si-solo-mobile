import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/info_transportasi/model/transportation.dart';
import 'package:si_solo/info_transportasi/model/route.dart';
import 'package:si_solo/info_transportasi/model/stop_point.dart';
import 'package:si_solo/info_transportasi/util/fetch_route.dart';

Future<List<Object>> fetchTransportation() async {
	var url = Uri.parse('https://si-solo.up.railway.app/info-transportasi-umum/json/transportation');
	var response = await http.get(
		url,
		headers: {
			"Access-Control-Allow-Origin": "*",
			"Content-Type": "application/json",
		},
	);

	// melakukan decode response menjadi bentuk json
	var data = jsonDecode(utf8.decode(response.bodyBytes));

	// melakukan konversi data json menjadi object Transportation
	List<Object> listTransportations = [];
	for (var d in data) {
    List<Object> pairList = []; // index 0 for transportation, 1 for the routes
		if (d != null) {
			pairList.add(Transportation.fromJson(d));
		}
    // TODO: fetch routes
    List<Object> listRoutes = await fetchRoute(d['pk']);
    pairList.add(listRoutes);

    listTransportations.add(pairList);
	}

	return listTransportations;
}