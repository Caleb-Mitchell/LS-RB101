=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
  - an array
-  Output:
  - an array that contains every other element of the array supplied as input
  - the values of the returned array should be the 1st, 3rd, 5th and so on
    elements

---

**Problem Domain:**
- arrays
- iteration

---

**Rules:**

---

**Implicit Requirements:**
- array can contain ints or floats, although this shouldn't matter

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**
- given an array, create a new array with only the values at the odd numbered
  indices
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

oddities([2, 3, 4, 5, 6]) == [2, 4, 6]
oddities([1, 2, 3, 4, 5, 6]) == [1, 3, 5]
oddities(['abc', 'def']) == ['abc']
oddities([123]) == [123]
oddities([]) == []

---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  -  Output:

---

Data Structure
--------------
- working with arrays
---

Algorithm
---------
- SET 'oddities' array
- use each_with_index to copy over odd indices to new array
Code
----

=end
