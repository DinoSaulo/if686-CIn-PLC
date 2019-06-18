-- producer-consumer
 
function receive(prod)
    local status, value = coroutine.resume(prod)
    return value
end
 
function send(x)
    coroutine.yield(x)
end
 
function producer()
    return coroutine.create(function()
        while true do
            local x = math.random(100) -- produce new value
            send(x)
        end
    end)
end
 
 
function consumer(prod)
    while true do
        local x = receive(prod) -- get new value
        io.write(x, "\n")       -- consume new value
    end
end
 
consumer(producer())