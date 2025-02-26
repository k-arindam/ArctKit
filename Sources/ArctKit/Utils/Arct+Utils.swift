//
//  Arct+Utils.swift
//  ArctKit
//
//  Created by Arindam Karmakar on 19/02/25.
//

import Foundation

/// Extends `ArctImpl` to conform to `ArctUtils`, providing utility functions
/// for string validation, file type detection, and security checks.
extension ArctImpl: ArctUtils {
    
    // MARK: - String Validation
    
    /// Checks if the given string is a valid email address.
    ///
    /// - Parameter email: The string to validate.
    /// - Returns: `true` if the string is a valid email, `false` otherwise.
    public func isEmail(_ email: String) -> Bool {
        let pattern: Regex = /^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
        return email.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid username.
    ///
    /// - Parameter username: The string to validate.
    /// - Returns: `true` if the string follows username constraints, `false` otherwise.
    public func isUsername(_ username: String) -> Bool {
        let pattern: Regex = /^[a-zA-Z0-9][a-zA-Z0-9_.]+[a-zA-Z0-9]$/
        return username.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid phone number.
    ///
    /// - Parameter phone: The string to validate.
    /// - Returns: `true` if the string is a valid phone number, `false` otherwise.
    public func isPhoneNumber(_ phone: String) -> Bool {
        if phone.count < 9 || phone.count > 16 { return false }
        let pattern: Regex = /^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\.\/0-9]*$/
        return phone.wholeMatch(of: pattern) != nil
    }
    
    // MARK: - Character Type Checks
    
    /// Checks if the given string contains only numeric characters.
    public func isNumericOnly(_ input: String) -> Bool {
        let pattern: Regex = /^\d+$/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string contains only alphabetic characters.
    public func isAlphabetOnly(_ input: String) -> Bool {
        let pattern: Regex = /^[a-zA-Z]+$/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string contains at least one capital letter.
    public func hasCapitalLetter(_ input: String) -> Bool {
        let pattern: Regex = /[A-Z]$/
        return input.wholeMatch(of: pattern) != nil
    }
    
    // MARK: - File Type Detection
    
    /// Checks if the given URL points to a video file.
    public func isVideo(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return ["mp4", "mov", "avi", "mkv", "wmv", "mpeg", "3gp"].contains(url.pathExtension)
    }
    
    /// Checks if the given URL points to an image file.
    public func isImage(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return ["jpg", "jpeg", "png", "gif", "bmp", "webp", "heic", "svg", "ico", "avif"].contains(url.pathExtension)
    }
    
    /// Checks if the given URL points to an audio file.
    public func isAudio(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return ["mp3", "wav", "aac", "ogg", "flac", "m4a", "wma", "amr"].contains(url.pathExtension)
    }
    
    // MARK: - Document Type Detection
    
    /// Checks if the given URL points to a Word document.
    public func isWord(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return ["doc", "docx"].contains(url.pathExtension)
    }
    
    /// Checks if the given URL points to a PowerPoint file.
    public func isPPT(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return ["ppt", "pptx"].contains(url.pathExtension)
    }
    
    /// Checks if the given URL points to an Excel file.
    public func isExcel(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return ["xls", "xlsx"].contains(url.pathExtension)
    }
    
    /// Checks if the given URL points to a PDF document.
    public func isPDF(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return "pdf" == url.pathExtension
    }
    
    /// Checks if the given URL points to a plain text file.
    public func isTxt(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return "txt" == url.pathExtension
    }
    
    /// Checks if the given URL points to an HTML file.
    public func isHTML(_ url: URL) -> Bool {
        guard url.isFileURL else { return false }
        return "html" == url.pathExtension
    }
    
    // MARK: - Security & Networking Validation
    
    /// Checks if the given string is in a valid date-time format.
    public func isDateTime(_ input: String) -> Bool {
        let pattern: Regex = /^\d{4}-\d{2}-\d{2}[ T]\d{2}:\d{2}:\d{2}.\d{3}Z?$/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid SHA-1 hash.
    public func isSHA1(_ input: String) -> Bool {
        let pattern: Regex = /(([A-Fa-f0-9]{2}\:){19}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{40})/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid SHA-256 hash.
    public func isSHA256(_ input: String) -> Bool {
        let pattern: Regex = /([A-Fa-f0-9]{2}\:){31}[A-Fa-f0-9]{2}|[A-Fa-f0-9]{64}/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid IPv4 address.
    public func isIPv4(_ input: String) -> Bool {
        let pattern: Regex = /^(?:(?:^|\.)(?:2(?:5[0-5]|[0-4]\d)|1?\d?\d)){4}$/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid IPv6 address.
    public func isIPv6(_ input: String) -> Bool {
        let pattern: Regex = /^((([0-9A-Fa-f]{1,4}:){7}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}:[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){5}:([0-9A-Fa-f]{1,4}:)?[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){4}:([0-9A-Fa-f]{1,4}:){0,2}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){3}:([0-9A-Fa-f]{1,4}:){0,3}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){2}:([0-9A-Fa-f]{1,4}:){0,4}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){6}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(([0-9A-Fa-f]{1,4}:){0,5}:((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|(::([0-9A-Fa-f]{1,4}:){0,5}((\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b)\.){3}(\b((25[0-5])|(1\d{2})|(2[0-4]\d)|(\d{1,2}))\b))|([0-9A-Fa-f]{1,4}::([0-9A-Fa-f]{1,4}:){0,5}[0-9A-Fa-f]{1,4})|(::([0-9A-Fa-f]{1,4}:){0,6}[0-9A-Fa-f]{1,4})|(([0-9A-Fa-f]{1,4}:){1,7}:))$/
        return input.wholeMatch(of: pattern) != nil
    }
    
    /// Checks if the given string is a valid hexadecimal number.
    public func isHexadecimal(_ input: String) -> Bool {
        let pattern: Regex = /^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{6})$/
        return input.wholeMatch(of: pattern) != nil
    }
}
