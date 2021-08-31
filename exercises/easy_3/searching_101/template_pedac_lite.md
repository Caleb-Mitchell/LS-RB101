=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
  - 6 numbers from the user
-  Output:
  - a message that describes whether or not the 6th number appears amonst the
    first 5 numbers

---

**Problem Domain:**
searching

---

**Rules:**

---

**Implicit Requirements:**
- all numbers appear to be integers

---

**Clarifying Questions:**

1. should all numbers be ints, or should floats be allowed?
2.
3.

---

**Mental Model:**
- given 6 numbers, check the first 5 to see if the 6th is one of them

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
17
The number 17 appears in [25, 15, 20, 17, 23].


==> Enter the 1st number:
25
==> Enter the 2nd number:
15
==> Enter the 3rd number:
20
==> Enter the 4th number:
17
==> Enter the 5th number:
23
==> Enter the last number:
18
The number 18 does not appear in [25, 15, 20, 17, 23].

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
- 1 array to store the first 5 numbers
---

Algorithm
---------
- ask the user for 5 numbers
- each time store the number in an array
- ask them for one more number
- check the array for that last number
- print a message stating whether or not the last number is present in the array
Code
----

=end
