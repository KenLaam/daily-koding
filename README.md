# Daily Koding

This repo includes all my solutions for [DailyCodingProblem](https://www.dailycodingproblem.com/). All solutions are written in Swift.

Welcome your pull request to update the best solutions.

## Table of contents
  - [Problem 1](#problem-1)
  - [Problem 2](#problem-2)
  - [Problem 3](#problem-3)
  - [Problem 4](#problem-4)
  - [Problem 5](#problem-5)
  - [Problem 6](#problem-6)
  - [Problem 7](#problem-7)
  - [Problem 8](#problem-8)
  - [Problem 9](#problem-9)
  - [Problem 10](#problem-10)
  - [Problem 11](#problem-11)
  - [Problem 12](#problem-12)
  - [Problem 13](#problem-13)
  - [Problem 14](#problem-14)

## Problem 1
> This problem was recently asked by Google.

Given a list of numbers and a number k, return whether any two numbers from the list add up to k.

For example, given `[10, 15, 3, 7]` and k of `17`, return true since `10 + 7` is `17`.

Bonus: Can you do this in one pass?

### [Solution](DailyKoding.playground/Sources/Q1_20210805.swift)

## Problem 2
> This problem was asked by Uber.

Given an array of integers, return a new array such that each element at index `i` of the new array is the product of all the numbers in the original array except the one at `i`.

For example, if our input was `[1, 2, 3, 4, 5]`, the expected output would be `[120, 60, 40, 30, 24]`. If our input was `[3, 2, 1]`, the expected output would be `[2, 3, 6]`.

Follow-up: what if you can't use division?

### [Solution](DailyKoding.playground/Sources/Q2_20210806.swift)

## Problem 3
> This problem was asked by Google.

Given the root to a binary tree, implement `serialize(root)`, which serializes the tree into a string, and `deserialize(s)`, which deserializes the string back into the tree.

For example, given the following Node class
```
class Node:
    def __init__(self, val, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right
```
The following test should pass:
```
node = Node('root', Node('left', Node('left.left')), Node('right'))
assert deserialize(serialize(node)).left.left.val == 'left.left'
```

### [Solution](DailyKoding.playground/Sources/Q3_20210807.swift)

## Problem 4
> This problem was asked by Stripe.

Given an array of integers, find the first missing positive integer in linear time and constant space. In other words, find the lowest positive integer that does not exist in the array. The array can contain duplicates and negative numbers as well.

For example, the input `[3, 4, -1, 1]` should give `2`. The input `[1, 2, 0]` should give `3`.

You can modify the input array in-place.

### [Solution](DailyKoding.playground/Sources/Q4_20210808.swift)

## Problem 5
> This problem was asked by Jane Street.

`cons(a, b)` constructs a pair, and `car(pair)` and `cdr(pair)` returns the first and last element of that pair. For example, `car(cons(3, 4))` returns `3`, and `cdr(cons(3, 4))` returns `4`.

Given this implementation of cons:
```
def cons(a, b):
    def pair(f):
        return f(a, b)
    return pair
```
Implement `car` and `cdr`.

`This problem is not also problem in Swift when there is tuples.`
### [Solution](DailyKoding.playground/Sources/Q5_20210809.swift)

## Problem 6
> This problem was asked by Google.

An XOR linked list is a more memory efficient doubly linked list. Instead of each node holding `next` and `prev` fields, it holds a field named `both`, which is an `XOR` of the next node and the previous node. Implement an XOR linked list; it has an `add(element)` which adds the element to the end, and a `get(index)` which returns the node at index.

If using a language that has no pointers (such as Python), you can assume you have access to `get_pointer` and `dereference_pointer` functions that converts between nodes and memory addresses.

### [Solution](DailyKoding.playground/Sources/Q6_20210810.swift)

## Problem 7
> This problem was asked by Facebook.

Given the mapping a = 1, b = 2, ... z = 26, and an encoded message, count the number of ways it can be decoded.

For example, the message `'111'` would give `3`, since it could be decoded as `'aaa'`, `'ka'`, and `'ak'`.

You can assume that the messages are decodable. For example, `'001'` is not allowed.

### [Solution](DailyKoding.playground/Sources/Q7_20210811.swift)

## Problem 8
> This problem was asked by Google.

A unival tree (which stands for "universal value") is a tree where all nodes under it have the same value.

Given the root to a binary tree, count the number of unival subtrees.

For example, the following tree has 5 unival subtrees:
```
   0
  / \
 1   0
    / \
   1   0
  / \
 1   1
```

### [Solution](DailyKoding.playground/Sources/Q8_20210812.swift)


## Problem 9
> This problem was asked by Airbnb.

Given a list of integers, write a function that returns the largest sum of non-adjacent numbers. Numbers can be `0` or negative.

For example, `[2, 4, 6, 2, 5]` should return `13`, since we pick `2`, `6`, and `5`. `[5, 1, 1, 5]` should return `10`, since we pick `5` and `5`.

### [Solution](DailyKoding.playground/Sources/Q9_20210902.swift)
Thanks [Tushar Roy - Coding Made Simple](https://www.youtube.com/watch?v=UtGtF6nc35g)

## Problem 10
> This problem was asked by Apple.

Implement a job scheduler which takes in a function `f` and an integer `n`, and calls `f` after `n` milliseconds.

### [Solution](DailyKoding.playground/Sources/Q10_20210902.swift)

## Problem 11
> This problem was asked by Twitter.

Implement an autocomplete system. That is, given a query string `s` and a set of all possible query strings, return all strings in the set that have `s` as a prefix.

For example, given the query string `de` and the set of strings `[dog, deer, deal]`, return `[deer, deal]`.

Hint: Try preprocessing the dictionary into a more efficient data structure to speed up queries.

### [Solution](DailyKoding.playground/Sources/Q11_20210904.swift)

## Problem 12
> This problem was asked by Amazon.

There exists a staircase with N steps, and you can climb up either 1 or 2 steps at a time. Given N, write a function that returns the number of unique ways you can climb the staircase. The order of the steps matters.

For example, if N is 4, then there are 5 unique ways:
```
1, 1, 1, 1
2, 1, 1
1, 2, 1
1, 1, 2
2, 2
```
What if, instead of being able to climb 1 or 2 steps at a time, you could climb any number from a set of positive integers X? For example, if X = {1, 3, 5}, you could climb 1, 3, or 5 steps at a time.

### [Solution](DailyKoding.playground/Sources/Q12_20210904.swift)
[Fully solution from DailyCodingProblem](https://www.dailycodingproblem.com/blog/staircase-problem/)

## Problem 13
> This problem was asked by Amazon.

Given an integer `k` and a string `s`, find the length of the longest substring that contains at most `k` distinct characters.

For example, given `s = "abcba"` and `k = 2`, the longest substring with `k` distinct characters is `"bcb"`.

### [Solution](DailyKoding.playground/Sources/Q13_20210905.swift)

## Problem 14
> This problem was asked by Google.

The area of a circle is defined as `πr^2`. Estimate `π` to 3 decimal places using a Monte Carlo method.

Hint: The basic equation of a circle is `x^2 + y^2 = r^2`.

### [Solution](DailyKoding.playground/Sources/Q14_20210906.swift)
[Fully explained about Monte Carlo method from GeeksForGeeks](https://www.geeksforgeeks.org/estimating-value-pi-using-monte-carlo/)

## Problem 15
> This problem was asked by Facebook.

Given a stream of elements too large to store in memory, pick a random element from the stream with uniform probability.

### [Solution](DailyKoding.playground/Sources/Q15_20210906.swift)
[Fully solution from GeeksForGeeks](https://www.geeksforgeeks.org/select-a-random-number-from-stream-with-o1-space/)