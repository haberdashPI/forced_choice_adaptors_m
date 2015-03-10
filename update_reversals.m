function update_reversals(adaptor,direction)
if adaptor.last_direction & direction ~= adaptor.last_direction
    adaptor.reversals.append(adaptor.delta)
    adaptor.last_direction = direction
end