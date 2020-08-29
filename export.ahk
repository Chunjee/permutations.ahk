class permutations {
	; --- Static Methods ---
	generate(param_array, param_stringOut:=false, param_maxPermutations:="") {
		savedBatchLines := A_BatchLines

		; prepare inputs
		if (!IsObject(param_array)) {
			param_array := StrSplit(param_array)
		}

		; create
		this.outArray := []
		l_length := param_array.Count()
		l_permutationsArray := this._gen(l_length, param_array.Clone(), param_maxPermutations)

		; return array of arrays if user didn't specify param_stringOut
		if (param_stringOut == false) {
			SetBatchLines, % savedBatchLines
			return l_permutationsArray
		}
		l_outArrayStringified := []
		for _, l_obj in l_permutationsArray {
			l_string := ""
			for l_index, l_value in l_obj {
				l_string .= l_value
			}
			l_outArrayStringified.push(l_string)
		}
		SetBatchLines, % savedBatchLines
		return l_outArrayStringified
	}
	
	_gen(param_n:="", param_array:="", param_maxPermutations:="") {
		; prepare defaults
		if (param_n == "") {
			param_n := param_array.Count()
		}

		; create
		if (param_n == 1) {
			this.outArray.push(param_array.Clone())
		}
		loop, % param_n
		{
			; exit early if user specified param_maxPermutations and that number is reached
			if (param_maxPermutations) {
				if (param_maxPermutations <= this.outArray.Count()) {
					return this.outArray
				}
			}
			this._gen(param_n - 1, param_array, param_maxPermutations)
			if (mod(param_n, 2) != 0) {
				this._swap(param_array, 1, param_n) ;odd
			} else {
				this._swap(param_array, A_Index, param_n)
			}
		}
		return this.outArray
	}

	_swap(param_array, param_index1, param_index2) {
		tempVar := param_array[param_index1]
		param_array[param_index1] := param_array[param_index2]
		param_array[param_index2] := tempVar
		return param_array
	}
}
