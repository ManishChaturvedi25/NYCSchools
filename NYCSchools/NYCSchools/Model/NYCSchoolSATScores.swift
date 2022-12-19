//
//  NYCSchoolSATScores.swift
//  NYCSchools
//
//  Created by Manish Chaturvedi on 10/23/22.
//  Copyright © 2022 Manish Chaturvedi. All rights reserved.
//

struct NYCSchoolSATScores: Codable {
    let dbn: String?
    let school_name: String?
    let num_of_sat_test_takers: String?
    let sat_critical_reading_avg_score: String?
    let sat_math_avg_score: String?
    let sat_writing_avg_score: String?
}
