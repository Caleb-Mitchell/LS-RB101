# Problem:
# Write a method that implements a miniature stack-and-register-based programming language that has the following commands:

    # n Place a value n in the "register". Do not modify the stack.
    # PUSH Push the register value on to the stack. Leave the value in the register.
    # ADD Pops a value from the stack and adds it to the register value, storing the result in the register.
    # SUB Pops a value from the stack and subtracts it from the register value, storing the result in the register.
    # MULT Pops a value from the stack and multiplies it by the register value, storing the result in the register.
    # DIV Pops a value from the stack and divides it into the register value, storing the integer result in the register.
    # MOD Pops a value from the stack and divides it into the register value, storing the integer remainder of the division in the register.
    # POP Remove the topmost item from the stack and place in register
    # PRINT Print the register value

# Input:
# - a string of commands
# Output:
# - the current value of the register, output depends on the commands
# Rules:
# - a *register* can be thought of as the current value, it is not the *stack*
# - the stack is an array
# - operations that require two values pop the topmost item from the stack,
# performs the operation using the popped value and the register value, and then
# store the result back in the register
# - all operations are integer operations (only matters for DIV and MOD)
# - programs are supplied to the language method via a string passed as an
# argument
# - may assume that all programs are correct programs
# - should initialize the register to 0
# * should initialize the stack as an empty array?
# * should the register value printed by PRINT be a string?
# Algorithm:
# - init stack as empty array
# - init register to 0
# - init commands array as program_string.split
# - for command in commands
#     - perform each command using the stack and register

def minilang(program_string)
  stack = []
  register = 0

  commands = program_string.split
  commands.each do |command|
    case command
    when 'PUSH'  then stack << register
    when 'ADD'   then register += stack.pop
    when 'SUB'   then register -= stack.pop
    when 'MULT'  then register *= stack.pop
    when 'DIV'   then register /= stack.pop
    when 'MOD'   then register %= stack.pop
    when 'POP'   then register = stack.pop
    when 'PRINT' then puts register
    else              register = command.to_i
    end
  end
end

minilang('PRINT')
# 0

minilang('5 PUSH 3 MULT PRINT')
# 15

minilang('5 PRINT PUSH 3 PRINT ADD PRINT')
# 5
# 3
# 8

minilang('5 PUSH POP PRINT')
# 5

minilang('3 PUSH 4 PUSH 5 PUSH PRINT ADD PRINT POP PRINT ADD PRINT')
# 5
# 10
# 4
# 7

minilang('3 PUSH PUSH 7 DIV MULT PRINT ')
# 6

minilang('4 PUSH PUSH 7 MOD MULT PRINT ')
# 12

minilang('-3 PUSH 5 SUB PRINT')
# 8

minilang('6 PUSH')
# (nothing printed; no PRINT commands)

