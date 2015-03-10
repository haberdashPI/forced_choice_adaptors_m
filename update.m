function adaptor = update(adaptor,user_response,correct_response)
if user_response == correct_response
    adaptor.num_correct = adaptor.num_correct + 1;
    adaptor.num_incorrect = 0;

    if adaptor.num_correct >= adaptor.down
        adaptor.num_correct = 0;
        adaptor = update_reversals(adaptor,-1);

        if length(adaptor.reversals) < adaptor.big_reverse
            if adaptor.mult
                new_delta = adaptor.delta / adaptor.bigstep;
            else
                new_delta = adaptor.delta - adaptor.bigstep;
            end
        else
            if adaptor.mult
                new_delta = adaptor.delta / adaptor.step;
            else
                new_delta = adaptor.delta - adaptor.step;
            end
            
        end
    else
        new_delta = adaptor.delta;
    end
    adaptor.delta = max(new_delta,adaptor.min_delta);        
else
    adaptor.num_incorrect = adaptor.num_incorrect + 1;
    adaptor.num_correct = 0;

    if adaptor.num_incorrect >= adaptor.up
        adaptor.num_incorrect = 0;
        adaptor = update_reversals(adaptor,1);

        if length(adaptor.reversals) < adaptor.big_reverse
            if adaptor.mult
                new_delta = adaptor.delta * adaptor.bigstep;
            else
                new_delta = adaptor.delta + adaptor.bigstep;
            end
        else
            if adaptor.mult
                new_delta = adaptor.delta * adaptor.step;
            else
                new_delta = adaptor.delta + adaptor.step;
            end
        end
    else
        new_delta = adaptor.delta;
    end
        adaptor.delta = max(new_delta,adaptor.min_delta);
end