TITLE  Binary Search Procedure            (Improving_Binary_Search.asm)

; Program: Improving_Binary_Search (Chapter 9, Modified)
; Description: Improves Irvine Binary Search Example PROC
; Student:     Gabriel Warkentin
; Date:        04/22/2020
; Class:       CSCI 241
; Instructor:  Mr. Ding

INCLUDE Irvine32.inc

.code
;-------------------------------------------------------------
BinarySearch2 PROC USES ebx ecx edx esi edi,
	pArray:PTR DWORD,		; pointer to array
	Count:DWORD,			; array size
	searchVal:DWORD			; search value
;
; Search an array of signed integers for a single value.
; Receives: Pointer to array, array size, search value.
; Returns: If a match is found, EAX = the array position of the
; matching element; otherwise, EAX = -1.
;-------------------------------------------------------------
	; Irvine picked weird registers initially. Why ebx for array pointer and esi for mid?
	; eax = first, ebx = mid, ecx = last, edx = array value, edi = search value, esi = array pointer
	mov  eax, 0				; first
	mov	 ecx,Count			; last = (count - 1)
	dec	 ecx
	mov	 edi,searchVal		; EDI = searchVal
	mov	 esi,pArray			; ESI points to the array

L1: ; while first <= last
	cmp	 eax,ecx			; cmp first vs last
	jg	 L5					; exit search

; mid = (last + first) / 2
	mov	 ebx,ecx			; mov last into ebx
	add	 ebx,eax			; add first to ebx
	shr  ebx,1				; midpoint. need this to trunc for scaling
	
; EDX = values[mid]
	shl	 ebx,2				; scale value * 4 = dword index
	mov	 edx,[esi+ebx]		; EDX = [array + mid]
	shr  ebx,2				; revert mid

; if ( EDX < searchval(EDI) )
;	first = mid + 1;
	cmp	 edx,edi
	jge	 L2
	mov	 eax,ebx			; first = mid + 1
	inc	 eax
	jmp	 L4					; could replace with L1 but L4 more clear movement

; else if( EDX > searchVal(EDI) )
;	last = mid - 1;
L2:	jle	 L3					; don't need to cmp again
	mov	 ecx,ebx			; last = mid - 1
	dec	 ecx
	jmp	 L4					; could replace with L1 but L4 more clear movement

; else return mid
L3:	mov	 eax,ebx  			; value found
	jmp	 L9 				; return (mid)

L4:	jmp	 L1					; continue the loop

L5:	mov	 eax,-1				; search failed
L9:	ret
BinarySearch2 ENDP
END