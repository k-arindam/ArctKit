//
//  ArctUtils.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

/// A utility protocol defining various validation and file-type detection methods.
///
/// This protocol provides helper functions for common string and file validations,
/// such as checking email formats, username validity, numeric-only values,
/// and detecting file types based on their URLs.
internal protocol ArctUtils {
    
    // MARK: - String Validation
    
    /// Checks if the given string is a valid email address.
    ///
    /// - Parameter _: The string to validate.
    /// - Returns: `true` if the string is a valid email, `false` otherwise.
    func isEmail(_: String) -> Bool
    
    /// Checks if the given string is a valid username.
    ///
    /// - Parameter _: The string to validate.
    /// - Returns: `true` if the string follows username constraints, `false` otherwise.
    func isUsername(_: String) -> Bool
    
    /// Checks if the given string is a valid phone number.
    ///
    /// - Parameter _: The string to validate.
    /// - Returns: `true` if the string is a valid phone number, `false` otherwise.
    func isPhoneNumber(_: String) -> Bool

    // MARK: - Character Type Checks
    
    /// Checks if the given string contains only numeric characters.
    func isNumericOnly(_: String) -> Bool
    
    /// Checks if the given string contains only alphabetic characters.
    func isAlphabetOnly(_: String) -> Bool
    
    /// Checks if the given string contains at least one capital letter.
    func hasCapitalLetter(_: String) -> Bool

    // MARK: - File Type Detection
    
    /// Checks if the given URL points to a video file.
    func isVideo(_: URL) -> Bool
    
    /// Checks if the given URL points to an image file.
    func isImage(_: URL) -> Bool
    
    /// Checks if the given URL points to an audio file.
    func isAudio(_: URL) -> Bool

    // MARK: - Document Type Detection
    
    /// Checks if the given URL points to a Word document.
    func isWord(_: URL) -> Bool
    
    /// Checks if the given URL points to a PowerPoint file.
    func isPPT(_: URL) -> Bool
    
    /// Checks if the given URL points to an Excel file.
    func isExcel(_: URL) -> Bool
    
    /// Checks if the given URL points to a PDF document.
    func isPDF(_: URL) -> Bool
    
    /// Checks if the given URL points to a plain text file.
    func isTxt(_: URL) -> Bool
    
    /// Checks if the given URL points to an HTML file.
    func isHTML(_: URL) -> Bool

    // MARK: - Security & Networking Validation
    
    /// Checks if the given string is in a valid date-time format.
    func isDateTime(_: String) -> Bool
    
    /// Checks if the given string is a valid SHA-1 hash.
    func isSHA1(_: String) -> Bool
    
    /// Checks if the given string is a valid SHA-256 hash.
    func isSHA256(_: String) -> Bool
    
    /// Checks if the given string is a valid IPv4 address.
    func isIPv4(_: String) -> Bool
    
    /// Checks if the given string is a valid IPv6 address.
    func isIPv6(_: String) -> Bool
    
    /// Checks if the given string is a valid hexadecimal number.
    func isHexadecimal(_: String) -> Bool
}
