SetBatchLines, -1
#SingleInstance, force
#NoTrayIcon
#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk

assert := new unittesting()

assert.label("generate - perform on short string")
assert.test(permutations.generate("hey").count(), 6)
assert.test(permutations.generate("hello").count(), 120)

assert.label("generate - perform on short array and combine outputs to strings")
out := permutations.generate([1,2,3,4,5], true)
assert.test(out[1], "12345")
assert.test(out[120], "32541")

assert.label("generate - perform on short array")
out := permutations.generate([1,2,3,4,5])
assert.test(out[1], ["1","2","3","4","5"])
assert.test(out[120], ["3","2","5","4","1"])

assert.label("generate - perform on string array")
assert.test(permutations.generate(["Auto", "Hot", "key"], ["AutoHotkey", "HotAutokey", "keyAutoHot", "AutokeyHot", "HotkeyAuto", "keyHotAuto"]))

assert.label("generate - limit number of outputs")
assert.test(permutations.generate("AutoHotkey", true, 1).count(), 1)
assert.test(permutations.generate("AutoHotkey", true, 2).count(), 2)
assert.test(permutations.generate("AutoHotkey", true, 10).count(), 10)
assert.test(permutations.generate("AutoHotkey", true, 20).count(), 20)
assert.test(permutations.generate("AutoHotkey", true, 100).count(), 100)
assert.test(permutations.generate("AutoHotkey", true, 200).count(), 200)

assert.label("generate - handle empty string")
assert.test(permutations.generate("").count(), 0)

assert.label("generate - handle empty array")
assert.test(permutations.generate([]).count(), 0)

assert.label("generate - handle single element string")
assert.test(permutations.generate("a").count(), 1)
assert.test(permutations.generate("a")[1], ["a"])

assert.label("generate - handle single element array")
assert.test(permutations.generate([1]).count(), 1)
assert.test(permutations.generate([1])[1], [1])

assert.label("generate - handle duplicate elements in string")
assert.test(permutations.generate("aab").count(), 6)
assert.test(permutations.generate("aab", true)[1], "aab")

assert.label("generate - handle duplicate elements in array")
out := permutations.generate([1,1,2], true)
assert.test(out.count(), 6)
assert.test(out[1], "112")

assert.label("generate - verify order consistency in string output")
out := permutations.generate("abc", true)
assert.test(out[1], "abc")
assert.test(out[2], "bac")
assert.test(out[3], "cab")

assert.label("generate - verify order consistency in array output")
out := permutations.generate([1,2,3])
assert.test(out[1], [1,2,3])
assert.test(out[2], [2,1,3])
assert.test(out[3], [3,1,2])

assert.label("generate - ensure no mutation on input string")
str := "ahk"
permutations.generate(str)
assert.test(str, "ahk")

assert.label("generate - ensure no mutation on input array")
arr := [1,2,3,4,5]
permutations.generate(arr)
assert.test(arr, [1,2,3,4,5])

assert.fullReport()
exitapp
