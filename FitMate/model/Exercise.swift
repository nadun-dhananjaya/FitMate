//
//  Exercise.swift
//  FitMate
//
//  Created by Nadun Dhananjaya on 2023-05-20.
//

import Foundation

import Foundation

// MARK: - Welcome
struct ExerciseModel: Codable {
    let status: Int
    let data: [ExeriseData]
    let message: String
}

// MARK: - Datum
struct ExeriseData: Codable {
    let id, exerciseName, exerciseType, instructor: String
    let notes: [String]
    let imageurl, videourl: String
    let v: Int
    let affectingArea, bmiRange: String
    let exerciseTime, repCount: Int
    let fitnessGoal: String

    enum CodingKeys: String, CodingKey {
        case id = "_id"
        case exerciseName = "exercise_name"
        case exerciseType = "exercise_type"
        case instructor, notes, imageurl, videourl
        case v = "__v"
        case affectingArea = "affecting_area"
        case bmiRange = "bmi_range"
        case exerciseTime = "exercise_time"
        case repCount = "rep_count"
        case fitnessGoal = "fitness_goal"
    }
}
