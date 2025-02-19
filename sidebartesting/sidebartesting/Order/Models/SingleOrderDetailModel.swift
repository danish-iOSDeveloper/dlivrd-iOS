//
//  SingleOrderDetailModel.swift
//  Dlivred_copy
//
//  Created by Ibtidah Mac on 14/11/2024.
//



import Foundation

struct singleOrderDataModel : Codable {
    
    let response_type : String?
    let message : String?
    let data : Data?

    enum CodingKeys: String, CodingKey {

        case response_type = "response_type"
        case message = "message"
        case data = "data"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        response_type = try values.decodeIfPresent(String.self, forKey: .response_type)
        message = try values.decodeIfPresent(String.self, forKey: .message)
        data = try values.decodeIfPresent(Data.self, forKey: .data)
    }

}

struct Data : Codable {
    let order_id : String?
    let timezone_identifier : String?
    let first_pickup_at : String?
    let last_dropoff_at : String?
    let fleet_id : Int?
    let order_status : Int?
    let order_state : String?
    let business_info : Business_info?
    let tags : [String]?
    //let assignment_vars : Assignment_vars?
    let order_info : Order_info?
    let pickups : [Pickups]?
    let dropoffs : [Dropoffs]?
    let api_extras : Api_extras?
    let mapped_order_state : String?
    let mapped_order_status : Int?
    let geofence_radius : Int?
    let geofence_radius_long : Int?
    let meta : Meta?
    let now_time : String?
    let allow_order_confirmation : Bool?
    let allow_order_release : Bool?
    let default_olt : Int?
    let active_olt : Int?
    let has_active_order : Bool?
    let image_upload_count : Int?
    let expected_geofence_event : Int?
    let expected_geofence_job : String?
    let expected_geofence_radius : Double?

    enum CodingKeys: String, CodingKey {

        case order_id = "order_id"
        case timezone_identifier = "timezone_identifier"
        case first_pickup_at = "first_pickup_at"
        case last_dropoff_at = "last_dropoff_at"
        case fleet_id = "fleet_id"
        case order_status = "order_status"
        case order_state = "order_state"
        case business_info = "business_info"
        case tags = "tags"
        //case assignment_vars = "assignment_vars"
        case order_info = "order_info"
        case pickups = "pickups"
        case dropoffs = "dropoffs"
        case api_extras = "api_extras"
        case mapped_order_state = "mapped_order_state"
        case mapped_order_status = "mapped_order_status"
        case geofence_radius = "geofence_radius"
        case geofence_radius_long = "geofence_radius_long"
        case meta = "meta"
        case now_time = "now_time"
        case allow_order_confirmation = "allow_order_confirmation"
        case allow_order_release = "allow_order_release"
        case default_olt = "default_olt"
        case active_olt = "active_olt"
        case has_active_order = "has_active_order"
        case image_upload_count = "image_upload_count"
        case expected_geofence_event = "expected_geofence_event"
        case expected_geofence_job = "expected_geofence_job"
        case expected_geofence_radius = "expected_geofence_radius"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        order_id = try values.decodeIfPresent(String.self, forKey: .order_id)
        timezone_identifier = try values.decodeIfPresent(String.self, forKey: .timezone_identifier)
        first_pickup_at = try values.decodeIfPresent(String.self, forKey: .first_pickup_at)
        last_dropoff_at = try values.decodeIfPresent(String.self, forKey: .last_dropoff_at)
        fleet_id = try values.decodeIfPresent(Int.self, forKey: .fleet_id)
        order_status = try values.decodeIfPresent(Int.self, forKey: .order_status)
        order_state = try values.decodeIfPresent(String.self, forKey: .order_state)
        business_info = try values.decodeIfPresent(Business_info.self, forKey: .business_info)
        tags = try values.decodeIfPresent([String].self, forKey: .tags)
        //assignment_vars = try values.decodeIfPresent(Assignment_vars.self, forKey: .assignment_vars)
        order_info = try values.decodeIfPresent(Order_info.self, forKey: .order_info)
        pickups = try values.decodeIfPresent([Pickups].self, forKey: .pickups)
        dropoffs = try values.decodeIfPresent([Dropoffs].self, forKey: .dropoffs)
        api_extras = try values.decodeIfPresent(Api_extras.self, forKey: .api_extras)
        mapped_order_state = try values.decodeIfPresent(String.self, forKey: .mapped_order_state)
        mapped_order_status = try values.decodeIfPresent(Int.self, forKey: .mapped_order_status)
        geofence_radius = try values.decodeIfPresent(Int.self, forKey: .geofence_radius)
        geofence_radius_long = try values.decodeIfPresent(Int.self, forKey: .geofence_radius_long)
        meta = try values.decodeIfPresent(Meta.self, forKey: .meta)
        now_time = try values.decodeIfPresent(String.self, forKey: .now_time)
        allow_order_confirmation = try values.decodeIfPresent(Bool.self, forKey: .allow_order_confirmation)
        allow_order_release = try values.decodeIfPresent(Bool.self, forKey: .allow_order_release)
        default_olt = try values.decodeIfPresent(Int.self, forKey: .default_olt)
        active_olt = try values.decodeIfPresent(Int.self, forKey: .active_olt)
        has_active_order = try values.decodeIfPresent(Bool.self, forKey: .has_active_order)
        image_upload_count = try values.decodeIfPresent(Int.self, forKey: .image_upload_count)
        expected_geofence_event = try values.decodeIfPresent(Int.self, forKey: .expected_geofence_event)
        expected_geofence_job = try values.decodeIfPresent(String.self, forKey: .expected_geofence_job)
        expected_geofence_radius = try values.decodeIfPresent(Double.self, forKey: .expected_geofence_radius)
    }

}

