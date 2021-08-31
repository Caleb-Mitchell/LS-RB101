=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
  - a word or multiple words
-  Output:
  - number of characters

---

**Problem Domain:**
-counting
---

**Rules:**
- spaces should not count as a char
---

**Implicit Requirements:**

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**
count the number of chars provided by the user, ignoring spaces
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

Please write word or multiple words: walk
There are 4 characters in "walk".

Please write word or multiple words: walk, don't run
There are 13 characters in "walk, don't run".

---

_Your Test Cases:_

Please write word or multiple words:
There are 0 characters in "".

Please write word or multiple words: 12345
There are 5 characters in "12345".
---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------
- a string acts like a data structure
---

Algorithm
---------
- GET a string from user
- SET counter = 0
- SET char_count
- WHILE counter != length of string
  - IF char is space
    - ignore
  - ELSE IF char is not space
    - char_count = char_count + 1
  - END
- END
- PRINT message with number of chars, and string
- 

Code
----

=end
