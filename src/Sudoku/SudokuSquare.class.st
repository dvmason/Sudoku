"
I represent a square on the Sudoku board.

I know which squares I can interfere with, the stream to log to, and the following square for traversal.
"
Class {
	#name : #SudokuSquare,
	#superclass : #Object,
	#instVars : [
		'row',
		'col',
		'neighbours',
		'value',
		'mutable',
		'next',
		'name',
		'size'
	],
	#category : #Sudoku
}

{ #category : #accessing }
SudokuSquare >> connect: aBoard [ 
	| width |
	neighbours := OrderedCollection new.
	size := aBoard size.
	width := size*size.
	1 to: width do: [: r |
		1 to: width do: [: c |
			(self isNeighbourOfRow: r col: c) ifTrue: [ neighbours add: (aBoard atRow: r col: c) ]
		]
	]

]

{ #category : #initialize }
SudokuSquare >> fix [
	mutable := value isNil.
	next fix.

]

{ #category : #accessing }
SudokuSquare >> isNeighbourOfRow: r col: c [
	| lr lc |
	lr := (row-1)//size*size+1.
	lc := (col-1)//size*size+1.
	^ r=row ifTrue: [
					c<col or: [ c>col ]
				] ifFalse: [
					c=col ifTrue: [
						r<row or: [ r>row ]
					] ifFalse: [
						(r between: lr and: lr+size-1) and: [ c between: lc and: lc+size-1]
					]
				]
]

{ #category : #accessing }
SudokuSquare >> name [
	^ name
]

{ #category : #accessing }
SudokuSquare >> put: anInteger [
	value ifNotNil: [ self error: name,' already set to ',value asString,' trying ',anInteger asString ].
	neighbours do: [: nb |
		nb value=anInteger ifTrue: [ self error: nb name,' interferes with setting ',name,' to ',anInteger asString ]
	].
	value := anInteger.

]

{ #category : #reseting }
SudokuSquare >> reset [
	mutable ifTrue: [ value := nil ].
	next reset.


]

{ #category : #accessing }
SudokuSquare >> row: r col: c next: sq [
	next := sq.
	row := r.
	col := c.
	name :=  (('ABCDEFGHI' at: col) asString, r asString) asSymbol
]

{ #category : #solution }
SudokuSquare >> solvable [
	mutable ifFalse: [ ^ next solvable ].
	1 to: size*size do: [: try |
		(neighbours noneSatisfy: [: nb | nb value=try ]) ifTrue: [
			value := try.
			next solvable.
	]].
	value := nil.

]

{ #category : #evaluating }
SudokuSquare >> value [
	^ value
]
