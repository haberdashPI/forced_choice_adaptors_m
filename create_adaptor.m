function adaptor = create_adaptor(start,bigstep,littlestep,down,up,varargin)
% create_adaptor: Create a new adaptive track (ala Levitt 1971).
% adaptor = create_adaptor(start,bigstep,littlestep,down,up,...)
%
% Create a new adaptive track which begins with a delta of 'start'
% and moves up and down according to 'bigstep' until a number of
% reversals, at which point it uses littestep. The number of
% incorrect responses to move up is equal to 'up' and the number
% of correct responses required to move down is equal to 'down'.
%
% Optional arguments:
% Specified as string value pairs, you can alter the default
% behavior of this function using these arguments. Defaults
% are indicated with '='.
%
% 'big_reverse'= 3 - how many reversals must occur to switch from the
% big to the little step.
%
% 'drop_reversals' = 3 - # of reversals to drop
% 
% 'min_reversals' = 7 - the minimum # of reversals required to find an
% estimate. 
%
% 'mult' = 0 - whether steps should be multiplicative (1) or not
% (0).
%
% 'min_delta' = -Inf. The smallest delta allowed. 

args.big_reverse = 3;
args.drop_reversals = 3;
args.min_reversals = 7;
args.mult = 0;
args.min_delta = -Inf;
if length(varargin) > 0
    args = parseargs(args,varargin);
end

adaptor.min_delta = args.min_delta;
adaptor.down = down;
adaptor.up = up;
adaptor.bigstep = bigstep;
adaptor.step = littlestep;
adaptor.big_reverse = args.big_reverse;
adaptor.drop_reversals = args.drop_reversals;
adaptor.min_reversals = args.min_reversals;
adaptor.mult = args.mult;

adaptor.num_correct = 0
adaptor.num_incorrect = 0;
adaptor.reversals = [];
adaptor.last_direction = 0;

adaptor.delta = start;
