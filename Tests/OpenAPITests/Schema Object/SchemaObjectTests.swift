//
//  SchemaObjectTests.swift
//  
//
//  Created by Mathew Polzin on 6/23/19.
//

import Foundation
import XCTest
import OpenAPI
import AnyCodable

final class SchemaObjectTests: XCTestCase {
    func test_jsonTypeFormat() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
        let floatNumber = JSONSchemaObject.number(.init(format: .float, required: true), .init())
        let doubleNumber = JSONSchemaObject.number(.init(format: .double, required: true), .init())
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
        let integer32 = JSONSchemaObject.integer(.init(format: .int32, required: true), .init())
        let integer64 = JSONSchemaObject.integer(.init(format: .int64, required: true), .init())
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
        let byteString = JSONSchemaObject.string(.init(format: .byte, required: true), .init())
        let binaryString = JSONSchemaObject.string(.init(format: .binary, required: true), .init())
        let dateString = JSONSchemaObject.string(.init(format: .date, required: true), .init())
        let dateTimeString = JSONSchemaObject.string(.init(format: .dateTime, required: true), .init())
        let passwordString = JSONSchemaObject.string(.init(format: .password, required: true), .init())
        let allOf = JSONSchemaObject.all(of: [boolean])
        let anyOf = JSONSchemaObject.any(of: [boolean])
        let oneOf = JSONSchemaObject.one(of: [boolean])
        let not = JSONSchemaObject.not(boolean)
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))

        XCTAssertEqual(boolean.jsonTypeFormat, .boolean(.unspecified))
        XCTAssertEqual(object.jsonTypeFormat, .object(.unspecified))
        XCTAssertEqual(array.jsonTypeFormat, .array(.unspecified))
        XCTAssertEqual(number.jsonTypeFormat, .number(.unspecified))
        XCTAssertEqual(floatNumber.jsonTypeFormat, .number(.float))
        XCTAssertEqual(doubleNumber.jsonTypeFormat, .number(.double))
        XCTAssertEqual(integer.jsonTypeFormat, .integer(.unspecified))
        XCTAssertEqual(integer32.jsonTypeFormat, .integer(.int32))
        XCTAssertEqual(integer64.jsonTypeFormat, .integer(.int64))
        XCTAssertEqual(string.jsonTypeFormat, .string(.unspecified))
        XCTAssertEqual(byteString.jsonTypeFormat, .string(.byte))
        XCTAssertEqual(binaryString.jsonTypeFormat, .string(.binary))
        XCTAssertEqual(dateString.jsonTypeFormat, .string(.date))
        XCTAssertEqual(dateTimeString.jsonTypeFormat, .string(.dateTime))
        XCTAssertEqual(passwordString.jsonTypeFormat, .string(.password))
        XCTAssertNil(allOf.jsonTypeFormat)
        XCTAssertNil(anyOf.jsonTypeFormat)
        XCTAssertNil(oneOf.jsonTypeFormat)
        XCTAssertNil(not.jsonTypeFormat)
        XCTAssertNil(reference.jsonTypeFormat)
    }

    func test_required() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
        let allOf = JSONSchemaObject.all(of: [boolean])
        let anyOf = JSONSchemaObject.any(of: [boolean])
        let oneOf = JSONSchemaObject.one(of: [boolean])
        let not = JSONSchemaObject.not(boolean)
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))

        XCTAssertTrue(boolean.required)
        XCTAssertTrue(object.required)
        XCTAssertTrue(array.required)
        XCTAssertTrue(number.required)
        XCTAssertTrue(integer.required)
        XCTAssertTrue(string.required)
        XCTAssertTrue(allOf.required)
        XCTAssertTrue(anyOf.required)
        XCTAssertTrue(oneOf.required)
        XCTAssertTrue(not.required)
        XCTAssertTrue(reference.required)
    }

    func test_optional() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: false))
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [:]))
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init(items: .boolean(.init(format: .unspecified, required: false))))
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init())
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: false), .init())
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: false), .init())

        XCTAssertFalse(boolean.required)
        XCTAssertFalse(object.required)
        XCTAssertFalse(array.required)
        XCTAssertFalse(number.required)
        XCTAssertFalse(integer.required)
        XCTAssertFalse(string.required)
    }

    func test_nullable() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true, nullable: true))
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [:]))
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true, nullable: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init())
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true, nullable: true), .init())
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true, nullable: true), .init())

        XCTAssertTrue(boolean.nullable)
        XCTAssertTrue(object.nullable)
        XCTAssertTrue(array.nullable)
        XCTAssertTrue(number.nullable)
        XCTAssertTrue(integer.nullable)
        XCTAssertTrue(string.nullable)
    }

    func test_notNullable() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
        let allOf = JSONSchemaObject.all(of: [boolean])
        let anyOf = JSONSchemaObject.any(of: [boolean])
        let oneOf = JSONSchemaObject.one(of: [boolean])
        let not = JSONSchemaObject.not(boolean)
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))

        XCTAssertFalse(boolean.nullable)
        XCTAssertFalse(object.nullable)
        XCTAssertFalse(array.nullable)
        XCTAssertFalse(number.nullable)
        XCTAssertFalse(integer.nullable)
        XCTAssertFalse(string.nullable)
        XCTAssertFalse(allOf.nullable)
        XCTAssertFalse(anyOf.nullable)
        XCTAssertFalse(oneOf.nullable)
        XCTAssertFalse(not.nullable)
        XCTAssertFalse(reference.nullable)
    }

    func test_requiredToOptional() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
            .optionalSchemaObject()
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
            .optionalSchemaObject()
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
            .optionalSchemaObject()
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
            .optionalSchemaObject()
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
            .optionalSchemaObject()
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
            .optionalSchemaObject()
        let allOf = JSONSchemaObject.all(of: [boolean])
            .optionalSchemaObject()
        let anyOf = JSONSchemaObject.any(of: [boolean])
            .optionalSchemaObject()
        let oneOf = JSONSchemaObject.one(of: [boolean])
            .optionalSchemaObject()
        let not = JSONSchemaObject.not(boolean)
            .optionalSchemaObject()
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))
            .optionalSchemaObject()

        XCTAssertFalse(boolean.required)
        XCTAssertFalse(object.required)
        XCTAssertFalse(array.required)
        XCTAssertFalse(number.required)
        XCTAssertFalse(integer.required)
        XCTAssertFalse(string.required)
        XCTAssertTrue(allOf.required)
        XCTAssertTrue(anyOf.required)
        XCTAssertTrue(oneOf.required)
        XCTAssertTrue(not.required)
        XCTAssertTrue(reference.required)
    }

    func test_optionalToRequired() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: false))
            .requiredSchemaObject()
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [:]))
            .requiredSchemaObject()
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init(items: .boolean(.init(format: .unspecified, required: false))))
            .requiredSchemaObject()
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init())
            .requiredSchemaObject()
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: false), .init())
            .requiredSchemaObject()
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: false), .init())
            .requiredSchemaObject()

        XCTAssertTrue(boolean.required)
        XCTAssertTrue(object.required)
        XCTAssertTrue(array.required)
        XCTAssertTrue(number.required)
        XCTAssertTrue(integer.required)
        XCTAssertTrue(string.required)
    }

    func test_notNullableToNullable() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
            .nullableSchemaObject()
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
            .nullableSchemaObject()
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
            .nullableSchemaObject()
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
            .nullableSchemaObject()
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
            .nullableSchemaObject()
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
            .nullableSchemaObject()
        let allOf = JSONSchemaObject.all(of: [boolean])
            .nullableSchemaObject()
        let anyOf = JSONSchemaObject.any(of: [boolean])
            .nullableSchemaObject()
        let oneOf = JSONSchemaObject.one(of: [boolean])
            .nullableSchemaObject()
        let not = JSONSchemaObject.not(boolean)
            .nullableSchemaObject()
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))
            .nullableSchemaObject()

        XCTAssertTrue(boolean.nullable)
        XCTAssertTrue(object.nullable)
        XCTAssertTrue(array.nullable)
        XCTAssertTrue(number.nullable)
        XCTAssertTrue(integer.nullable)
        XCTAssertTrue(string.nullable)
        XCTAssertFalse(allOf.nullable)
        XCTAssertFalse(anyOf.nullable)
        XCTAssertFalse(oneOf.nullable)
        XCTAssertFalse(not.nullable)
        XCTAssertFalse(reference.nullable)
    }

    func test_withInitalAllowedValues() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true, allowedValues: [false]))
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true, allowedValues: [[:]]), .init(properties: [:]))
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true, allowedValues: [[false]]), .init(items: .boolean(.init(format: .unspecified, required: true))))
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true, allowedValues: [2.5]), .init())
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true, allowedValues: [5]), .init())
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true, allowedValues: ["hello"]), .init())

        XCTAssertEqual(boolean.allowedValues, [false])
        XCTAssertEqual(object.allowedValues, [[:]])
