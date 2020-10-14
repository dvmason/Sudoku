"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestSudoku,
	#superclass : #PackageManifest,
	#category : #'Sudoku-Manifest'
}

{ #category : #'code-critics' }
ManifestSudoku class >> ruleRBCodeCruftLeftInMethodsRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SudokuBoard #solvable #false)) #'2020-10-08T23:03:45.78747-04:00') )
]

{ #category : #'code-critics' }
ManifestSudoku class >> ruleRBGlobalVariablesUsageV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SudokuBoard #logFor: #false)) #'2020-10-08T22:37:14.862286-04:00') #(#(#RGMethodDefinition #(#SudokuBoard #solvable #false)) #'2020-10-08T23:03:50.078846-04:00') )
]

{ #category : #'code-critics' }
ManifestSudoku class >> ruleRBStringConcatenationRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#SudokuSquare #put: #false)) #'2020-10-08T22:41:03.654437-04:00') )
]
