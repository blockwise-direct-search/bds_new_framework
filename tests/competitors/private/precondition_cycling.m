function [] = precondition_cycling(array, index, strategy, with_memory)

[isrv, ~]  = isrealvector(array);
assert(isrv);  

assert(isintegerscalar(index));

assert(isintegerscalar(strategy) && 0<=strategy && strategy<=5);

assert(islogicalscalar(with_memory));
end