//        XCTAssertEqual(array.allowedValues, [[false]])
        XCTAssertEqual(array.allowedValues?[0].value as! [Bool], [false])
        XCTAssertEqual(number.allowedValues, [2.5])
        XCTAssertEqual(integer.allowedValues, [5])
        XCTAssertEqual(string.allowedValues, ["hello"])
    }

    func test_withAddedAllowedValues() {
        let boolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
            .with(allowedValues: [false])
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
            .with(allowedValues: [[:]])
        let array = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: true))))
            .with(allowedValues: [[false]])
        let number = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: [2.5])
        let integer = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: [5])
        let string = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: ["hello"])

        // nonesense:
        let allOf = JSONSchemaObject.all(of: [boolean])
            .with(allowedValues: ["hello"])
        let anyOf = JSONSchemaObject.any(of: [boolean])
            .with(allowedValues: ["hello"])
        let oneOf = JSONSchemaObject.one(of: [boolean])
            .with(allowedValues: ["hello"])
        let not = JSONSchemaObject.not(boolean)
            .with(allowedValues: ["hello"])
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))
            .with(allowedValues: ["hello"])

        XCTAssertEqual(boolean.allowedValues, [false])
        XCTAssertEqual(object.allowedValues, [AnyCodable([:])])
        //        XCTAssertEqual(array.allowedValues, [[false]])
        XCTAssertEqual(array.allowedValues?[0].value as! [Bool], [false])
        XCTAssertEqual(number.allowedValues, [2.5])
        XCTAssertEqual(integer.allowedValues, [5])
        XCTAssertEqual(string.allowedValues, ["hello"])

        XCTAssertNil(allOf.allowedValues)
        XCTAssertNil(anyOf.allowedValues)
        XCTAssertNil(oneOf.allowedValues)
        XCTAssertNil(not.allowedValues)
        XCTAssertNil(reference.allowedValues)
    }

    func test_withInitialExample() {
        let object = JSONSchemaObject.object(.init(format: .unspecified, required: true, example: (codable: [:], encoder: testEncoder)), .init(properties: [:]))

        XCTAssertEqual(object.example, "{\n\n}")
    }

    func test_withAddedExample() {
        let object = try! JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:]))
            .with(example: [String: String](), using: testEncoder)

        // nonesense:
        let allOf = JSONSchemaObject.all(of: [object])
            .with(allowedValues: ["hello"])
        let anyOf = JSONSchemaObject.any(of: [object])
            .with(allowedValues: ["hello"])
        let oneOf = JSONSchemaObject.one(of: [object])
            .with(allowedValues: ["hello"])
        let not = JSONSchemaObject.not(object)
            .with(allowedValues: ["hello"])
        let reference = JSONSchemaObject.reference(.file("hello/world.json#/hello"))
            .with(allowedValues: ["hello"])

        XCTAssertEqual(object.example, "{\n\n}")

        XCTAssertNil(allOf.example)
        XCTAssertNil(anyOf.example)
        XCTAssertNil(oneOf.example)
        XCTAssertNil(not.example)
        XCTAssertNil(reference.example)
    }
}

// MARK: - Codable

extension SchemaObjectTests {

