"
I provide a GUI for the underlying Sudoku board.

For some pointers on Morphic, I looked at Jens Moenig's ""Sudoku solver and generator"" http://map.squeak.org/package/e2edc767-b26d-4180-8c2c-cff955ea249e
It is vastly more sophisticated!

"
Class {
	#name : #SudokuGUI,
	#superclass : #BorderedMorph,
	#instVars : [
		'board'
	],
	#category : #'Sudoku-GUI'
}

{ #category : #initialization }
SudokuGUI >> initialize [
	| size cellWidth cellHeight |
	super initialize.
	board ifNil: [ self board: SudokuBoard new ].
	size := board size.
	cellWidth := 10.
	cellHeight := 10.
	self
		bounds: (10 @ 10 extent: ((cellWidth * size + SudokuBlock borderWidth) * size) @
						((cellHeight * size + SudokuBlock borderWidth) * size) +
						(2 * self borderWidth)).
]
