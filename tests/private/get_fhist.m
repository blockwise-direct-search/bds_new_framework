function [fhist_perfprof, fval] = get_fhist(p, maxfun, j, r, solver_options, test_options)
% Get fhist and related information of j-th solver on p problem.

% Gradient will be affected by scaling_matrix
name_solver = solver_options.solvers(j);
solver = str2func(name_solver);
fhist_perfprof = NaN(maxfun,1);

% Scaling_matrix
% Find better way to deal with scaling_matrix
% if test_options.scaling_matrix
%    scaling_matrix = get_scaling_matrix(p,test_options);
% else
%    scaling_matrix = eye(length(p.x0));
% end

% Maxfun_dim will be an input.
if isfield(solver_options, "maxfun_dim")
   options.maxfun = min(solver_options.maxfun, solver_options.maxfun_dim*length(p.x0));
end

[options] = get_options(p, j, name_solver, solver_options, options);

% Turn off warning to save computation resource.
prima_list = ["cobyla", "uobyqa", "newuoa", "bobyqa", "lincoa"];
if ~isempty(find(prima_list == name_solver, 1))
    warnoff(name_solver);
end

% Experimence with noise (if num_random == 1, then the experiment has no noise)
obj = ScalarFunction(p);
solver(@(x)obj.fun(x,test_options.is_noisy,r,test_options), p.x0, options);

% Turn off warning is a very dangerous thing. So it must be set a loop to
% trun on after ending the computation.
if ~isempty(find(prima_list == name_solver, 1))
    warnoff(name_solver);
end

% In case meeting simple decrease but not sufficient decrease. Also, fval
% should always be the one without noise!
fval = min(obj.valHist);

% length of fhist and ghist
fhist_length = obj.nEval;
fhist_perfprof(1:fhist_length) = obj.valHist(1:fhist_length);
if  fhist_length < maxfun
    fhist_perfprof(fhist_length+1:maxfun) = fhist_perfprof(fhist_length);
else
    fhist_perfprof = fhist_perfprof(1:maxfun);
end

end
