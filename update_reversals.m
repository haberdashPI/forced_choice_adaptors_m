function adaptor = update_reversals(adaptor,direction)
if adaptor.last_direction && direction ~= adaptor.last_direction
    adaptor.reversals = [adaptor.reversals adaptor.delta];
end
adaptor.last_direction = direction;