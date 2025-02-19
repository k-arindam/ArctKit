//
//  ArctUtils.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

internal protocol ArctUtils {
    func isEmail(_ email: String) -> Bool
    
    func isNumericOnly(_ input: String) -> Bool /// r'^\d+$'
    func isAlphabetOnly(_ input: String) -> Bool /// r'^[a-zA-Z]+$'
    func hasCapitalLetter(_ input: String) -> Bool /// r'[A-Z]'

    func isVideo(_ path: String) -> Bool
    func isImage(_ path: String) -> Bool
    func isAudio(_ path: String) -> Bool
    
    func isWord(_ path: String) -> Bool
    func isPPT(_ path: String) -> Bool
    func isExcel(_ path: String) -> Bool
    func isPDF(_ path: String) -> Bool
    func isTxt(_ path: String) -> Bool
    func isHTML(_ path: String) -> Bool
    
    func isDateTime(_ input: String) -> Bool /// r'^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$'
    func isSHA1(_ input: String) -> Bool /// r'(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})'
    func isSHA256(_ input: String) -> Bool /// r'([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}'
    func isIPv4(_ input: String) -> Bool /// r'^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$'
    func isIPv6(_ input: String) -> Bool
    func isHexadecimal(_ input: String) -> Bool /// r'^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$'
}
