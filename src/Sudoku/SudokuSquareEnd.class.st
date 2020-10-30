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
	solved := 0.

]

{ #category : #solution }
SudokuSquareEnd >> solvable [
	solved := solved + 1.
	solved > 1 ifTrue: [ SudokuNotUnique signal ].
	^ true
]

{ #category : #solution }
SudokuSquareEnd >> solved [
	^ solved
]
