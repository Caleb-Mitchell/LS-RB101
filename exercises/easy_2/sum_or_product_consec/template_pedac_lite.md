=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
  - an integer greater than 0
  - a choice between adding or multiplying (s or p)
-  Output:
  - the sum, or product, of all numbers between 1 and the user's integer

---

**Problem Domain:**
- math, counting, iterating

---

**Rules:**
- user must enter an integer
- integer must be greater than 0

---

**Implicit Requirements:**

---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**

---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

>> Please enter an integer greater than 0:
5
>> Enter 's' to compute the sum, 'p' to compute the product.
s
The sum of the integers between 1 and 5 is 15.


>> Please enter an integer greater than 0:
6
>> Enter 's' to compute the sum, 'p' to compute the product.
p
The product of the integers between 1 and 6 is 720.---

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
none
---

Algorithm
---------
- ask user for integer
  - save integer value
- ask user for choice between sum or product
  - save choice
- if choice is sum
  - set a counter
  - add all values in range together
- if choice is product
  - set a counter
  - multiply all values together
- print the result

Code
----

=end
