=begin

PEDAC Template
==============

(Understand the) Problem
------------------------

Essential to understanding how to solve a problem. In order to be able to solve
a problem, you have to at least understand what the problem is and what it is
asking. Take some time to allow the problem to load into your brain.

**Don't rush this.**

First, identify the inputs and the outputs of the problem.

-  Inputs: 
1. the loan amount
2. the annual percentage rate (APR)
3. the loan duration

-  Output:
1. monthly payment amount
2. total of the monthly payments (including number of months)
3. total interest
---

Check for Problem Domain: the Problem Domain is the area of expertise or
application that needs to be examined to solve a problem. Basically any
domain-specific terms or concepts that may be applicable.

It limits the scope of the problem.

For example, if the problem asks you to add up a set of multiples, you need to
make sure you know what multiples are.

Could one word have multiple meanings? etc

**Problem Domain:**

interest based payments

use this formula:
m = p * (j / (1 - (1 + j)**(-n)))

- m = monthly payment
- p = loan amount
- j = monthly interest rate
- n = loan duration in months

---

What are the rules explicitly mentioned in the problem definition?

**Rules:**
1. don't use single-letter variables
2. run the code through robocop
3. interest rates should likely be a decimal number or float (i.e. 5% is 0.05)
4. APR is annual, needs to be converted to monthly interest rate
5. loan duration is in months!

---

Check for Implicit Requirements. Are there requirements that are not explicitly
stated?

**Implicit Requirements:**
1. Loan duration must be greater than 0
2. all inputs should be validated numeric values
3. need to also figure the number of monthly payments, the total of those payments,
as well as the total interest
---

Some questions to ask the interviewer (or perhaps yourself) to better understand
the problem.

**Clarifying Questions:**

1. What is the highest possible APR? over 100%? (there's no ceiling)
2. What all values should I output? should i include the total of payments made,
as well as the total interest, as in the example calculator?
3.

---

A mental model is an explanation of someone's thought process about how
something works in the real world. Think of it as a summary of the "entire
problem" written in your own words.

It is your perspective of *what* the problem requires--not *how*. How is
implemented in the Algorithm section.

As a rule of thumb, you can keep the number of mental models to one if it fully,
and accurately, captures the requirements of the problem.

**Mental Model:**

If a user provides a loan amount, an APR value, and a duration of the loan, calculate and provide them
with the monthly payment amount, the total of however many monthly payments (including how many months),
and the total interest that has accrued.

---

Examples / Test Cases / Edge Cases
----------------------------------

The objective is to come up with examples that validate your understanding of
the problem, and confirm that you are working in the right direction. Typically
the confirmation will come from documentation of a process, or a person.

**Examples:**

-  Example 1
  -  Inputs:
loan amount = 1000
APR = 10%
loan duration = 1 year
  -  Output:
monthly payment = $87.92
total of (12) payments = $1_054.99
total interest = 54.99
-  Example 2
  -  Inputs:
loan amount = 50_000
APR = 2%
loan duration = 6 months
  -  Output:
monthly payment = $8,383.01
total of (6) payments = $50,292.07
total interest = $292.07

---

**Test Cases:**

*Note: Rules for a specific problem are oftentimes an excellent place to find
test cases. If you're working with collections, it's a good idea to find test
cases that deal with zero, one or multiple elements in the collection. Try to
provide test cases that handle any edge cases you can find.*

Find test cases with the following conditions:

-  Zero (`0`)
-  Emptiness (`nil`, `null`, `""`, `[]`, `{}`)
-  Boundary conditions (where conditions change)
-  Repetition / duplication
-  Upper case / lower case
-  Data types

As well as the following failures and bad inputs:

-  Raise exceptions / report errors
-  Special values (`nil`, `0`, `""`, surrogate pairs, char. encoding, special
   char.)

_Your Test Cases:_

-  Example 3
  -  Inputs:
loan amount = 0
APR = 5%
loan duration = 1 year
  -  Output:
monthly payment = 0
total of (12) payments = 0
total interest = 0

- Example 4
 - Inputs:
 loan amount = 1000
 APR = 5%
 loan duration = 0
 - Output:
 ERROR: Please provide a positive loan term value
 
 - Example 5
  - Inputs:
    - loan amount = 0
    - APR = 0%
    - loan duration = 5
  Output:
    0, 0, 0
---

**Edge Cases:**

Edge cases are situations that occur along the "edge" of a specific problem.

For example: problems that involve iterating over numbers have edge cases that
are at both ends of the range. Typically can involve working with negative
numbers, 0, or extremely high values.

_Your Edge Cases:_

-  Example 4
  -  Inputs:
  loan amount = 1000
  APR = 500
  loan duration = 1 year
  -  Output:
  monthly payments = 423.14
  total of (12) payments = 5,077.71
  total interest = 4,077.71

- Example 5
  - Inputs:
  loan amount = 1,000,000
  apr = 1,000
  loan duration = 100 years
  - Output:
  monthly payments = 833,333.33
  total of (1,200) payments = 1,000,000,000.00 (i think this is limit of example calculator)
  total interest = 999,000,000.00

---

Data Structure
--------------

Determine what data structures you will work with to convert the input to the
desired output.

The chief considerations here are your intended programming language and your
mental model.

Are you going to use arrays, hashes, etc? Your data structure will influence
your program.

None necessary

---

Algorithm
---------

Start with your mental model if you have one. While you're still learning to
solve problems, it would be a good idea to consistently create mental models to
assist you.

Otherwise you can start with your Data Structure, and think about how you'd
build and manipulate it to get to the output. For example, if you're going to
use an array maybe you would want to focus on constructing or iterating over a
collection.

The chief objective here is to determine a series of instructions that will
transform the input into the desired output.

-  The challenge is to get to the right amount of detail (think about the steps
   to creating a peanut butter and jelly sandwich.)
-  You want something that you can readily convert to code without actually
   writing code.
-  Before implementing the algorithm, you should test it manually with test
   cases.

mental model again:
If a user provides a loan amount, an APR value, and a duration of the loan, calculate and provide them
with the monthly payment amount, the total of however many monthly payments (including how many months),
and the total interest that has accrued.

1. Ask user for loan amount
  - validate is valid float or integer
2. Ask user for APR value
  - validate is valid float or integer
3. Ask user for duration of the loan
  - validate is valid float or integer
  - validate is greater than zero
4. Perform calculations
  - convert APR to monthly interest rate
  - convert loan duration to months
  - monthly payment amount
  - total of all monthly payments
  - total interest (total of all monthly payments - original loan amount)
5. Display values to user

Code
----

=end

