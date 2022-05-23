//
//  NetworkServicesTests.swift
//  SportApplicationTests
//
//  Created by Abdelrhman Ahmed on 22/05/2022.
//  Copyright © 2022 Rana&Abdelrhman. All rights reserved.
//

import XCTest
@testable import SportApplication


class NetworkServicesTests: XCTestCase {

//    let leaguesNetworkServices = LeaguesNetworkManager(baseUrl: Constants.BASE_URL)
    let homeNetworkServices = HomeInteractor(baseUrl: Constants.BASE_URL)
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetSports(){
        let expectaion = expectation(description: "Waiting All Sports")
        homeNetworkServices.getSports(endPoint: Constants.END_POINT_ALL_SPORTS) { sports, error in
            guard let sports = sports else {
                XCTFail()
                expectaion.fulfill()
                return
            }
            XCTAssertEqual(sports.sports.count, 34, "API call failed")
            expectaion.fulfill()

        }
        waitForExpectations(timeout: 5, handler: nil)
    }

}
