=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
  - bill amount
  - tip rate
-  Output:
  - the tip value
  - total amount of the bill

---

**Problem Domain:**
percentages
---

**Rules:**

---

**Implicit Requirements:**
- round the values to hundreds place (pennies)
- bill value must be greater than zero
- tip value must be zero or greater
- currency values should be floats
---

**Clarifying Questions:**

1. are float values sufficient for handling money in this case?
2. is validation necessary?
3. should the program prompt for additional calculations at the end?

---

**Mental Model:**
simple tip calculator, take a bill amount and tip rate, compute the tip, display
both the tip and the total bill
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

What is the bill? 200
What is the tip percentage? 15

The tip is $30.0
The total is $230.0

---

_Your Test Cases:_

-  Example 3
  -  Inputs:
  -  Output:

---

_Your Edge Cases:_

-  Example 4
  -  Inputs: 
    - bill = 100
    - tip percentage = 0
  -  Output: 
     - the tip is 0
     - teh total is 100

---

Data Structure
--------------
none
---

Algorithm
---------
prompt user for bill
validate bill number
prompt user for tip percentage
validate tip percentage value

calculate tip value
calculate total bill value

display tip value and bill value to user

---
- GET bill total
- VALIDATE bill total
- GET tip percentage
- VALIDATE tip percentage
- SET tip value
- SET total bill value
- PRINT tip value
- PRINT total bill value

Code
----

=end
