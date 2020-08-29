## permutations.ahk
Generates all possible permutations of the input array or string using [Heap's algorithm](https://en.wikipedia.org/wiki/Heap%27s_algorithm), which minimizes movement.


### Installation

In a terminal or command line navigated to your project folder:

```bash
npm install permutations.ahk
```
You may also review or copy the library from [./export.ahk on GitHub](https://raw.githubusercontent.com/chunjee/permutations.ahk/master/export.ahk)


In your code:

```autohotkey
#Include %A_ScriptDir%\node_modules
#Include permutations.ahk\export.ahk

results := permutations.generate("ted")
; => []
permutations.generate("ted", true)
; => ["ted"]
```

## API
Including the module provides an object with one method: `.generate`

### compareTwoStrings(array, [stringOut, maxPermutations])
Returns an array containing all possible permutations.

##### Arguments
1. array (*): The array or string to find permutations of
2. stringOut (bool): Optional, whether or not not elements of the return array should be combined into strings. Default is false meaning the result will be an array of arrays. 
3. maxPermutations (number): Optional, whether or not the number of permutations should be capped. This may be useful when dealing with a number of permutations that would otherwise take an excessive time to compute.

##### Returns
(array): An array containing all permutations.
