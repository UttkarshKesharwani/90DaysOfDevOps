# Day 06 – File Read/Write Practice

## Commands Ran

**Command 1: touch notes.txt**

```
Created empty file notes.txt
```

**Command 2: echo "Line 1" > notes.txt**

```
Wrote "Line 1" to notes.txt (overwrites if exists)
```

**Command 3: echo "Line 2" >> notes.txt**

```
Appended "Line 2" to notes.txt
```

**Command 4: echo "Line 3" | tee -a notes.txt**

```
Line 3
Wrote and displayed "Line 3" at the same time
```

**Command 5: cat notes.txt**

```
Line 1
Line 2
Line 3
Read the full file
```

**Command 6: head -n 2 notes.txt**

```
Line 1
Line 2
Read first 2 lines
```

**Command 7: tail -n 2 notes.txt**

```
Line 2
Line 3
Read last 2 lines
```

## What I Learned

Using `>` overwrites a file. Using `>>` appends to it. `tee` is useful when you want to both save and see output. `head` and `tail` let you read specific parts of large files without loading the whole thing.

These commands will be useful when reading logs and config files.

---
