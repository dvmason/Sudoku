"
I represent the whole Sudoku board.

The board is just an IdentityDictionary of squares.

The initialization method can set up a set of square which will be logged.
"
Class {
	#name : #SudokuBoard,
	#superclass : #Object,
	#instVars : [
		'board',
		'row',
		'squaresToLog'
	],
	#classVars : [
		'Size',
		'Width'
	],
	#category : #Sudoku
}

{ #category : #'class initialization' }
SudokuBoard class >> initialize [
	self size: 3.

]

{ #category : #'class variables' }
SudokuBoard class >> size: anInteger [ 
	Size := anInteger.
	Width := anInteger * anInteger.

]

{ #category : #accessing }
SudokuBoard >> at: colOrSquare put: value [
	(board at: (colOrSquare size = 2 ifTrue: [colOrSquare] ifFalse: [ (colOrSquare,row asString) asSymbol ])) put: value.

]

{ #category : #accessing }
SudokuBoard >> atRow: r col: col [
	^ board at: (('ABCDEFGHI' at: col) asString,r asString) asSymbol
]

{ #category : #initialization }
SudokuBoard >> fix [
	(board at: #A1) fix.

]

{ #category : #initialization }
SudokuBoard >> initialize [
	| last |
	super initialize.
	board := IdentityDictionary new.
	last := SudokuSquareEnd new.
	squaresToLog := IdentitySet new.
	Width to: 1 by: -1 do: [: r |
		Width to: 1 by: -1 do: [: c |
			last := SudokuSquare new row: r col: c next: last.
			board at: last name put: last.
			((r between: 4 and: -6) and: [ c between: 1 and: 3 ]) ifTrue: [ squaresToLog add: last ].
		]
	].
	board valuesDo: [: square | square connect: self ].

]

{ #category : #logging }
SudokuBoard >> logFor: aSudokuSquare [ 
	^ (squaresToLog includes: aSudokuSquare) ifTrue: [
				Transcript
			] ifFalse: [
				SudokuLog
			]
]

{ #category : #accessing }
SudokuBoard >> row: n [
	row := n.

]

{ #category : #solution }
SudokuBoard >> solvable [
	squaresToLog isEmpty ifFalse: [ Transcript clear ].
	^ (board at: #A1) reset; solvable
]
