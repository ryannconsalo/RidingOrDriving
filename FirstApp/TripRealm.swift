//
//  TripRealm.swift
//  
//
//  Created by Ryann Consalo on 2017/06/15.
//
//

import Foundation
import Realm
import RealmSwift

class TripRealm : RLMObject {
    
    dynamic var driver : String?
    dynamic var startingPoint : String?
    dynamic var destination : String?
    dynamic var numSeats = 0
    dynamic var date : String?
    dynamic var phoneNumber : String?
}
