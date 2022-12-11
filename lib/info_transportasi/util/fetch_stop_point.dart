import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:si_solo/info_transportasi/model/transportation.dart';
import 'package:si_solo/info_transportasi/model/route.dart';
import 'package:si_solo/info_transportasi/model/stop_point.dart';

Future<List<StopPoint>> fetchStopPoint(int route) async {
	var url = Uri.parse('https://si-solo.up.railway.app/info-transportasi-umum/json/stop-point/$route');
	var response = await http.get(
		url,
		headers: {
			"Access-Control-Allow-Origin": "*",
			"Content-Type": "application/json",
		},
	);

	// melakukan decode response menjadi bentuk json
	var data = jsonDecode(utf8.decode(response.bodyBytes));

	// melakukan konversi data json menjadi object StopPoint
	List<StopPoint> listStopPoints = [];
	for (var d in data) {
		if (d != null) {
			listStopPoints.add(StopPoint.fromJson(d));
		}
	}

	return listStopPoints;
}