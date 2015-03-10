disp('First delta:');
adaptor = create_adaptor(50,5,1,3,1);
disp(adaptor.delta);

disp('Delta after 3 correct responses');
adaptor = update(adaptor,0,0);
adaptor = update(adaptor,0,0);
adaptor = update(adaptor,0,0);
disp(adaptor.delta);

disp('Delta after 1 incorrect response');
adaptor = update(adaptor,1,0);
disp(adaptor.delta);

disp('Delta estimate at this point:');
disp([num2str(estimate_thresh(adaptor)) ' (SD = ' num2str(estimate_sd(adaptor)) ')']);

responses = [0 0 0 0 0 0 0 0 0 1 0 0 0 0 0 0 0 0 0 1 1 0 0 0 0 0 0 1 0 0 0 ...
    1 0 1 0 0 0 1 1 1 0 0 0 0 0 0 1 0 0 0];
for resp = responses
    adaptor = update(adaptor,0,resp);
    %if resp
    %    disp('Delta after incorrect response:')
    %    disp(adaptor.delta);
    %else
    %    disp('Delta after correct response:')
    %    disp(adaptor.delta);
    %end
    disp(adaptor.delta);
end

disp('Delta estimate at this point:');
disp([num2str(estimate_thresh(adaptor)) ' (SD = ' num2str(estimate_sd(adaptor)) ')']);