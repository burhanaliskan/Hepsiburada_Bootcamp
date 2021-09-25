//
//  AlgorithmManager.swift
//  iOS_Week_1
//
//  Created by Erkut Bas on 19.09.2021.
//

import Foundation

class AlgoruthmManager: AlgorithmProtocol {
    
    // MARK: - Two Sum
    /*
     Given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.
     You may assume that each input would have exactly one solution, and you may not use the same element twice.
     You can return the answer in any order.
     
     Input: nums = [2,7,11,15], target = 9
     Output: [0,1]
     Output: Because nums[0] + nums[1] == 9, we return [0, 1].
     */
    func twoSumTest() {
        let nums = [2,7,11,15]
        let target = 9
        let result = twoSum(nums, target)
        
        if result != [-1] {
            print("result : \(result)")
        } else {
            print("Not true")
        }
    }
    
    private func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var result: [Int] = []
        
        for index in 0...nums.count - 1 {
            for indis in 0...nums.count - 1 {
                if nums[index] + nums[indis] == target {
                    result = [index,indis]
                    return result
                }
            }
        }
        return [-1]
    }
    
    // MARK: - IsPalindrome
    /*
     Given a string s, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
     Input: s = "A man, a plan, a canal: Panama"
     Output: true
     Explanation: "amanaplanacanalpanama" is a palindrome.
     */
    func isPalindromTest() {
        let text: String = "A man, a plan, a canal: Panama"
        let result = isPalindrome(text)
        
        if result {
            print("\(text) is palindrome")
        } else {
            print("\(text) is not palindrome")
        }
        
    }
  
    func isPalindrome(_ text: String) -> Bool {
        let unsafeChars = CharacterSet.alphanumerics.inverted
        let trimmedString = text.replacingOccurrences(of: " ", with: "").lowercased()
        let myStrippedString = trimmedString.components(separatedBy: unsafeChars).joined(separator: "")
        let reverseString = String(myStrippedString.reversed())
        
        if myStrippedString == reverseString {
            return true
        } else {
            return false
        }
    }

    
    // MARK: - Valid Anagram
    /*
     Given two strings s and t, return true if t is an anagram of s, and false otherwise.
     Input: s = "anagram", t = "nagaram"
     Output: true
     */
    func isAnagramTest() {
        let string = "anagram"
        let text = "nagram"
        
        let result = isAnagram(string, text)
       
        if result {
            print("\(string), \(text) is anagram")
        } else {
            print("\(string), \(text) is not anagram")
        }
    }
    

    func isAnagram(_ s: String, _ t: String) -> Bool {

        if s.count != t.count {
            return false
        }
        
        var stringArray = Array(s)
        var textArray = Array(t)
        
        stringArray = stringArray.sorted()
        textArray = textArray.sorted()
        
        for index in 0...stringArray.count - 1 {
            if stringArray[index] != textArray[index] {
                return false
            }
        }
        return true
    }
    
    // MARK: - Contains Duplicate
    /*
     Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
     Input: nums = [1,2,3,1]
     Output: true
     Input: nums = [1,2,3,4]
     Output: false
     */
    func duplicateTest() {
        
        let nums: [Int] = [1,2,3,1]
        
        let result = containsDuplicate(nums)
        
        if result {
            print("\(nums) is contains duplicated numbers")
        } else {
            print("\(nums) is not contains duplicated numbers")
        }
    }

        func containsDuplicate(_ nums: [Int]) -> Bool {
            let controlArray = Array(Set(nums))
            
            if controlArray != nums {
                return true
            } else {
                return false
            }
        }
    
    // MARK: - Merge Sorted Array
    /*
     
     You are given two integer arrays nums1 and nums2, sorted in non-decreasing order, and two integers m and n, representing the number of elements in nums1 and nums2 respectively.
     Merge nums1 and nums2 into a single array sorted in non-decreasing order.
     The final sorted array should not be returned by the function, but instead be stored inside the array nums1. To accommodate this, nums1 has a length of m + n, where the first m elements denote the elements that should be merged, and the last n elements are set to 0 and should be ignored. nums2 has a length of n.
     
     Input: nums1 = [1,2,3,0,0,0], m = 3, nums2 = [2,5,6], n = 3
     Output: [1,2,2,3,5,6]
     Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
     The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
     */
    func mergeArraysTest() {
        var nums1 = [1,2,3,0,0,0]
        let m = 3
        let nums2 = [2,5,6]
        let n = 3
        
        merge(&nums1, m, nums2, n)
        
    }
    
    private func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
       var totalCount = m + n - 1
        
       var index = m - 1
       var indis = n - 1
        
        while index >= 0 && indis >= 0 {
            if nums1[index] > nums2[indis] {
                nums1[totalCount] = nums1[index]
                totalCount -= 1
                index -= 1
            } else {
                nums1[totalCount] = nums2[indis]
                totalCount -= 1
                indis -= 1
            }
        }
        
        while indis >= 0 {
            nums1[totalCount] = nums2[indis]
            totalCount -= 1
            indis -= 1
        }
        
        print("Two array merged: \(nums1)")
    }
    
    // MARK: - Intersection of Two Arrays
    /*
     Given two integer arrays nums1 and nums2, return an array of their intersection. Each element in the result must appear as many times as it shows in both arrays and you may return the result in any order.
     
     Input: nums1 = [1,2,2,1], nums2 = [2,2]
     Output: [2,2]
     */
    func arrayIntersectionTest() {
        let nums1 = [1,2,2,1]
        let nums2 = [2,2]
        
        let result = intersect(nums1, nums2)
        
        print("Intersection Array: \(result)")
    }
    
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result: [Int] = []
        var nums = nums2
        for num in nums1 {
            if nums.contains(num) {
                result.append(num)
                nums.remove(at: nums.firstIndex(of: num)!)
            }
        }
        return result
    }
    
    // MARK: - Missing Number
    /*
     Given an array nums containing n distinct numbers in the range [0, n], return the only number in the range that is missing from the array.
     
     Input: nums = [3,0,1]
     Output: 2
     Explanation: n = 3 since there are 3 numbers, so all numbers are in the range [0,3]. 2 is the missing number in the range since it does not appear in nums.
     
     */
    func missingNumberTest() {
        let nums: [Int] = [3,0,1]
        
        let result = missingNumber(nums)
        
        if result != -1 {
            print("missing number is \(result)")
        } else {
            print("Not true")
        }
    }
    
    private func missingNumber(_ nums: [Int]) -> Int {
        
        let numsSet = Set(nums)
        
        let numsCount = nums.count + 1;
        // iterator the set to find the missing number
        for index in 0...numsCount {
            if !numsSet.contains(index) {
                return index;
            }
        }
        return -1;
    }
}
