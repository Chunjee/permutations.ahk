SetBatchLines, -1
#SingleInstance, force
#NoTrayIcon
#Include %A_ScriptDir%\..\export.ahk
#Include %A_ScriptDir%\..\node_modules
#Include unit-testing.ahk\export.ahk
#Include biga.ahk\export.ahk

assert := new unittesting()

assert.label("generate - perform on short string")
assert.test(permutations.generate("hey").Count(), 6)
assert.test(permutations.generate("hello").Count(), 120)

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
assert.test(permutations.generate("AutoHotkey", true, 1).Count(), 1)
assert.test(permutations.generate("AutoHotkey", true, 2).Count(), 2)
assert.test(permutations.generate("AutoHotkey", true, 10).Count(), 10)
assert.test(permutations.generate("AutoHotkey", true, 20).Count(), 20)
assert.test(permutations.generate("AutoHotkey", true, 100).Count(), 100)
assert.test(permutations.generate("AutoHotkey", true, 200).Count(), 200)

assert.label("generate - ensure no mutation on input string")
string := "ahk"
permutations.generate(string)
assert.test(string, "ahk")

assert.label("generate - ensure no mutation on input array")
array := [1,2,3,4,5]
permutations.generate(array)
assert.test(array, [1,2,3,4,5])


assert.fullReport()
exitapp
