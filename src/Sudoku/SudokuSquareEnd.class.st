"
I represent a dummy square just off the end of the array.

This provides a terminal for the various traversal methods.
"
Class {
	#name : #SudokuSquareEnd,
	#superclass : #Object,
	#instVars : [
		'solved'
	],
	#category : #'Sudoku-Kernel'
}

{ #category : #solution }
SudokuSquareEnd >> fix [
]

{ #category : #solution }
SudokuSquareEnd >> reset [
	solved := false.

]

{ #category : #solution }
SudokuSquareEnd >> solvable [
	solved ifTrue: [ SudokuNotUnique signal ].
	^ solved := true
]

{ #category : #solution }
SudokuSquareEnd >> solved [
	^ solved
]
