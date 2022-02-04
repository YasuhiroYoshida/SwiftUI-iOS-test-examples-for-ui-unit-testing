//
//  TipCalculatorUITests.swift
//  TipCalculatorUITests
//
//  Created by Yasuhiro Yoshida on 2022-02-04.
//

import XCTest

class WhenContentViewIsShown: XCTestCase {
  private var app: XCUIApplication!
  private var contentViewPage: ContentViewPage!

  override func setUp() {
    app = XCUIApplication()
    contentViewPage = ContentViewPage(app: app)
    continueAfterFailure = false
    app.launch()
  }

  override func tearDown() {
    // Something, something
  }

  func testShouldMakeSureThatTheTotalTextFieldContainsTheDefaultValue() {
    XCTAssertEqual(contentViewPage.totalTextField.value as! String, "Enter total")
  }

  func testShouldMakeSureThatThe20PercentDefaultTipIsSelected() {
    let selectedElement = contentViewPage.tipPercentageSegmentedControl.buttons.element(boundBy: 1)
    XCTAssertTrue(selectedElement.isSelected)
    XCTAssertEqual(selectedElement.label, "20%")
  }
}

class WhenCalculatorTipButtonIsPressedForValidInput: XCTestCase {
  private var app: XCUIApplication!
  private var contentViewPage: ContentViewPage!

  override func setUp() {
    app = XCUIApplication()
    contentViewPage = ContentViewPage(app: app)
    continueAfterFailure = false
    app.launch()

    contentViewPage.totalTextField.tap()
    contentViewPage.app.typeText("100")
    contentViewPage.calculateTipButton.tap()
  }

  func testShouldMakeSureThatATipIsDisplayedOnTheScreen() {
    let _ = contentViewPage.tip.waitForExistence(timeout: 0.5)
    XCTAssertEqual(contentViewPage.tip.label, "$20.00")
    XCTAssertEqual(contentViewPage.errorMessage.label, "")
  }

}

class WhenCalculatorTipButtonIsPressedForInvalidInput: XCTestCase {
  private var app: XCUIApplication!
  private var contentViewPage: ContentViewPage!

  override func setUp() {
    app = XCUIApplication()
    contentViewPage = ContentViewPage(app: app)
    continueAfterFailure = false
    app.launch()

    contentViewPage.totalTextField.tap()
    contentViewPage.totalTextField.typeText("-100")
    contentViewPage.calculateTipButton.tap()
  }

  func testShouldDisplayErrorMessagesforInvalidInput() {
    let _ = contentViewPage.tip.waitForExistence(timeout: 0.5)
    XCTAssertEqual(contentViewPage.tip.label, "")
    XCTAssertEqual(contentViewPage.errorMessage.label, "Input invalid")
  }
}