struct Pickups : Codable , Hashable{
    let id : String?
    let phone : String?
    let latitude : Double?
    let longitude : Double?
    let instructions : String?
    let address : String?
    let job_status : Int?
    let job_state : String?
    let event_at : String?
    let location_name : String?
    let map_snippet : String?
    let task_info  : taskInfo?
    

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case phone = "phone"
        case latitude = "latitude"
        case longitude = "longitude"
        case instructions = "instructions"
        case address = "address"
        case job_status = "job_status"
        case job_state = "job_state"
        case event_at = "event_at"
        case location_name = "location_name"
        case map_snippet = "map_snippet"
        case task_info = "task_info"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        instructions = try values.decodeIfPresent(String.self, forKey: .instructions)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        job_status = try values.decodeIfPresent(Int.self, forKey: .job_status)
        job_state = try values.decodeIfPresent(String.self, forKey: .job_state)
        event_at = try values.decodeIfPresent(String.self, forKey: .event_at)
        location_name = try values.decodeIfPresent(String.self, forKey: .location_name)
        map_snippet = try values.decodeIfPresent(String.self, forKey: .map_snippet)
        task_info = try values.decodeIfPresent(taskInfo.self, forKey: .task_info)
    }

}

struct taskInfo : Codable , Hashable{
    
    let ref_images : [String]?
    
    enum CodingKeys : String , CodingKey{
        case ref_images = "ref_images"
    }
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        ref_images = try values.decodeIfPresent([String].self, forKey: .ref_images)
    }
    
}

struct Dropoffs : Codable , Hashable {
    let id : String?
    let phone : String?
    let street2 : String?
    let latitude : Double?
    let longitude : Double?
    let instructions : String?
    let address : String?
    let job_status : Int?
    let job_state : String?
    let event_at : String?
    let location_name : String?
    let recipient_name : String?
    let images : [String]?
    let map_snippet : String?
    let task_info  : taskInfo?

    enum CodingKeys: String, CodingKey {

        case id = "id"
        case phone = "phone"
        case street2 = "street2"
        case latitude = "latitude"
        case longitude = "longitude"
        case instructions = "instructions"
        case address = "address"
        case job_status = "job_status"
        case job_state = "job_state"
        case event_at = "event_at"
        case location_name = "location_name"
        case recipient_name = "recipient_name"
        case images = "images"
        case map_snippet = "map_snippet"
        case task_info = "task_info"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(String.self, forKey: .id)
        phone = try values.decodeIfPresent(String.self, forKey: .phone)
        street2 = try values.decodeIfPresent(String.self, forKey: .street2)
        latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
        longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
        instructions = try values.decodeIfPresent(String.self, forKey: .instructions)
        address = try values.decodeIfPresent(String.self, forKey: .address)
        job_status = try values.decodeIfPresent(Int.self, forKey: .job_status)
        job_state = try values.decodeIfPresent(String.self, forKey: .job_state)
        event_at = try values.decodeIfPresent(String.self, forKey: .event_at)
        location_name = try values.decodeIfPresent(String.self, forKey: .location_name)
        recipient_name = try values.decodeIfPresent(String.self, forKey: .recipient_name)
        images = try values.decodeIfPresent([String].self, forKey: .images)
        map_snippet = try values.decodeIfPresent(String.self, forKey: .map_snippet)
        task_info = try values.decodeIfPresent(taskInfo.self, forKey: .task_info)
    }

}

