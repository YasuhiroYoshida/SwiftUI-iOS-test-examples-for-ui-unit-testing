//
//  ContentViewPage.swift
//  TipCalculatorUITests
//
//  Created by Yasuhiro Yoshida on 2022-02-04.
//

import Foundation
import XCTest

class ContentViewPage {
  var app: XCUIApplication!
  var totalTextField: XCUIElement { app.textFields["totalTextField"] }
  var tipPercentageSegmentedControl: XCUIElement { app.segmentedControls["tipPercentageSegmentedControl"] }
  var calculateTipButton: XCUIElement { app.buttons["calculateTipButton"] }
  var tip: XCUIElement { app.staticTexts["tip"] }
  var errorMessage: XCUIElement { app.staticTexts["errorMessage"] }

  init(app: XCUIApplication) {
    self.app = app
  }
}
