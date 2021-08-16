function [zones, reward] = longRangePlan()
    distance = 2*depth;     %center of each of the cardinal zones
    zones = zeros(8, 2);    %8 squares
    reward = zeros(8);
    zones(1,:) = [row + distance, col];     %right
    zones(2,:) = [row - distance, col];     %left
    zones(3,:) = [row, col + distance];     %up
    zones(4,:) = [row, col - distance];     %down
    zones(5,:) = [row + distance, col + distance];      %up-right
    zones(6,:) = [row + distance, col - distance];      %up-left
    zones(7,:) = [row - distance, col + distance];      %down-right
    zones(8,:) = [row - distance, col - distance];      %down-left
    
    for i=1:8
        reward(i) = squareAgregate(zones(i,:), depth);
    end
end

%test average and sum version
function reward = squareAgregate(location, depth)
    row = location(1);
    col = location(2);
    start = [row-depth, col-depth];
    bounds = [row+depth, col+depth];
    reward = 0;
    for i=start(1):bounds(1)
        for j=start(2):bounds(2)
            if i < 1 || j < 1; continue; end
            reward = reward + getReward(uncertainty, agent, currentVertex, repulsiveForceCoeff, numAgents, mapSize, uavRows, uavCols, distanceMap, alpha);
        end
    end
    reward = reward;
end