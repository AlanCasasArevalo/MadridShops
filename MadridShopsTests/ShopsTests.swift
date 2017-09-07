//
//  ShopsTests.swift
//  MadridShopsTests
//
//  Created by Alan Casas on 7/9/17.
//  Copyright © 2017 Alan Casas. All rights reserved.
//

import XCTest
import MadridShops

class ShopsTests: XCTestCase {
    
    func testGivenEmptyShopsNumberShopsIsZero(){
        let sut = Shops()
        XCTAssertEqual(0, sut.count())
        XCTAssertNotEqual(1, sut.count())
    }

    func testGivenShopsWithOneElementNumberShopsIsOne(){
        let sut = Shops()
        sut.add(shop: Shop(name: "Shop"))
        XCTAssertEqual(1, sut.count())
        XCTAssertNotEqual(0, sut.count())
    }

}
