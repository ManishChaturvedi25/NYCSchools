//
//  NYCNetworkManagerTest.swift
//  NYCSchoolsTests
//
//  Created by Manish Chaturvedi on 10/24/22.
//  Copyright © 2022 Manish Chaturvedi. All rights reserved.
//

import XCTest
@testable import NYCSchools

class NYCNetworkManagerTest: XCTestCase {
    
    let networkManager = NYCNetworkManager()
    
    func testFetchSchools() {
        
        let exp = expectation(description: "Success Response and fetch School List Data.")
        let testAPI = APIURLConstants.fetchSchools
        
        networkManager.fetchData(urlString: testAPI) { (resultData, error) in
            XCTAssertNil(error)
            
            guard let data = resultData,
                let response = try? JSONDecoder().decode(Array<NYCSchool>.self, from: data as! Data) else {
                    exp.fulfill()
                    
                    return
            }
            
            XCTAssert(response.count > 0, "Schools fetched.")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
    
    func testFetchSATScores() {
        
        let exp = expectation(description: "Success Response and fetched SAT Scores Data.")
        let testAPI = APIURLConstants.fetchSATScores
        
        networkManager.fetchData(urlString: testAPI) { (resultData, error) in
            XCTAssertNil(error)
            
            guard let data = resultData,
                let response = try? JSONDecoder().decode(Array<NYCSchoolSATScores>.self, from: data as! Data) else {
                    exp.fulfill()
                    
                    return
            }
            
            XCTAssert(response.count > 0, "SAT Scores fetched.")
            exp.fulfill()
        }
        
        waitForExpectations(timeout: 3.0, handler: nil)
    }
}

