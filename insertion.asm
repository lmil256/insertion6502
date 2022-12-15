; vim: set syntax=asmM6502:

list:
.BYTE 6,7,4,9,2,1,3,5,8,0
len = *-list
i:
.BYTE 1

* = $0800
loop1:
	ldx i      ; X is index of the first unsorted element
	cpx #len
	beq done   ; if i == len
	lda list,X ; A contains element to insert
	dex        ; X is index of top of sorted portion
loop2:
	cmp list,X
	beq found
	bcs found  ; A >= list[X]
	; copy list[X] to list[X + 1]
	ldy list,X
	inx
	sty list,X
	dex
	dex        ; move down list
	bpl loop2  ; X >= 0
found:
	inx
	sta list,X
	inc i
	jmp loop1
done:
