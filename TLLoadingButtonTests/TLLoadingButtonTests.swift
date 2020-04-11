//
//  TLLoadingButtonTests.swift
//  TLLoadingButtonTests
//
//  Created by ThinhLe on 4/11/20.
//  Copyright © 2020 ThinhLe. All rights reserved.
//

import XCTest
@testable import TLLoadingButton

class TLLoadingButtonTests: XCTestCase {
    
    func test_initLoadingButtonWithNoParam_initSubview() {
        let sut = TLLoadingButton()
        
        XCTAssertNotNil(sut.containerView)
        XCTAssertNotNil(sut.loadingLabel)
    }
    
    func test_initLoadingButtonWithFrame_initSubview() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let sut = TLLoadingButton(frame: frame)
        
        XCTAssertNotNil(sut.containerView)
        XCTAssertNotNil(sut.loadingLabel)
    }
    
    func test_setAnimatedView_addedToContainerView() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let sut = TLLoadingButton(frame: frame)
        
        let animatedView = SpyView()
        sut.animatedView = animatedView
        
        XCTAssert(sut.containerView.subviews.contains(animatedView))
    }
    
    func test_setSpacing_adjustsSubviewsSpacing() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let sut = TLLoadingButton(frame: frame)
        
        sut.spacing = 12
        
        XCTAssert(sut.containerView.spacing == 12)
    }
    
    func test_animateLoadingButton_animateAnimatedView() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let sut = TLLoadingButton(frame: frame)
        
        let animatedView = SpyView()
        sut.animatedView = animatedView
        sut.startLoading()
        
        XCTAssert(sut.isAnimating)
    }
    
    func test_stopAnimatingLoadingButton_endAnimatedView() {
        let frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        let sut = TLLoadingButton(frame: frame)
        
        let animatedView = SpyView()
        sut.animatedView = animatedView
        sut.startLoading()
        sut.stopLoading()
        
        XCTAssert(!sut.isAnimating)
    }
    
    // MARK: Helpers
    class SpyView: UIView, TLLoadingDelegate {
        var hidesWhenStopped: Bool {
            return true
        }
        
        func startAnimating() {
        }
        
        func stopAnimating() {
        }
    }
}
