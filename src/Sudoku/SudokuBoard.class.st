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
		'size'
	],
	#category : #Sudoku
}

{ #category : #'instance creation' }
SudokuBoard class >> new [
	^ self size: 3
]

{ #category : #'instance creation' }
SudokuBoard class >> size: anInteger [
	^ super new size: anInteger
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
	super initialize.
	board := IdentityDictionary new.

]

{ #category : #accessing }
SudokuBoard >> row: n [
	row := n.

]

{ #category : #accessing }
SudokuBoard >> size [
	^ size
]

{ #category : #initialization }
SudokuBoard >> size: anInteger [
	| last width |
	size := anInteger.
	width := size*size.
	last := SudokuSquareEnd new.
	width to: 1 by: -1 do: [: r |
		width to: 1 by: -1 do: [: c |
			last := SudokuSquare new row: r col: c next: last.
			board at: last name put: last.
		]
	].
	board valuesDo: [: square | square connect: self ].

]

{ #category : #solution }
SudokuBoard >> solvable [
	^ (board at: #A1) reset; solvable
]