struct Meta : Codable {
    let base_fee : Base_fee?
    let tip : Tip?

    enum CodingKeys: String, CodingKey {

        case base_fee = "base_fee"
        case tip = "tip"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        base_fee = try values.decodeIfPresent(Base_fee.self, forKey: .base_fee)
        tip = try values.decodeIfPresent(Tip.self, forKey: .tip)
    }

}

struct Order_info : Codable {
    let subtotal : Int?
    let driver_pricing : Driver_pricing?
    let total_items_count : Int?
    let travel_distance : Double?

    enum CodingKeys: String, CodingKey {

        case subtotal = "subtotal"
        case driver_pricing = "driver_pricing"
        case total_items_count = "total_items_count"
        case travel_distance = "travel_distance"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        subtotal = try values.decodeIfPresent(Int.self, forKey: .subtotal)
        driver_pricing = try values.decodeIfPresent(Driver_pricing.self, forKey: .driver_pricing)
        total_items_count = try values.decodeIfPresent(Int.self, forKey: .total_items_count)
        travel_distance = try values.decodeIfPresent(Double.self, forKey: .travel_distance)
    }

}

struct Polygon : Codable {
    let points : String?

    enum CodingKeys: String, CodingKey {

        case points = "points"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        points = try values.decodeIfPresent(String.self, forKey: .points)
    }

}

struct Driver_pricing : Codable {
    let tip : Int?
    let base_fee : Int?
    let toll : Int?
    let mileage_pay : Int?
    let earnings : Int?
    let incentives : Double?

    enum CodingKeys: String, CodingKey {

        case tip = "tip"
        case base_fee = "base_fee"
        case toll = "toll"
        case mileage_pay = "mileage_pay"
        case earnings = "earnings"
        case incentives = "incentives"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        tip = try values.decodeIfPresent(Int.self, forKey: .tip)
        base_fee = try values.decodeIfPresent(Int.self, forKey: .base_fee)
        toll = try values.decodeIfPresent(Int.self, forKey: .toll)
        mileage_pay = try values.decodeIfPresent(Int.self, forKey: .mileage_pay)
        earnings = try values.decodeIfPresent(Int.self, forKey: .earnings)
        incentives = try values.decodeIfPresent(Double.self, forKey: .incentives)
    }

}

struct Api_extras : Codable {
    let polygon : Polygon?
    let polyline : Polyline?

    enum CodingKeys: String, CodingKey {

        case polygon = "polygon"
        case polyline = "polyline"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        polygon = try values.decodeIfPresent(Polygon.self, forKey: .polygon)
        polyline = try values.decodeIfPresent(Polyline.self, forKey: .polyline)
    }

}

struct Base_fee : Codable {
    let value : Int?
    let title : String?
    let icon_url : String?
    let unit : String?
    let unit_position : String?

    enum CodingKeys: String, CodingKey {

        case value = "value"
        case title = "title"
        case icon_url = "icon_url"
        case unit = "unit"
        case unit_position = "unit_position"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        icon_url = try values.decodeIfPresent(String.self, forKey: .icon_url)
        unit = try values.decodeIfPresent(String.self, forKey: .unit)
        unit_position = try values.decodeIfPresent(String.self, forKey: .unit_position)
    }

}

struct Polyline : Codable {
    let points : String?

    enum CodingKeys: String, CodingKey {

        case points = "points"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        points = try values.decodeIfPresent(String.self, forKey: .points)
    }

}

struct Tip : Codable {
    let value : Int?
    let title : String?
    let icon_url : String?
    let unit : String?
    let unit_position : String?

    enum CodingKeys: String, CodingKey {

        case value = "value"
        case title = "title"
        case icon_url = "icon_url"
        case unit = "unit"
        case unit_position = "unit_position"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        value = try values.decodeIfPresent(Int.self, forKey: .value)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        icon_url = try values.decodeIfPresent(String.self, forKey: .icon_url)
        unit = try values.decodeIfPresent(String.self, forKey: .unit)
        unit_position = try values.decodeIfPresent(String.self, forKey: .unit_position)
    }

}

struct Business_info : Codable {
    let business_name : String?

    enum CodingKeys: String, CodingKey {

        case business_name = "business_name"
    }

    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        business_name = try values.decodeIfPresent(String.self, forKey: .business_name)
    }

}