    func test_encodeBoolean() {
        let requiredBoolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
        let optionalBoolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: false))
        let nullableBoolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true, nullable: true))
        let allowedValueBoolean = JSONSchemaObject.boolean(.init(format: .unspecified, required: true))
            .with(allowedValues: [true])

        testAllSharedSimpleContextEncoding(typeName: "boolean",
                                           requiredEntity: requiredBoolean,
                                           optionalEntity: optionalBoolean,
                                           nullableEntity: nullableBoolean,
                                           allowedValues: (entity: allowedValueBoolean,
                                                           value: "true"))
    }

    func test_decodeBoolean() {
        let booleanData = #"{"type": "boolean"}"#.data(using: .utf8)!
        let nullableBooleanData = #"{"type": "boolean", "nullable": true}"#.data(using: .utf8)!
        let allowedValueBooleanData = #"{"type": "boolean", "enum": [false]}"#.data(using: .utf8)!

        let boolean = try! testDecoder.decode(JSONSchemaObject.self, from: booleanData)
        let nullableBoolean = try! testDecoder.decode(JSONSchemaObject.self, from: nullableBooleanData)
        let allowedValueBoolean = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueBooleanData)

        XCTAssertEqual(boolean, JSONSchemaObject.boolean(.init(format: .generic, required: false)))
        XCTAssertEqual(nullableBoolean, JSONSchemaObject.boolean(.init(format: .generic, required: false, nullable: true)))
        XCTAssertEqual(allowedValueBoolean, JSONSchemaObject.boolean(.init(format: .generic, required: false, allowedValues: [false])))
    }

    func test_encodeObject() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ]))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ]))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ]))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ]))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"nullable\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObject() {
        let objectData = """
        {
            "type": "object"
        }
        """.data(using: .utf8)!
        let nullableObjectData = """
        {
            "type": "object",
            "nullable": true
        }
        """.data(using: .utf8)!
        let allowedValueObjectData = """
        {
            "type": "object",
            "properties": {"hello": { "type": "boolean"}},
            "enum": [{"hello": false}]
        }
        """.data(using: .utf8)!

        let object = try! testDecoder.decode(JSONSchemaObject.self, from: objectData)
        let nullableObject = try! testDecoder.decode(JSONSchemaObject.self, from: nullableObjectData)
        let allowedValueObject = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueObjectData)

        XCTAssertEqual(object, JSONSchemaObject.object(.init(format: .generic, required: false), .init(properties: [:])))
        XCTAssertEqual(nullableObject, JSONSchemaObject.object(.init(format: .generic, required: false, nullable: true), .init(properties: [:])))
        XCTAssertEqual(allowedValueObject.allowedValues?[0].value as! [String: Bool], ["hello": false])
        XCTAssertEqual(allowedValueObject.jsonTypeFormat, .object(.generic))

        guard case let .object(_, contextB) = allowedValueObject else {
            XCTFail("expected object to be parsed as object")
            return
        }
        XCTAssertEqual(contextB, .init(properties: ["hello": .boolean(.init(format: .generic, required: false))]))
    }

    func test_encodeObjectWithMaxProperties() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], maxProperties: 2))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], maxProperties: 2))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], maxProperties: 2))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], maxProperties: 2))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"maxProperties\" : 2,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"maxProperties\" : 2,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"maxProperties\" : 2,",
                                    "\"nullable\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"maxProperties\" : 2,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObjectWithMaxProperties() {
        // TODO: add test
    }

    func test_encodeObjectWithMinProperties() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], minProperties: 1))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], minProperties: 1))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], minProperties: 1))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], minProperties: 1))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"minProperties\" : 1,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"minProperties\" : 1,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"minProperties\" : 1,",
                                    "\"nullable\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"minProperties\" : 1,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObjectWithMinProperties() {
        // TODO: add test
    }

    func test_encodeObjectWithAdditionalPropertiesTrue() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(true)))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(true)))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(true)))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(true)))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : true,",
                                    "\"nullable\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : true,",
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObjectWithAdditionalPropertiesTrue() {
        // TODO: add test
    }

    func test_encodeObjectWithAdditionalPropertiesObject() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: false))
        ], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"nullable\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObjectWithAdditionalPropertiesObject() {
        // TODO: add test
    }

    func test_encodeObjectWithNoPropertiesAndAdditionalPropertiesObject() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [:], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [:], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [:], additionalProperties: .init(.boolean(.init(format: .unspecified, required: false)))))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"additionalProperties\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObjectWithNoPropertiesAndAdditionalPropertiesObject() {
        // TODO: add test
    }

    func test_encodeObjectWithRequiredProperties() {
        let requiredObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: true))
        ], minProperties: 1))
        let optionalObject = JSONSchemaObject.object(.init(format: .unspecified, required: false), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: true))
        ], minProperties: 1))
        let nullableObject = JSONSchemaObject.object(.init(format: .unspecified, required: true, nullable: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: true))
        ], minProperties: 1))
        let allowedValueObject = JSONSchemaObject.object(.init(format: .unspecified, required: true), .init(properties: [
            "hello": .boolean(.init(format: .unspecified, required: true))
        ], minProperties: 1))
            .with(allowedValues: [
                AnyCodable(["hello": false])
            ])

        testEncodingPropertyLines(entity: requiredObject,
                                  propertyLines: [
                                    "\"minProperties\" : 1,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"required\" : [",
                                    "  \"hello\"",
                                    "],",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: optionalObject,
                                  propertyLines: [
                                    "\"minProperties\" : 1,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"required\" : [",
                                    "  \"hello\"",
                                    "],",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: nullableObject,
                                  propertyLines: [
                                    "\"minProperties\" : 1,",
                                    "\"nullable\" : true,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"required\" : [",
                                    "  \"hello\"",
                                    "],",
                                    "\"type\" : \"object\""
        ])

        testEncodingPropertyLines(entity: allowedValueObject,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  {",
                                    "    \"hello\" : false",
                                    "  }",
                                    "],",
                                    "\"minProperties\" : 1,",
                                    "\"properties\" : {",
                                    "  \"hello\" : {",
                                    "    \"type\" : \"boolean\"",
                                    "  }",
                                    "},",
                                    "\"required\" : [",
                                    "  \"hello\"",
                                    "],",
                                    "\"type\" : \"object\""
        ])
    }

    func test_decodeObjectWithRequiredProperties() {
        // TODO: add test
    }

    func test_encodeArray() {
        let requiredArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init())
        let optionalArray = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init())
        let nullableArray = JSONSchemaObject.array(.init(format: .unspecified, required: true, nullable: true), .init())
        let allowedValueArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: [[10]])

        testAllSharedSimpleContextEncoding(typeName: "array",
                                           requiredEntity: requiredArray,
                                           optionalEntity: optionalArray,
                                           nullableEntity: nullableArray,
                                           allowedValues: (entity: allowedValueArray,
                                                           value: "[\n      10\n    ]"))
    }

    func test_decodeArray() {
        let arrayData = #"{"type": "array"}"#.data(using: .utf8)!
        let nullableArrayData = #"{"type": "array", "nullable": true}"#.data(using: .utf8)!
        let allowedValueArrayData = #"{"type": "array", "items": { "type": "boolean" }, "enum": [[false]]}"#.data(using: .utf8)!

        let array = try! testDecoder.decode(JSONSchemaObject.self, from: arrayData)
        let nullableArray = try! testDecoder.decode(JSONSchemaObject.self, from: nullableArrayData)
        let allowedValueArray = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueArrayData)

        XCTAssertEqual(array, JSONSchemaObject.array(.init(format: .generic, required: false), .init()))
        XCTAssertEqual(nullableArray, JSONSchemaObject.array(.init(format: .generic, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueArray.allowedValues?[0].value as! [Bool], [false])

        guard case let .array(_, contextB) = allowedValueArray else {
            XCTFail("expected array")
            return
        }
        XCTAssertEqual(contextB, .init(items: .boolean(.init(format: .generic, required: false))))
    }

    func test_encodeArrayWithItemsDefinition() {
        let requiredArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: false))))
        let optionalArray = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init(items: .boolean(.init(format: .unspecified, required: false))))
        let nullableArray = JSONSchemaObject.array(.init(format: .unspecified, required: true, nullable: true), .init(items: .boolean(.init(format: .unspecified, required: false))))
        let allowedValueArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(items: .boolean(.init(format: .unspecified, required: false))))
            .with(allowedValues: [[10]])

        testEncodingPropertyLines(entity: requiredArray,
                                  propertyLines: [
                                    "\"items\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: optionalArray,
                                  propertyLines: [
                                    "\"items\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: nullableArray,
                                  propertyLines: [
                                    "\"items\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: allowedValueArray,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  [",
                                    "    10",
                                    "  ]",
                                    "],",
                                    "\"items\" : {",
                                    "  \"type\" : \"boolean\"",
                                    "},",
                                    "\"type\" : \"array\""
        ])
    }

    func test_decodeArrayWithItemsDefinition() {
        // TODO: add test
    }

    func test_encodeArrayWithAdditionalItemsDefinition() {
        // TODO: add test
    }

    func test_decodeArrayWithAdditionalItemsDefinition() {
        // TODO: add test
    }

    func test_encodeArrayWithUniqueItems() {
        let requiredArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(uniqueItems: true))
        let optionalArray = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init(uniqueItems: true))
        let nullableArray = JSONSchemaObject.array(.init(format: .unspecified, required: true, nullable: true), .init(uniqueItems: true))
        let allowedValueArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(uniqueItems: true))
            .with(allowedValues: [[10]])

        testEncodingPropertyLines(entity: requiredArray,
                                  propertyLines: [
                                    "\"type\" : \"array\",",
                                    "\"uniqueItems\" : true"
        ])

        testEncodingPropertyLines(entity: optionalArray,
                                  propertyLines: [
                                    "\"type\" : \"array\",",
                                    "\"uniqueItems\" : true"
        ])

        testEncodingPropertyLines(entity: nullableArray,
                                  propertyLines: [
                                    "\"nullable\" : true,",
                                    "\"type\" : \"array\",",
                                    "\"uniqueItems\" : true"
        ])

        testEncodingPropertyLines(entity: allowedValueArray,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  [",
                                    "    10",
                                    "  ]",
                                    "],",
                                    "\"type\" : \"array\",",
                                    "\"uniqueItems\" : true"
        ])
    }

    func test_decodeArrayWithUniqueItems() {
        // TODO: add test
    }

    func test_encodeArrayWithMaxItems() {
        let requiredArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(maxItems: 2))
        let optionalArray = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init(maxItems: 2))
        let nullableArray = JSONSchemaObject.array(.init(format: .unspecified, required: true, nullable: true), .init(maxItems: 2))
        let allowedValueArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(maxItems: 2))
            .with(allowedValues: [[10]])

        testEncodingPropertyLines(entity: requiredArray,
                                  propertyLines: [
                                    "\"maxItems\" : 2,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: optionalArray,
                                  propertyLines: [
                                    "\"maxItems\" : 2,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: nullableArray,
                                  propertyLines: [
                                    "\"maxItems\" : 2,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: allowedValueArray,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  [",
                                    "    10",
                                    "  ]",
                                    "],",
                                    "\"maxItems\" : 2,",
                                    "\"type\" : \"array\""
        ])
    }

    func test_decodeArrayWithMaxItems() {
        // TODO: add test
    }

    func test_encodeArrayWithMinItems() {
        let requiredArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(minItems: 2))
        let optionalArray = JSONSchemaObject.array(.init(format: .unspecified, required: false), .init(minItems: 2))
        let nullableArray = JSONSchemaObject.array(.init(format: .unspecified, required: true, nullable: true), .init(minItems: 2))
        let allowedValueArray = JSONSchemaObject.array(.init(format: .unspecified, required: true), .init(minItems: 2))
            .with(allowedValues: [[10]])

        testEncodingPropertyLines(entity: requiredArray,
                                  propertyLines: [
                                    "\"minItems\" : 2,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: optionalArray,
                                  propertyLines: [
                                    "\"minItems\" : 2,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: nullableArray,
                                  propertyLines: [
                                    "\"minItems\" : 2,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"array\""
        ])

        testEncodingPropertyLines(entity: allowedValueArray,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  [",
                                    "    10",
                                    "  ]",
                                    "],",
                                    "\"minItems\" : 2,",
                                    "\"type\" : \"array\""
        ])
    }

    func test_decodeArrayWithMinItems() {
        // TODO: add test
    }

    func test_encodeNumber() {
        let requiredNumber = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
        let optionalNumber = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init())
        let nullableNumber = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init())
        let allowedValueNumber = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: [10.5])

        testAllSharedSimpleContextEncoding(typeName: "number",
                                           requiredEntity: requiredNumber,
                                           optionalEntity: optionalNumber,
                                           nullableEntity: nullableNumber,
                                           allowedValues: (entity: allowedValueNumber,
                                                           value: "10.5"))
    }

    func test_decodeNumber() {
        let numberData = #"{"type": "number"}"#.data(using: .utf8)!
        let nullableNumberData = #"{"type": "number", "nullable": true}"#.data(using: .utf8)!
        let allowedValueNumberData = #"{"type": "number", "enum": [1, 2]}"#.data(using: .utf8)!

        let number = try! testDecoder.decode(JSONSchemaObject.self, from: numberData)
        let nullableNumber = try! testDecoder.decode(JSONSchemaObject.self, from: nullableNumberData)
        let allowedValueNumber = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueNumberData)

        XCTAssertEqual(number, JSONSchemaObject.number(.init(format: .generic, required: false), .init()))
        XCTAssertEqual(nullableNumber, JSONSchemaObject.number(.init(format: .generic, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueNumber, JSONSchemaObject.number(.init(format: .generic, required: false, allowedValues: [1, 2]), .init()))
    }

    func test_encodeFloatNumber() {
        let requiredNumber = JSONSchemaObject.number(.init(format: .float, required: true), .init())
        let optionalNumber = JSONSchemaObject.number(.init(format: .float, required: false), .init())
        let nullableNumber = JSONSchemaObject.number(.init(format: .float, required: true, nullable: true), .init())
        let allowedValueNumber = JSONSchemaObject.number(.init(format: .float, required: true), .init())
            .with(allowedValues: [11.5])

        testAllSharedFormattedContextEncoding(typeName: "number",
                                              formatName: "float",
                                              requiredEntity: requiredNumber,
                                              optionalEntity: optionalNumber,
                                              nullableEntity: nullableNumber,
                                              allowedValues: (entity: allowedValueNumber,
                                                              value: "11.5"))
    }

    func test_decodeFloatNumber() {
        let numberData = #"{"type": "number", "format": "float"}"#.data(using: .utf8)!
        let nullableNumberData = #"{"type": "number", "format": "float", "nullable": true}"#.data(using: .utf8)!
        let allowedValueNumberData = #"{"type": "number", "format": "float", "enum": [1, 2.5]}"#.data(using: .utf8)!

        let number = try! testDecoder.decode(JSONSchemaObject.self, from: numberData)
        let nullableNumber = try! testDecoder.decode(JSONSchemaObject.self, from: nullableNumberData)
        let allowedValueNumber = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueNumberData)

        XCTAssertEqual(number, JSONSchemaObject.number(.init(format: .float, required: false), .init()))
        XCTAssertEqual(nullableNumber, JSONSchemaObject.number(.init(format: .float, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueNumber, JSONSchemaObject.number(.init(format: .float, required: false, allowedValues: [1, 2.5]), .init()))
    }

    func test_encodeDoubleNumber() {
        let requiredNumber = JSONSchemaObject.number(.init(format: .double, required: true), .init())
        let optionalNumber = JSONSchemaObject.number(.init(format: .double, required: false), .init())
        let nullableNumber = JSONSchemaObject.number(.init(format: .double, required: true, nullable: true), .init())
        let allowedValueNumber = JSONSchemaObject.number(.init(format: .double, required: true), .init())
            .with(allowedValues: [12.5])

        testAllSharedFormattedContextEncoding(typeName: "number",
                                              formatName: "double",
                                              requiredEntity: requiredNumber,
                                              optionalEntity: optionalNumber,
                                              nullableEntity: nullableNumber,
                                              allowedValues: (entity: allowedValueNumber,
                                                              value: "12.5"))
    }

    func test_decodeDoubleNumber() {
        let numberData = #"{"type": "number", "format": "double"}"#.data(using: .utf8)!
        let nullableNumberData = #"{"type": "number", "format": "double", "nullable": true}"#.data(using: .utf8)!
        let allowedValueNumberData = #"{"type": "number", "format": "double", "enum": [1, 2]}"#.data(using: .utf8)!

        let number = try! testDecoder.decode(JSONSchemaObject.self, from: numberData)
        let nullableNumber = try! testDecoder.decode(JSONSchemaObject.self, from: nullableNumberData)
        let allowedValueNumber = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueNumberData)

        XCTAssertEqual(number, JSONSchemaObject.number(.init(format: .double, required: false), .init()))
        XCTAssertEqual(nullableNumber, JSONSchemaObject.number(.init(format: .double, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueNumber, JSONSchemaObject.number(.init(format: .double, required: false, allowedValues: [1, 2]), .init()))
    }

    func test_encodeNumberWithMultipleOf() {
        let requiredInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(multipleOf: 11))
        let optionalInteger = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init(multipleOf: 11))
        let nullableInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init(multipleOf: 11))
        let allowedValueInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(multipleOf: 11))
            .with(allowedValues: [10])

        testEncodingPropertyLines(entity: requiredInteger,
                                  propertyLines: [
                                    "\"multipleOf\" : 11,",
                                    "\"type\" : \"number\"",
        ])

        testEncodingPropertyLines(entity: optionalInteger,
                                  propertyLines: [
                                    "\"multipleOf\" : 11,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: nullableInteger,
                                  propertyLines: [
                                    "\"multipleOf\" : 11,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: allowedValueInteger,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  10",
                                    "],",
                                    "\"multipleOf\" : 11,",
                                    "\"type\" : \"number\""
        ])
    }

    func test_decodeNumberWithMultipleOf() {
        // TODO: add test
    }

    func test_encodeNumberWithMaximum() {
        let requiredInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(maximum: 11.5))
        let optionalInteger = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init(maximum: 11.5))
        let nullableInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init(maximum: 11.5))
        let allowedValueInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(maximum: 11.5))
            .with(allowedValues: [10])

        testEncodingPropertyLines(entity: requiredInteger,
                                  propertyLines: [
                                    "\"maximum\" : 11.5,",
                                    "\"type\" : \"number\"",
        ])

        testEncodingPropertyLines(entity: optionalInteger,
                                  propertyLines: [
                                    "\"maximum\" : 11.5,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: nullableInteger,
                                  propertyLines: [
                                    "\"maximum\" : 11.5,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: allowedValueInteger,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  10",
                                    "],",
                                    "\"maximum\" : 11.5,",
                                    "\"type\" : \"number\""
        ])
    }

    func test_decodeNumberWithMaximum() {
        // TODO: add test
    }

    func test_encodeNumberWithExclusiveMaximum() {
        let requiredInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(exclusiveMaximum: 11.5))
        let optionalInteger = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init(exclusiveMaximum: 11.5))
        let nullableInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init(exclusiveMaximum: 11.5))
        let allowedValueInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(exclusiveMaximum: 11.5))
            .with(allowedValues: [10])

        testEncodingPropertyLines(entity: requiredInteger,
                                  propertyLines: [
                                    "\"exclusiveMaximum\" : 11.5,",
                                    "\"type\" : \"number\"",
        ])

        testEncodingPropertyLines(entity: optionalInteger,
                                  propertyLines: [
                                    "\"exclusiveMaximum\" : 11.5,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: nullableInteger,
                                  propertyLines: [
                                    "\"exclusiveMaximum\" : 11.5,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: allowedValueInteger,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  10",
                                    "],",
                                    "\"exclusiveMaximum\" : 11.5,",
                                    "\"type\" : \"number\""
        ])
    }

    func test_decodeNumberWithExclusiveMaximum() {
        // TODO: add test
    }

    func test_encodeNumberWithMinimum() {
        let requiredInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(minimum: 0.5))
        let optionalInteger = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init(minimum: 0.5))
        let nullableInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init(minimum: 0.5))
        let allowedValueInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(minimum: 0.5))
            .with(allowedValues: [10])

        testEncodingPropertyLines(entity: requiredInteger,
                                  propertyLines: [
                                    "\"minimum\" : 0.5,",
                                    "\"type\" : \"number\"",
        ])

        testEncodingPropertyLines(entity: optionalInteger,
                                  propertyLines: [
                                    "\"minimum\" : 0.5,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: nullableInteger,
                                  propertyLines: [
                                    "\"minimum\" : 0.5,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: allowedValueInteger,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  10",
                                    "],",
                                    "\"minimum\" : 0.5,",
                                    "\"type\" : \"number\""
        ])
    }

    func test_decodeNumberWithMinimum() {
        // TODO: add test
    }

    func test_encodeNumberWithExclusivceMinimum() {
        let requiredInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(exclusiveMinimum: 0.5))
        let optionalInteger = JSONSchemaObject.number(.init(format: .unspecified, required: false), .init(exclusiveMinimum: 0.5))
        let nullableInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true, nullable: true), .init(exclusiveMinimum: 0.5))
        let allowedValueInteger = JSONSchemaObject.number(.init(format: .unspecified, required: true), .init(exclusiveMinimum: 0.5))
            .with(allowedValues: [10])

        testEncodingPropertyLines(entity: requiredInteger,
                                  propertyLines: [
                                    "\"exclusiveMinimum\" : 0.5,",
                                    "\"type\" : \"number\"",
        ])

        testEncodingPropertyLines(entity: optionalInteger,
                                  propertyLines: [
                                    "\"exclusiveMinimum\" : 0.5,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: nullableInteger,
                                  propertyLines: [
                                    "\"exclusiveMinimum\" : 0.5,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"number\""
        ])

        testEncodingPropertyLines(entity: allowedValueInteger,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  10",
                                    "],",
                                    "\"exclusiveMinimum\" : 0.5,",
                                    "\"type\" : \"number\""
        ])
    }

    func test_decodeNumberWithExclusiveMinimum() {
        // TODO: add test
    }

    func test_encodeInteger() {
        let requiredInteger = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
        let optionalInteger = JSONSchemaObject.integer(.init(format: .unspecified, required: false), .init())
        let nullableInteger = JSONSchemaObject.integer(.init(format: .unspecified, required: true, nullable: true), .init())
        let allowedValueInteger = JSONSchemaObject.integer(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: [10])

        testAllSharedSimpleContextEncoding(typeName: "integer",
                                           requiredEntity: requiredInteger,
                                           optionalEntity: optionalInteger,
                                           nullableEntity: nullableInteger,
                                           allowedValues: (entity: allowedValueInteger,
                                                           value: "10"))
    }

    func test_decodeInteger() {
        let integerData = #"{"type": "integer"}"#.data(using: .utf8)!
        let nullableIntegerData = #"{"type": "integer", "nullable": true}"#.data(using: .utf8)!
        let allowedValueIntegerData = #"{"type": "integer", "enum": [1, 2]}"#.data(using: .utf8)!

        let integer = try! testDecoder.decode(JSONSchemaObject.self, from: integerData)
        let nullableInteger = try! testDecoder.decode(JSONSchemaObject.self, from: nullableIntegerData)
        let allowedValueInteger = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueIntegerData)

        XCTAssertEqual(integer, JSONSchemaObject.integer(.init(format: .generic, required: false), .init()))
        XCTAssertEqual(nullableInteger, JSONSchemaObject.integer(.init(format: .generic, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueInteger, JSONSchemaObject.integer(.init(format: .generic, required: false, allowedValues: [1, 2]), .init()))
    }

    func test_encode32bitInteger() {
        let requiredInteger = JSONSchemaObject.integer(.init(format: .int32, required: true), .init())
        let optionalInteger = JSONSchemaObject.integer(.init(format: .int32, required: false), .init())
        let nullableInteger = JSONSchemaObject.integer(.init(format: .int32, required: true, nullable: true), .init())
        let allowedValueInteger = JSONSchemaObject.integer(.init(format: .int32, required: true), .init())
            .with(allowedValues: [11])

        testAllSharedFormattedContextEncoding(typeName: "integer",
                                              formatName: "int32",
                                              requiredEntity: requiredInteger,
                                              optionalEntity: optionalInteger,
                                              nullableEntity: nullableInteger,
                                              allowedValues: (entity: allowedValueInteger,
                                                              value: "11"))
    }

    func test_decode32bitInteger() {
        let integerData = #"{"type": "integer", "format": "int32"}"#.data(using: .utf8)!
        let nullableIntegerData = #"{"type": "integer", "format": "int32", "nullable": true}"#.data(using: .utf8)!
        let allowedValueIntegerData = #"{"type": "integer", "format": "int32", "enum": [1, 2]}"#.data(using: .utf8)!

        let integer = try! testDecoder.decode(JSONSchemaObject.self, from: integerData)
        let nullableInteger = try! testDecoder.decode(JSONSchemaObject.self, from: nullableIntegerData)
        let allowedValueInteger = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueIntegerData)

        XCTAssertEqual(integer, JSONSchemaObject.integer(.init(format: .int32, required: false), .init()))
        XCTAssertEqual(nullableInteger, JSONSchemaObject.integer(.init(format: .int32, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueInteger, JSONSchemaObject.integer(.init(format: .int32, required: false, allowedValues: [1, 2]), .init()))
    }

    func test_encode64bitInteger() {
        let requiredInteger = JSONSchemaObject.integer(.init(format: .int64, required: true), .init())
        let optionalInteger = JSONSchemaObject.integer(.init(format: .int64, required: false), .init())
        let nullableInteger = JSONSchemaObject.integer(.init(format: .int64, required: true, nullable: true), .init())
        let allowedValueInteger = JSONSchemaObject.integer(.init(format: .int64, required: true), .init())
            .with(allowedValues: [12])

        testAllSharedFormattedContextEncoding(typeName: "integer",
                                              formatName: "int64",
                                              requiredEntity: requiredInteger,
                                              optionalEntity: optionalInteger,
                                              nullableEntity: nullableInteger,
                                              allowedValues: (entity: allowedValueInteger,
                                                              value: "12"))
    }

    func test_decode64bitInteger() {
        let integerData = #"{"type": "integer", "format": "int64"}"#.data(using: .utf8)!
        let nullableIntegerData = #"{"type": "integer", "format": "int64", "nullable": true}"#.data(using: .utf8)!
        let allowedValueIntegerData = #"{"type": "integer", "format": "int64", "enum": [1, 2]}"#.data(using: .utf8)!

        let integer = try! testDecoder.decode(JSONSchemaObject.self, from: integerData)
        let nullableInteger = try! testDecoder.decode(JSONSchemaObject.self, from: nullableIntegerData)
        let allowedValueInteger = try! testDecoder.decode(JSONSchemaObject.self, from: allowedValueIntegerData)

        XCTAssertEqual(integer, JSONSchemaObject.integer(.init(format: .int64, required: false), .init()))
        XCTAssertEqual(nullableInteger, JSONSchemaObject.integer(.init(format: .int64, required: false, nullable: true), .init()))
        XCTAssertEqual(allowedValueInteger, JSONSchemaObject.integer(.init(format: .int64, required: false, allowedValues: [1, 2]), .init()))
    }

    func test_encodeString() {
        let requiredString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
        let optionalString = JSONSchemaObject.string(.init(format: .unspecified, required: false), .init())
        let nullableString = JSONSchemaObject.string(.init(format: .unspecified, required: true, nullable: true), .init())
        let allowedValueString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init())
            .with(allowedValues: ["hello"])

        testAllSharedSimpleContextEncoding(typeName: "string",
                                           requiredEntity: requiredString,
                                           optionalEntity: optionalString,
                                           nullableEntity: nullableString,
                                           allowedValues: (entity: allowedValueString,
                                                           value: "\"hello\""))
    }

    func test_decodeString() {
        // TODO: add test
    }

    func test_encodeByteString() {
        let requiredString = JSONSchemaObject.string(.init(format: .byte, required: true), .init())
        let optionalString = JSONSchemaObject.string(.init(format: .byte, required: false), .init())
        let nullableString = JSONSchemaObject.string(.init(format: .byte, required: true, nullable: true), .init())
        let allowedValueString = JSONSchemaObject.string(.init(format: .byte, required: true), .init())
            .with(allowedValues: ["hello"])

        testAllSharedFormattedContextEncoding(typeName: "string",
                                              formatName: "byte",
                                              requiredEntity: requiredString,
                                              optionalEntity: optionalString,
                                              nullableEntity: nullableString,
                                              allowedValues: (entity: allowedValueString,
                                                              value: "\"hello\""))
    }

    func test_decodeByteString() {
        // TODO: add test
    }

    func test_encodeBinaryString() {
        let requiredString = JSONSchemaObject.string(.init(format: .binary, required: true), .init())
        let optionalString = JSONSchemaObject.string(.init(format: .binary, required: false), .init())
        let nullableString = JSONSchemaObject.string(.init(format: .binary, required: true, nullable: true), .init())
        let allowedValueString = JSONSchemaObject.string(.init(format: .binary, required: true), .init())
            .with(allowedValues: ["hello"])

        testAllSharedFormattedContextEncoding(typeName: "string",
                                              formatName: "binary",
                                              requiredEntity: requiredString,
                                              optionalEntity: optionalString,
                                              nullableEntity: nullableString,
                                              allowedValues: (entity: allowedValueString,
                                                              value: "\"hello\""))
    }

    func test_decodeBinaryString() {
        // TODO: add test
    }

    func test_encodeDateString() {
        let requiredString = JSONSchemaObject.string(.init(format: .date, required: true), .init())
        let optionalString = JSONSchemaObject.string(.init(format: .date, required: false), .init())
        let nullableString = JSONSchemaObject.string(.init(format: .date, required: true, nullable: true), .init())
        let allowedValueString = JSONSchemaObject.string(.init(format: .date, required: true), .init())
            .with(allowedValues: ["hello"])

        testAllSharedFormattedContextEncoding(typeName: "string",
                                              formatName: "date",
                                              requiredEntity: requiredString,
                                              optionalEntity: optionalString,
                                              nullableEntity: nullableString,
                                              allowedValues: (entity: allowedValueString,
                                                              value: "\"hello\""))
    }

    func test_decodeDateString() {
        // TODO: add test
    }

    func test_encodeDateTimeString() {
        let requiredString = JSONSchemaObject.string(.init(format: .dateTime, required: true), .init())
        let optionalString = JSONSchemaObject.string(.init(format: .dateTime, required: false), .init())
        let nullableString = JSONSchemaObject.string(.init(format: .dateTime, required: true, nullable: true), .init())
        let allowedValueString = JSONSchemaObject.string(.init(format: .dateTime, required: true), .init())
            .with(allowedValues: ["hello"])

        testAllSharedFormattedContextEncoding(typeName: "string",
                                              formatName: "date-time",
                                              requiredEntity: requiredString,
                                              optionalEntity: optionalString,
                                              nullableEntity: nullableString,
                                              allowedValues: (entity: allowedValueString,
                                                              value: "\"hello\""))
    }

    func test_decodeDateTimeString() {
        // TODO: add test
    }

    func test_encodePasswordString() {
        let requiredString = JSONSchemaObject.string(.init(format: .password, required: true), .init())
        let optionalString = JSONSchemaObject.string(.init(format: .password, required: false), .init())
        let nullableString = JSONSchemaObject.string(.init(format: .password, required: true, nullable: true), .init())
        let allowedValueString = JSONSchemaObject.string(.init(format: .password, required: true), .init())
            .with(allowedValues: ["hello"])

        testAllSharedFormattedContextEncoding(typeName: "string",
                                              formatName: "password",
                                              requiredEntity: requiredString,
                                              optionalEntity: optionalString,
                                              nullableEntity: nullableString,
                                              allowedValues: (entity: allowedValueString,
                                                              value: "\"hello\""))
    }

    func test_decodePasswordString() {
        // TODO: add test
    }

    func test_encodeStringWithMaxLength() {
        let requiredString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init(maxLength: 10))
        let optionalString = JSONSchemaObject.string(.init(format: .unspecified, required: false), .init(maxLength: 10))
        let nullableString = JSONSchemaObject.string(.init(format: .unspecified, required: true, nullable: true), .init(maxLength: 10))
        let allowedValueString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init(maxLength: 10))
            .with(allowedValues: ["hello"])

        testEncodingPropertyLines(entity: requiredString,
                                  propertyLines: [
                                    "\"maxLength\" : 10,",
                                    "\"type\" : \"string\"",
        ])

        testEncodingPropertyLines(entity: optionalString,
                                  propertyLines: [
                                    "\"maxLength\" : 10,",
                                    "\"type\" : \"string\""
        ])

        testEncodingPropertyLines(entity: nullableString,
                                  propertyLines: [
                                    "\"maxLength\" : 10,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"string\""
        ])

        testEncodingPropertyLines(entity: allowedValueString,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  \"hello\"",
                                    "],",
                                    "\"maxLength\" : 10,",
                                    "\"type\" : \"string\""
        ])
    }

    func test_decodeStringWithMaxLength() {
        // TODO: add test
    }

    func test_encodeStringWithMinLength() {
        let requiredString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init(minLength: 5))
        let optionalString = JSONSchemaObject.string(.init(format: .unspecified, required: false), .init(minLength: 5))
        let nullableString = JSONSchemaObject.string(.init(format: .unspecified, required: true, nullable: true), .init(minLength: 5))
        let allowedValueString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init(minLength: 5))
            .with(allowedValues: ["hello"])

        testEncodingPropertyLines(entity: requiredString,
                                  propertyLines: [
                                    "\"minLength\" : 5,",
                                    "\"type\" : \"string\"",
        ])

        testEncodingPropertyLines(entity: optionalString,
                                  propertyLines: [
                                    "\"minLength\" : 5,",
                                    "\"type\" : \"string\""
        ])

        testEncodingPropertyLines(entity: nullableString,
                                  propertyLines: [
                                    "\"minLength\" : 5,",
                                    "\"nullable\" : true,",
                                    "\"type\" : \"string\""
        ])

        testEncodingPropertyLines(entity: allowedValueString,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  \"hello\"",
                                    "],",
                                    "\"minLength\" : 5,",
                                    "\"type\" : \"string\""
        ])
    }

    func test_decodeStringWithMinLength() {
        // TODO: add test
    }

    func test_encodeStringWithPattern() {
        let requiredString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init(pattern: ".*hello [wW]orld"))
        let optionalString = JSONSchemaObject.string(.init(format: .unspecified, required: false), .init(pattern: ".*hello [wW]orld"))
        let nullableString = JSONSchemaObject.string(.init(format: .unspecified, required: true, nullable: true), .init(pattern: ".*hello [wW]orld"))
        let allowedValueString = JSONSchemaObject.string(.init(format: .unspecified, required: true), .init(pattern: ".*hello [wW]orld"))
            .with(allowedValues: ["hello World"])

        testEncodingPropertyLines(entity: requiredString,
                                  propertyLines: [
                                    "\"pattern\" : \".*hello [wW]orld\",",
                                    "\"type\" : \"string\"",
        ])

        testEncodingPropertyLines(entity: optionalString,
                                  propertyLines: [
                                    "\"pattern\" : \".*hello [wW]orld\",",
                                    "\"type\" : \"string\""
        ])

        testEncodingPropertyLines(entity: nullableString,
                                  propertyLines: [
                                    "\"nullable\" : true,",
                                    "\"pattern\" : \".*hello [wW]orld\",",
                                    "\"type\" : \"string\""
        ])

        testEncodingPropertyLines(entity: allowedValueString,
                                  propertyLines: [
                                    "\"enum\" : [",
                                    "  \"hello World\"",
                                    "],",
                                    "\"pattern\" : \".*hello [wW]orld\",",
                                    "\"type\" : \"string\""
        ])
    }

    func test_decodeStringWithPattern() {
        // TODO: add test
    }

    func test_encodeAll() {
        let allOf = JSONSchemaObject.all(of: [
            .object(.init(format: .unspecified, required: true), .init(properties: ["hello": .string(.init(format: .generic, required: false), .init())])),
            .object(.init(format: .unspecified, required: true), .init(properties: ["world": .boolean(.init(format: .generic, required: false))]))
        ])

        testEncodingPropertyLines(entity: allOf, propertyLines: [
            "\"allOf\" : [",
            "  {",
            "    \"properties\" : {",
            "      \"hello\" : {",
            "        \"type\" : \"string\"",
            "      }",
            "    },",
            "    \"type\" : \"object\"",
            "  },",
            "  {",
            "    \"properties\" : {",
            "      \"world\" : {",
            "        \"type\" : \"boolean\"",
            "      }",
            "    },",
            "    \"type\" : \"object\"",
            "  }",
            "]"
        ])
    }

    func test_decodeAll() {
        let allData = """
        {
            "allOf": [
                { "type": "object" },
                { "type": "object", "properties": { "hello": { "type": "boolean" } } }
            ]
        }
        """.data(using: .utf8)!

        let all = try! testDecoder.decode(JSONSchemaObject.self, from: allData)

        XCTAssertEqual(all, JSONSchemaObject.all(of: [
            .object(.init(format: .generic, required: false), .init(properties: [:])),
            .object(.init(format: .generic, required: false), .init(properties: ["hello": .boolean(.init(format: .generic, required: false))]))
        ]))
    }

    func test_encodeOne() {
        let oneOf = JSONSchemaObject.one(of: [
            .object(.init(format: .unspecified, required: true), .init(properties: ["hello": .string(.init(format: .generic, required: false), .init())])),
            .object(.init(format: .unspecified, required: true), .init(properties: ["world": .boolean(.init(format: .generic, required: false))]))
        ])

        testEncodingPropertyLines(entity: oneOf, propertyLines: [
            "\"oneOf\" : [",
            "  {",
            "    \"properties\" : {",
            "      \"hello\" : {",
            "        \"type\" : \"string\"",
            "      }",
            "    },",
            "    \"type\" : \"object\"",
            "  },",
            "  {",
            "    \"properties\" : {",
            "      \"world\" : {",
            "        \"type\" : \"boolean\"",
            "      }",
            "    },",
            "    \"type\" : \"object\"",
            "  }",
            "]"
        ])
    }

    func test_decodeOne() {
        let oneData = """
        {
            "oneOf": [
                { "type": "object" },
                { "type": "object", "properties": { "hello": { "type": "boolean" } } }
            ]
        }
        """.data(using: .utf8)!

        let one = try! testDecoder.decode(JSONSchemaObject.self, from: oneData)

        XCTAssertEqual(one, JSONSchemaObject.one(of: [
            .object(.init(format: .generic, required: false), .init(properties: [:])),
            .object(.init(format: .generic, required: false), .init(properties: ["hello": .boolean(.init(format: .generic, required: false))]))
        ]))
    }

    func test_encodeAny() {
        let anyOf = JSONSchemaObject.any(of: [
            .object(.init(format: .unspecified, required: true), .init(properties: ["hello": .string(.init(format: .generic, required: false), .init())])),
            .object(.init(format: .unspecified, required: true), .init(properties: ["world": .boolean(.init(format: .generic, required: false))]))
        ])

        testEncodingPropertyLines(entity: anyOf, propertyLines: [
            "\"anyOf\" : [",
            "  {",
            "    \"properties\" : {",
            "      \"hello\" : {",
            "        \"type\" : \"string\"",
            "      }",
            "    },",
            "    \"type\" : \"object\"",
            "  },",
            "  {",
            "    \"properties\" : {",
            "      \"world\" : {",
            "        \"type\" : \"boolean\"",
            "      }",
            "    },",
            "    \"type\" : \"object\"",
            "  }",
            "]"
        ])
    }

    func test_decodeAny() {
        let anyData = """
        {
            "anyOf": [
                { "type": "boolean" },
                { "type": "object" }
            ]
        }
        """.data(using: .utf8)!

        let any = try! testDecoder.decode(JSONSchemaObject.self, from: anyData)

        XCTAssertEqual(any, JSONSchemaObject.any(of: [
            .boolean(.init(format: .generic, required: false)),
            .object(.init(format: .generic, required: false), .init(properties: [:]))
        ]))
    }

    func test_encodeNot() {
        let not = JSONSchemaObject.not(.object(.init(format: .unspecified, required: true), .init(properties: ["hello": .string(.init(format: .generic, required: false), .init())])))

        testEncodingPropertyLines(entity: not, propertyLines: [
            "\"not\" : {",
            "  \"properties\" : {",
            "    \"hello\" : {",
            "      \"type\" : \"string\"",
            "    }",
            "  },",
            "  \"type\" : \"object\"",
            "}"
        ])
    }

    func test_decodeNot() {
        let notData = """
        {
            "not": {
                "type": "boolean"
            }
        }
        """.data(using: .utf8)!

        let not = try! testDecoder.decode(JSONSchemaObject.self, from: notData)

        XCTAssertEqual(not, JSONSchemaObject.not(.boolean(.init(format: .generic, required: false))))
    }

    func test_encodeFileReference() {
        let fileRef = JSONSchemaObject.reference(.file("hello/world.json#/hello"))

        testEncodingPropertyLines(entity: fileRef, propertyLines: [
            "\"$ref\" : \"hello\\/world.json#\\/hello\""
        ])
    }

    func test_decodeFileReference() {
        // TODO: add test
    }

    func test_encodeNodeReference() {
//        let components = OpenAPI.Components(schemas: ["requiredBool": .boolean(.init(format: .unspecified, required: true))],
//                                            parameters: [:])
        let nodeRef = JSONSchemaObject.reference(.node(.init(type: \.schemas, selector: "requiredBool")))

        testEncodingPropertyLines(entity: nodeRef, propertyLines: [
            "\"$ref\" : \"#\\/components\\/schemas\\/requiredBool\""
        ])
    }

    func test_decodeNodeReference() {
        // TODO: add test
    }
}

