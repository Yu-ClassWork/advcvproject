%%

O_ = zeros(1, 2688);
S_ = zeros(1, 2688);
sameThreshold = 1;
choose_ = nchoosek(1:2688,2);
numOfChoose_ = numel(choose_);
for i = 1:numOfChoose_
    pairToCompair = choose_(i, :);
    
    typeOfOne = class_labels(pairToCompair(1));
    typeOfTwo = class_labels(pairToCompair(2));
    O_(end+1,:) = 0;
    S_(end+1,:) = 0;
    
    
    if typeO == 1
        if rankOne > rankTwo
            O_(end,typeOfOne) = -1;
            O_(end,typeOfTwo) = 1;
        else
            O_(end,typeOfOne) = 1;
            O_(end,typeOfTwo) = -1;
        end
    elseif typeS == 1
        S_(end,typeOfOne) = 1;
        S_(end,typeOfTwo) = -1;
    else
        'error'
    end
end