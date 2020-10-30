Class {
	#name : #SudokuTest,
	#superclass : #TestCase,
	#instVars : [
		's'
	],
	#category : #'Sudoku-Tests'
}

{ #category : #running }
SudokuTest >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	super setUp.
	s := SudokuBoard new.

]

{ #category : #tests }
SudokuTest >> testMag3 [
	s
		row: 1;
"		at: #B put: 3;"
		at: #C put: 2;
		at: #D put: 1;
		at: #H put: 9;
		row: 2;
		at: #D put: 8;
"		at: #F put: 9;"
		at: #G put: 3;
		row: 3;
		at: #A put: 9;
"		at: #B put: 8;"
		at: #E put: 3;
		at: #I put: 7;
		row: 4;
		at: #B put: 5;
		at: #G put: 9;
"		at: #H put: 7;"
		at: #I put: 3;
		row: 5;
"		at: #A put: 3;
		at: #B put: 2;"
		at: #C put: 8;
		at: #D put: 9;
		at: #F put: 7;
		at: #G put: 5;
		row: 6;
"		at: #B put: 9;"
		at: #C put: 7;
"		at: #D put: 3;"
		at: #H put: 8;
		row: 7;
		at: #A put: 2;
"		at: #C put: 3;"
		at: #E put: 9;
		at: #I put: 6;
		row: 8;
		at: #C put: 4;
		at: #F put: 3;
"		at: #I put: 9;"
		row: 9;
		at: #B put: 7;
"		at: #C put: 9;"
		at: #F put: 4;
		at: #G put: 1;
"		at: #H put: 3;"
	" make it solvable "
		row: 6;
		at: #E put: 6;
"		at: #H put: 1;"
		row: 7;
		at: #F put: 8;
		row: 1;
		at: #I put: 4;
		fix.
	self assert: s solvable description: 'after initialization'.

]

{ #category : #tests }
SudokuTest >> testNotUnique2 [
	s := SudokuBoard size: 2.
	s
		row: 1;
		at: #C put: 1;
		row: 2;
		at: #B put: 2;
		row: 3;
		at: #C put: 2;
		row: 4;
		at: #B put: 1;
		at: #C put: 4;
		at: #D put: 3;
		fix.
	self deny: [ s solvable ].
	self assert: s solutionCount equals: 2.

]

{ #category : #tests }
SudokuTest >> testSolvable2 [
	s := SudokuBoard size: 2.
	s
		row: 1;
		at: #A put: 3;
		at: #B put: 4;
		at: #C put: 1;
		row: 2;
		at: #B put: 2;
		row: 3;
		at: #C put: 2;
		row: 4;
		at: #B put: 1;
		at: #C put: 4;
		at: #D put: 3;
		fix.
	self assert: s solvable description: 'after initialization'.

]

{ #category : #tests }
SudokuTest >> testSolvable3 [
	s
		row: 1;
		at: #D put: 1;
		at: #F put: 2;
		row: 2;
		at: #D put: 7;
		at: #F put: 5;
		row: 3;
		at: #B put: 5;
		at: #C put: 8;
		at: #G put: 2;
		at: #H put: 3;
		row: 4;
		at: #A put: 2;
		at: #B put: 3;
		at: #H put: 9;
		at: #I put: 5;
		row: 5;
		at: #E put: 4;
		row: 6;
		at: #A put: 6;
		at: #B put: 9;
		at: #H put: 2;
		at: #I put: 7;
		row: 7;
		at: #B put: 6;
		at: #C put: 5;
		at: #G put: 3;
		at: #H put: 7;
		row: 8;
		at: #D put: 6;
		at: #F put: 1;
		row: 9;
		at: #D put: 3;
		at: #F put: 8;
		fix.
	self assert: s solvable description: 'after initialization'.

]

{ #category : #tests }
SudokuTest >> testUnsolvable2 [
	s := SudokuBoard size: 2.
	s
		row: 1;
		at: #A put: 3;
		at: #B put: 4;
		at: #C put: 1;
		row: 2;
		at: #B put: 2;
		row: 3;
		at: #D put: 2;
		row: 4;
		at: #B put: 1;
		at: #C put: 4;
		at: #D put: 3;
		fix.
	self deny: s solvable description: 'after initialization'.
	self assert: s solutionCount equals: 0.

]

{ #category : #tests }
SudokuTest >> testWild [
	s fix.
	self deny: [ s solvable ].
	self assert: s solutionCount equals: 2.


]
