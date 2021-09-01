=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

-  Inputs:
  - user's name
-  Output:
  - a greeting,
  - or a special greeting if user name ends in !

---

**Problem Domain:**
- string manipulation

---

**Rules:**
- greeting should be special only if user name ends with !
---

**Implicit Requirements:**
- exclamation point should be removed from name in special greeting
---

**Clarifying Questions:**

1.
2.
3.

---

**Mental Model:**
- when asking the user for their name, give a funny response if they end their
name with !
---

Examples / Test Cases / Edge Cases
----------------------------------

**Examples:**

```ruby
What is your name? Bob
Hello Bob.
```

```ruby
What is your name? Bob!
HELLO BOB. WHY ARE WE SCREAMING?
```

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

---

Algorithm
---------
- PRINT ask for user's name
- GET user's name
- IF user name does not end in !
  - PRINT regular greeting
- ElSE IF user name ends in !
  - PRINT special greeting
- END

Code
----

=end
