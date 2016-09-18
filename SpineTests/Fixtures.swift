//
//  FooResource.swift
//  Spine
//
//  Created by Ward van Teijlingen on 19-02-15.
//  Copyright (c) 2015 Ward van Teijlingen. All rights reserved.
//

import Foundation
import XCTest
import SwiftyJSON

class Foo: Resource {
	var stringAttribute: String?
	var integerAttribute: NSNumber?
	var floatAttribute: NSNumber?
	var booleanAttribute: NSNumber?
	var nilAttribute: AnyObject?
	var dateAttribute: Date?
	var toOneAttribute: Bar?
	var toManyAttribute: LinkedResourceCollection?
	
	override class var resourceType: String {
		return "foos"
	}
	
	override class var fields: [Field] {
		return fieldsFromDictionary([
			"stringAttribute": Attribute(),
			"integerAttribute": Attribute(),
			"floatAttribute": Attribute(),
			"booleanAttribute": Attribute(),
			"nilAttribute": Attribute(),
			"dateAttribute": DateAttribute(),
			"toOneAttribute": ToOneRelationship(Bar),
			"toManyAttribute": ToManyRelationship(Bar)
			])
	}
	
	required init() {
		super.init()
	}
	
	init(id: String) {
		super.init()
		self.id = id
	}

	required init(coder: NSCoder) {
		super.init(coder: coder)
	}
}

class Bar: Resource {
	override class var resourceType: String {
		return "bars"
	}
	
	override class var fields: [Field] {
		return []
	}
	
	required init() {
		super.init()
	}
	
	init(id: String) {
		super.init()
		self.id = id
	}

	required init(coder: NSCoder) {
		super.init(coder: coder)
	}
}
