//
//  MainFormViewController.swift
//  DellMedHLA
//
//  Created by Jonathan Wong  on 4/28/18.
//  Copyright © 2018 Jonathan Wong . All rights reserved.
//

import Foundation
import PureLayout
import UIKit
import Eureka
import TableRow

class MainFormViewController: FormViewController {
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anotherButton = UIBarButtonItem(title: "Submit", style: .done, target: self, action: #selector(handleJSON))
        self.navigationItem.rightBarButtonItem = anotherButton
        
        form +++
        Section() {
            var header = HeaderFooterView<EurekaLogoViewNib>(.nibFile(name: "EurekaSectionHeader", bundle: nil))
            header.onSetupView = { (view, section) -> () in
                view.imageView.alpha = 0;
                UIView.animate(withDuration: 2.0, animations: { [weak view] in
                    view?.imageView.alpha = 1
                })
                view.layer.transform = CATransform3DMakeScale(0.9, 0.9, 1)
                UIView.animate(withDuration: 1.0, animations: { [weak view] in
                    view?.layer.transform = CATransform3DIdentity
                })
            }
            $0.header = header
            }
            
            +++ Section("Mental Status"){
                $0.tag = "Mental Status"
            }
            
            <<< TextAreaRow() {
                $0.value = "Alertness/Orientation "
                $0.placeholder = "Alertness/Orientation"
                $0.textAreaMode = .readOnly
                $0.textAreaHeight = .fixed(cellHeight: 40)
                $0.tag = "Alertness"
            }

            <<< CheckRow() {
                $0.title = "   Person 👱‍♂️?"
                $0.value = false
                $0.tag = "Person"
            }
            <<< CheckRow() {
                $0.title = "   Place 🏥?"
                $0.value = false
                $0.tag = "Place"
            }
            <<< CheckRow() {
                $0.title = "   Time ⏰?"
                $0.value = false
                $0.tag = "Time"
            }
            
            +++ Section()
            
            <<< TableInlineRow<String> { row in
                row.title = "Distress 😩"
                row.options = ["None", "Mild", "Moderate", "Severe"]
                    row.value = "None"
                row.tag = "Distress"
            }
            <<< TextAreaRow() {
                $0.value = ""
                $0.placeholder = "Any other details for distress?"
                $0.textAreaMode = .normal
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 20)
            }
            
            +++ Section()
            
            <<< TableInlineRow<String> { row in
                row.title = "Speech 💬"
                row.tag = "Speech"
                row.options = ["Fluent", "Word Finding Difficulty", "Neologisms", "Paraphasic Errors", "Circumlocution"]
                row.value = "Fluent"
            }
            
            +++ Section()
            
            <<< SegmentedRow<String>() {
                $0.title = "Comprehension"
                $0.tag = "Comprehension"
                $0.options = ["Intact ✅", "Impaired ❌"] }
            
