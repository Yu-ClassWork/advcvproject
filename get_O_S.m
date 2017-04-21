%%

O_ = sparse(1, 2688);
S_ = sparse(1, 2688);
sameThreshold = 1;
choose_ = nchoosek(1:2688,2);
numOfChoose_ = numel(choose_)/2;
relativeRankNat = [1,2,2,3,4,4,4,4];
relativeRankOpen = [1,2,2,4,4,4,3,1];
for i = 1:numOfChoose_
    pairToCompare = choose_(i, :);
    compareOne = pairToCompare(1);
    compareTwo = pairToCompare(2);
    typeOfOne = class_labels(compareOne);
    typeOfTwo = class_labels(compareTwo);
    typeO = 0;
    typeS = 0;
    
    if relativeRankNat(typeOfOne) == relativeRankNat(typeOfTwo)
        typeS = 1;
    else
        typeO = 1;
        rankOne = relativeRankNat(typeOfOne);
        rankTwo = relativeRankNat(typeOfTwo);
    end
    
    if typeO == 1
        O_(end+1,:) = 0;
        if rankOne > rankTwo
            O_(end,compareOne) = 1;
            O_(end,compareTwo) = -1;
        else
            O_(end,compareOne) = -1;
            O_(end,compareTwo) = 1;
        end
    elseif typeS == 1
        S_(end+1,:) = 0;
        S_(end,compareOne) = 1;
        S_(end,compareTwo) = -1;
    else
        'error'
    end
end