private func testEncodingPropertyLines<T: Encodable>(entity: T, propertyLines: [String]) {
    var expectedString = "{\n"
    for line in propertyLines {
        expectedString += "  " + line + "\n"
    }
    expectedString += "}"

    XCTAssertEqual(try? testStringFromEncoding(of: entity), expectedString)
}

private func testAllSharedSimpleContextEncoding<T: Encodable>(
    typeName: String,
    requiredEntity: T,
    optionalEntity: T,
    nullableEntity: T,
    allowedValues: (entity: T, value: String)
    ) {
    testEncodingPropertyLines(entity: requiredEntity,
                              propertyLines: ["\"type\" : \"\(typeName)\""])

    testEncodingPropertyLines(entity: optionalEntity,
                              propertyLines: ["\"type\" : \"\(typeName)\""])

    testEncodingPropertyLines(entity: nullableEntity,
                              propertyLines: [
                                "\"nullable\" : true,",
                                "\"type\" : \"\(typeName)\""
    ])

    testEncodingPropertyLines(entity: allowedValues.entity,
                              propertyLines: [
                                "\"enum\" : [",
                                "  \(allowedValues.value)",
                                "],",
                                "\"type\" : \"\(typeName)\""

    ])
}

private func testAllSharedFormattedContextEncoding<T: Encodable>(
    typeName: String,
    formatName: String,
    requiredEntity: T,
    optionalEntity: T,
    nullableEntity: T,
    allowedValues: (entity: T, value: String)
    ) {
    testEncodingPropertyLines(entity: requiredEntity,
                              propertyLines: [
                                "\"format\" : \"\(formatName)\",",
                                "\"type\" : \"\(typeName)\""
    ])

    testEncodingPropertyLines(entity: optionalEntity,
                              propertyLines: [
                                "\"format\" : \"\(formatName)\",",
                                "\"type\" : \"\(typeName)\""
    ])

    testEncodingPropertyLines(entity: nullableEntity,
                              propertyLines: [
                                "\"format\" : \"\(formatName)\",",
                                "\"nullable\" : true,",
                                "\"type\" : \"\(typeName)\""
    ])

    testEncodingPropertyLines(entity: allowedValues.entity,
                              propertyLines: [
                                "\"enum\" : [",
                                "  \(allowedValues.value)",
                                "],",
                                "\"format\" : \"\(formatName)\",",
                                "\"type\" : \"\(typeName)\""
    ])
}
