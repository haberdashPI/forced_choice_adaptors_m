function list = estimate_list(adatpor)
if length(adaptor.reversals) < adaptor.min_reversals:
   list = []
else
    if mod(length(adaptor.reversals),2) == 0:
        list = adaptor.reversals((adaptor.drop_reversals+2):end)
    else
        list = adaptor.reversals((adaptor.drop_reversals+1):end)
    end
end