            <<< TextAreaRow() {
                $0.value = ""
                $0.placeholder = "How impaired is comprehension?"
                $0.textAreaMode = .normal
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 20)
            }
            
            +++ Section()
            
            <<< SegmentedRow<String>() {
                $0.title = "Repetition"
                $0.tag = "Repetition"
                $0.options = ["Intact ✅", "Impaired ❌"] }

            
            <<< TextAreaRow() {
                $0.value = ""
                $0.placeholder = "How impaired is repetition?"
                $0.textAreaMode = .normal
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 20)
            }
        
            +++ Section("Cranial Nerves"){
                $0.tag = "Cranial Nerves"
            }
            <<< TableInlineRow<String> { row in
                row.title = "Visual Acuity 👓"
                row.tag = "Visual Acuity"
                row.options = ["20/20", "20/25", "20/30", "20/40", "20/50", "20/70", "20/100", "20/200"]
                row.value = "20/20"
            }
            
            <<< CheckRow() {
                $0.title = "   OD?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   OS?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   OU?"
                $0.value = false
            }
        
            +++ Section()
            
            <<< SegmentedRow<String>() {
                $0.title = "Visual Fields"
                $0.tag = "Visual Fields"
                $0.options = ["Intact ✅", "Defect ❌"] }
            
            <<< TextAreaRow() {
                $0.value = ""
                $0.placeholder = "How defective are visual fields?"
                $0.textAreaMode = .normal
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 20)
            }
            
            +++ Section()
            
            <<< SegmentedRow<String>() {
                $0.title = "Optic Discs"
                $0.tag = "Optic Discs"
                $0.options = ["Sharp ✅", "Abnormal ❌"] }
            
            <<< TextAreaRow() {
                $0.value = ""
                $0.placeholder = "How abnormal are optic discs?"
                $0.textAreaMode = .normal
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 20)
            }
            
            +++ Section()
            
            <<< SegmentedRow<String>() {
                $0.title = "Pupil Size 👀"
                $0.tag = "Pupil Size"
                $0.options = ["Equal =", "Right > Left", "Left > Right"] }
            
            +++ Section()
            
            <<< SegmentedRow<String>() {
                $0.title = "Pupil Shape 👁"
                $0.tag = "Pupil Shape"
                $0.options = ["Round ⚪️", "Abnormal 🚫"] }
            <<< TextAreaRow() {
                $0.value = ""
                $0.placeholder = "How abnormal is pupil shape?"
                $0.textAreaMode = .normal
                $0.textAreaHeight = .dynamic(initialTextViewHeight: 20)
            }
       
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Pupil Reactivity"
                $0.tag = "Pupil Reactivity"
                $0.options = ["Reactive", "Abnormal 🚫"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Relative Afferent Pupil Defect"
                $0.tag = "Relative Afferent Pupil Defect"
                $0.options = ["Negative", "Positive"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Extraocular Muscles"
                $0.tag = "Extraocular Muscles"
                $0.options = ["Intact", "Defect"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Accomodation"
                $0.tag = "Accomodation"
                $0.options = ["Intact", "Defect"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Facial Sensation"
                $0.tag = "Facial Sensation"
                $0.options = ["Intact To Light Touch", "Intact To Pin Prick", "Defect"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Eye Closure"
                $0.tag = "Eye Closure"
                $0.options = ["Symmetrical", "Asymmetrical"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Grimace"
                $0.tag = "Grimace"
                $0.options = ["Symmetical", "Asymmetrical"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Smile"
                $0.tag = "Smile"
                $0.options = ["Symmetrical", "Asymmetrical"] }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Hearing"
                row.tag = "Hearing"
                row.options = ["20/20", "20/25", "20/30", "20/40", "20/50", "20/70", "20/100", "20/200"]
                row.value = "20/20"
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Gag"
                row.tag = "Gag"
                row.options = ["Intact", "Diminished", "Absent"]
                row.value = "Intact"
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Uvula"
                row.tag = "Uvula"
                row.options = ["Midline", "Deviated Right", "Deviated Left"]
                row.value = "Midline"
            }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Palate"
                $0.tag = "Palate"
                $0.options = ["Symmetrical", "Asymmetrical"] }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Tongue"
                row.tag = "Tongue"
                row.options = ["Midline", "Deviated Right", "Deviated Left"]
                row.value = "Midline"
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Sternocleidomastoid"
                row.tag = "Sternocleidomastoid"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            
            +++ Section()
            
            <<< TableInlineRow<String> { row in
                row.title = "Trapezius"
                row.tag = "Trapezius"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            
            +++ Section("Motor Exam"){
                $0.tag = "Motor Exam"
            }
            
            <<< SegmentedRow<String>() {
                $0.title = "Muscle Tone"
                $0.tag = "Muscle Tone"
                $0.options = ["Normal", "Abnormal 🚫"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Muscle Bulk"
                 $0.tag = "Muscle Bulk"
                $0.options = ["Normal", "Atrophy"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Pronator Drift"
                $0.tag = "Pronator Drift"
                $0.options = ["Negative", "Positive Right", "Positive Left"] }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Shoulder Abduction"
                row.tag = "Shoulder Abduction"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            
            <<< TableInlineRow<String> { row in
                row.title = "Forearm Flexion"
                row.tag = "Forearm Flexion"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            
            <<< TableInlineRow<String> { row in
                row.title = "Forearm Extension"
                row.tag = "Forearm Extension"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Wrist Extension"
                row.tag = "Wrist Extension"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Index Finger Abduction"
                row.tag = "Index Finger Abduction"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Thumb Opposition"
                row.tag = "Thumb Opposition"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Hip Flexion"
                row.tag = "Hip Flexion"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Knee Extension"
                row.tag = "Knee Extension"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Ankle Dorsiflexion"
                row.tag = "Ankle Dorsiflexion"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Ankle Plantar Flexion"
                row.tag = "Ankle Plantar Flexion"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }
            
            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Great Toe Extension"
                row.tag = "Great Toe Extension"
                row.options = ["5/5 Normal", "4/5 Reduced", "3/5 Gravity Only", "2/5 Only With Gravity Removed", "1/5 Trace Movement", "0/5 No Movement"]
                row.value = "5/5 Normal"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }
            +++ Section()

            <<< MultipleSelectorRow<String>(){ row in
                row.title = "Pain With Range of Motion"
                 row.tag = "Pain With Range of Motion"
                row.options = ["Right Shoulder", "Left Shoulder", "Right Forearm Flexion", "Left Forearm Flexion", "Right Forearm Extension", "Left Forearm Extension", "Right Wrist Extension", "Left Wrist Extension", "Right Index Finger Abduction", "Left Index Finger Abduction", "Right Thumb Opposition", "Left Thumb Opposition", "Right Hip Flexion", "Left Hip Flexion", "Right Knee Extension", "Left Knee Extension", "Right Ankle Dorsiflexion", "Left Ankle Dorsiflexion", "Right Ankle Plantar Flexion", "Left ANkle Plantar Flexion", "Right Great Toe Extension", "Left Great Toe Extension"]
                }.onPresent { from, to in
                    to.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: from, action: #selector(MainFormViewController.multipleSelectorDone(_:)))
            }

            +++ Section("Sensation"){
                $0.tag = "Sensation"
            }
            <<< SegmentedRow<String>() {
                $0.title = "Light Touch"
                $0.tag = "Light Touch"
                $0.options = ["Normal 😃", "Abnormal 🤕"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Pin Prick"
                $0.tag = "Pin Prick"
                $0.options = ["Normal 😃", "Abnormal 🤕"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Vibration"
                $0.tag = "Vibration"
                $0.options = ["Normal 😃", "Abnormal 🤕"] }
            +++ Section()
            <<< SegmentedRow<String>() {
                $0.title = "Temperature"
                $0.tag = "Temperature"
                $0.options = ["Normal 😃", "Abnormal 🤕"] }
            +++ Section()

            +++ Section("Deep Tendon Reflexes"){
                $0.tag = "Deep Tendon Reflexes"
            }
            <<< TableInlineRow<String> { row in
                row.title = "Biceps"
                row.tag = "Biceps"
                row.options = ["0 Absent", "1+ Decrease", "2+ Normal", "3+ Brisk", "4+ Hyperreflexia"]
                row.value = "0 Absent"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Brachioradialis"
                row.tag = "Brachioradialis"
                row.options = ["0 Absent", "1+ Decrease", "2+ Normal", "3+ Brisk", "4+ Hyperreflexia"]
                row.value = "0 Absent"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Triceps"
                row.tag = "Triceps"
                row.options = ["0 Absent", "1+ Decrease", "2+ Normal", "3+ Brisk", "4+ Hyperreflexia"]
                row.value = "0 Absent"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Patellar"
                row.tag = "Patellar"
                row.options = ["0 Absent", "1+ Decrease", "2+ Normal", "3+ Brisk", "4+ Hyperreflexia"]
                row.value = "0 Absent"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Achilles"
                row.tag = "Achilles"
                row.options = ["0 Absent", "1+ Decrease", "2+ Normal", "3+ Brisk", "4+ Hyperreflexia"]
                row.value = "0 Absent"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Babinsky"
                row.tag = "Babinsky"
                row.options = ["None", "Toes Downgoing"]
                row.value = "None"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }


            +++ Section("Coordination"){
                $0.tag = "Coordination"
            }
            <<< SegmentedRow<String> { row in
                row.title = "Rapid Alternating Movements"
                row.tag = "Rapid Alternating Movements"
                row.options = ["Intact", "Defect"]
                row.value = "None"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< SegmentedRow<String> { row in
                row.title = "Finger-to-Nose"
                row.tag = "Finger-to-Nose"
                row.options = ["Intact", "Defect"]
                row.value = "None"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section()
            <<< SegmentedRow<String> { row in
                row.title = "Heel-to-Shin"
                row.tag = "Heel-to-Shin"
                row.options = ["Intact", "Defect"]
                row.value = "None"
            }

            <<< CheckRow() {
                $0.title = "   Bilateral?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Right?"
                $0.value = false
            }
            <<< CheckRow() {
                $0.title = "   Left?"
                $0.value = false
            }

            +++ Section("Gait"){
                $0.tag = "Gait"
            }
            <<< SegmentedRow<String> { row in
                row.title = "Station"
                row.tag = "Station"
                row.options = ["Normal", "Abnormal 🚫"]
                row.value = "None"
        }
        +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Arm Swing"
                row.tag = "Arm Swing"
                row.options = ["Normal", "Decreased Right", "Decreased Left"]
                row.value = "Normal"
            }

            +++ Section()
            <<< TableInlineRow<String> { row in
                row.title = "Tandem"
                row.tag = "Tandem"
                row.options = ["Normal", "Decreased Right", "Decreased Left"]
                row.value = "Normal"
            }
            
            +++ Section()
            <<< SegmentedRow<String> { row in
                row.title = "Toe Walk"
                row.tag = "Toe Walk"
                row.options = ["Normal", "Abnormal 🚫"]
                row.value = "None"
            }
            +++ Section()
            <<< SegmentedRow<String> { row in
                row.title = "Heel Walk"
                row.tag = "Heel Walk"
                row.options = ["Normal", "Abnormal 🚫"]
                row.value = "None"
            }
            +++ Section()
        
            <<< ButtonRow() {
                $0.title = "Scroll to Top"
                }
                .onCellSelection { cell, row in
                   self.tableView?.setContentOffset(CGPoint.zero, animated: true)
        }
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.title = "Neuro Exam"
        self.navigationController?.navigationBar.titleTextAttributes = ([NSAttributedStringKey.foregroundColor: UIColor.black])
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.view.backgroundColor = UIColor.white
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    func dismiss() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func multipleSelectorDone(_ item:UIBarButtonItem) {
        _ = navigationController?.popViewController(animated: true)
    }
    
    @objc func handleJSON() {
        let formvalues = self.form.values()
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: formvalues, options: .prettyPrinted)
            // here "jsonData" is the dictionary encoded in JSON data
            
            let decoded = try JSONSerialization.jsonObject(with: jsonData, options: [])
            // here "decoded" is of type `Any`, decoded from JSON data
            
            // you can now cast it with the right type
            if let dictFromJSON = decoded as? [String:String] {
                print(dictFromJSON)
            }
        } catch {
            print(error.localizedDescription)
        }

    }
}

class EurekaLogoViewNib: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
