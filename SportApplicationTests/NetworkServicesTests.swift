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
    
    let homeAPI: HomeAPIProtocol = HomeAPI()
    let latestEventsAPI: LatestEventsAPIProtocol = LatestEventsAPI()
    let upcomingEventsAPI: UpcomingEventsAPIProtocol = UpcomingEventsAPI()
    let leagueTeamsAPI: LeagueTeamsAPIProtocol = LeagueTeamsAPI()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetSports(){
        let expectation = expectation(description: "Waiting All Sports")
        homeAPI.getAllSports { result in
            switch result {
            case .success(let sports):
//                XCTAssertEqual(response?.sports.count, 34)
                XCTAssertNotNil(sports)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetLatestEvents(){
        let expectation = expectation(description: "Waiting latest events")
        latestEventsAPI.getLatestEvents(leagueId: "4617") { result in
            switch result {
            case .success(let events):
                XCTAssertNotNil(events)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetUpcomingEvents(){
        let expectation = expectation(description: "Waiting upcoming events")
        upcomingEventsAPI.getUpcomingEvents(leagueId: "4617") { result in
            switch result {
            case .success(let events):
                XCTAssertNotNil(events)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }
    
    func testGetLeagueTeams(){
        let expectation = expectation(description: "Waiting league teams")
        leagueTeamsAPI.getLeagueTeams(leagueName: "Albanian Superliga") { result in
            switch result {
            case .success(let teams):
                XCTAssertNotNil(teams)
                expectation.fulfill()
            case .failure(_):
                XCTFail()
                expectation.fulfill()
            }
        }
        waitForExpectations(timeout: 10, handler: nil)
    }

}
