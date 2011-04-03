Information
===========
See [PuzzleNode][1] for more information on this problem, but it boils down to this:

Given an XML with currency conversions and a CSV file with transactions for
various stores with an amount and a currency, convert transactions to
a currency and sum it up to give a total sales in a given currency.

Problem
-------
What is the grand total of sales for item DM1182 across all stores in USD
currency?

Notes (from PuzzleNode):
------------------------
  * After each conversion, the result should be rounded using Banker's Rounding
  * Some rates are missing; you will need to derive them
  * Avoid floating point arithmetic errors


Notes (from me):
----------------
  * Finding the reverse of a conversion is as valuable as finding a direct
    mapping
  * Indirect mappings can be anywhere, including reversing it to get what you
    need

[1]; http://www.puzzlenode.com/puzzles/2
