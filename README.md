# csci-241-ch09-3
Improving_Binary_Search

Rewrite a procedure named BinarySearch2 to improve the textbook sample BinarySearch PROC, required:
Remove local variables mid, first, and last, but still maintain the same parameter list PROC calling interface
Use registers in the loop body without parameters. All parameter values should be moved to registers before the loop
Add comments to clarify and explain your registers' usage
Don't use push/pop, except for USES
Don't use directive .IF/.ELSE/.ENDIF or .WHILE etc. Use CMP and jump instead
You only need to submit modified BinarySearch2.asm. Better to have around 15 instructions sufficient in the loop body.
