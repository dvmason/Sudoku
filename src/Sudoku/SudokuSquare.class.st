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
		'width'
	],
	#category : #Sudoku
}

{ #category : #accessing }
SudokuSquare >> connect: aBoard [ 
	| lr lc hr hc size |
	neighbours := OrderedCollection new.
	size := aBoard size.
	width := size*size.
	lr := (row-1)//size*size+1. hr := lr+size-1.
	lc := (col-1)//size*size+1. hc := lc+size-1.
	1 to: width do: [: r |
		1 to: width do: [: c |
			(r=row ifTrue: [
					c<col or: [ c>col ]
				] ifFalse: [
					c=col ifTrue: [
						r<row or: [ r>row ]
					] ifFalse: [
						(r between: lr and: hr) and: [ c between: lc and: hc]
					]
				]) ifTrue: [ neighbours add: (aBoard atRow: r col: c) ]
		]
	]

]

{ #category : #initialize }
SudokuSquare >> fix [
	mutable := value isNil.
	next fix.

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
	| solved |
	solved := false.
	mutable ifFalse: [ ^ next solvable ].
	1 to: width do: [: try |
		(neighbours noneSatisfy: [: nb | nb value=try ]) ifTrue: [
			value := try.
			next solvable ifTrue: [
				solved := true
			].
	]].
	value := nil.
	^ solved
]

{ #category : #evaluating }
SudokuSquare >> value [
	^ value
]
