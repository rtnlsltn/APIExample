//
//  Constants.swift
//  APIExample
//
//  Created by Justin on 9/18/18.
//  Copyright © 2018 Justin. All rights reserved.
//

import Foundation
import AWSAppSync


//AWS bare-bones setup
var appSyncClient: AWSAppSyncClient?
let AppSyncEndpointURL: URL = URL(string: "https://2yjs2eawnjbhdhtty4hzibwf64.appsync-api.us-west-2.amazonaws.com/graphql")!
let database_name = "Cars"

class MyApiKeyAuthProvider: AWSAPIKeyAuthProvider {
    func getAPIKey() -> String {
        return "ApiKey"
    }
}
