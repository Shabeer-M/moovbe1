import '../data/api_base_helper.dart';
import '../data/endpoints.dart';
import '../models/Driver Model.dart';
import '../utils/app_preference.dart';

class CommonRepository{
  final ApiBaseHelper _apiBaseHelper = ApiBaseHelper();


  Future<List<Buslist?>> getbuslist(
      ) async {
    String? token = await AppPreferences.getToken();
    List<Buslist?> expenseList = [];

    var response = await _apiBaseHelper.get(
      endpoint: Endpoints.driverDetails,
      requiresAuth: true,
      token: token,
    );
    if (response != null) {
      BusListingResponse? busListingResponse =
      BusListingResponse.fromJson(response);

      if (busListingResponse.data != null &&
          busListingResponse.data!.isNotEmpty) {
        expenseList.addAll(busListingResponse.data!);
      }
    }
    return expenseList;
  }

  Future<BusListingResponse?> addDriver(
      {required Map<String, String> body,
        }) async {
    String? token = await AppPreferences.getToken();



      var response = await _apiBaseHelper.postFormData(
        endpoint: Endpoints.baseUrl,
        body: body,
        token: token,
        requiresAuth: true,

      );
      if (response != null) {
        BusListingResponse addBusResponse =
        BusListingResponse.fromJson(response);
        if (addBusResponse.data != null) {
          return addBusResponse;
        }
      }
    }
  }

