-- Escreva uma função fibs que retorna um closure iterator que produz os primeiros numeros da sequência de Fibonacci. Por exemplo,

function fib(inputNumber)
	local max = inputNumber - 1
	local b4 = -1
	local now = 1
	local key = -1
	return function()
		value = b4 + now
		if key > max then
			return nil, nil
		else
			b4 = now
			now = value
			key = key + 1
			return key, value
		end
	end
end

for k,v in fib(7) do
	print("O fibonacci de " .. k .. " eh " .. v)
end