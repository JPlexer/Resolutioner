//
//  DataModel.swift
//  Resolutioner
//
//  Created by Dylan McDonald on 4/19/21.
//

import UIKit
import HandySwift

func generateRandomIdentifier() -> String {
    return String(randomWithLength: 20, allowedCharactersType: .alphaNumeric)
}

func allPresetsIDs() -> [String] {
    return UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
}

func PresetsID(forIndex: Int) -> String {
    var toReturn: String = ""
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        toReturn = IDs[forIndex]
    }
    
    return toReturn
}

func PresetName(forIndex: Int) -> String {
    var toReturn: String = ""
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        toReturn = UserDefaults.standard.string(forKey: "NameForID\(IDs[forIndex])") ?? ""
    }
    
    return toReturn
}

func PresetResSideOne(forIndex: Int) -> String {
    var toReturn: String = ""
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        toReturn = UserDefaults.standard.string(forKey: "ResolutionSideOneForID\(IDs[forIndex])") ?? ""
    }
    
    return toReturn
}
func PresetResSideTwo(forIndex: Int) -> String {
    var toReturn: String = ""
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        toReturn = UserDefaults.standard.string(forKey: "ResolutionSideTwoForID\(IDs[forIndex])") ?? ""
    }
    
    return toReturn
}

func SaveName(with: String, forIndex: Int) {
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        UserDefaults.standard.set(with, forKey: "NameForID\(IDs[forIndex])")
    } else {
        print("ERROR: IDs OUT OF RANGE")
    }
}

func SaveResSideOne(with: String, forIndex: Int) {
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        UserDefaults.standard.set(with, forKey: "ResolutionSideOneForID\(IDs[forIndex])")
    } else {
        print("ERROR: IDs OUT OF RANGE")
    }
}

func SaveResSideTwo(with: String, forIndex: Int) {
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        UserDefaults.standard.set(with, forKey: "ResolutionSideTwoForID\(IDs[forIndex])")
    } else {
        print("ERROR: IDs OUT OF RANGE")
    }
}

func SaveAllIDs(with: [String]) {
    UserDefaults.standard.set(with, forKey: "PresetsIDs")
}

func DeleteName(forIndex: Int) {
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        UserDefaults.standard.removeObject(forKey: "NameForID\(IDs[forIndex])")
    } else {
        print("ERROR: IDs OUT OF RANGE")
    }
}

func DeleteResSideOne(forIndex: Int) {
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        UserDefaults.standard.removeObject(forKey: "ResolutionSideOneForID\(IDs[forIndex])")
    } else {
        print("ERROR: IDs OUT OF RANGE")
    }
}

func DeleteResSideTwo(forIndex: Int) {
    let IDs = UserDefaults.standard.stringArray(forKey: "PresetsIDs") ?? [String]()
    
    if IDs.indices.contains(forIndex) {
        UserDefaults.standard.removeObject(forKey: "ResolutionSideTwoForID\(IDs[forIndex])")
    } else {
        print("ERROR: IDs OUT OF RANGE")
    }
}




func sideOne() -> Double {
    return UserDefaults.standard.double(forKey: "SideOne")
}

func sideTwo() -> Double {
    return UserDefaults.standard.double(forKey: "SideTwo")
}

func saveSideOne(with: Double) {
    UserDefaults.standard.set(with, forKey: "SideOne")
}

func saveSideTwo(with: Double) {
    UserDefaults.standard.set(with, forKey: "SideTwo")
}
