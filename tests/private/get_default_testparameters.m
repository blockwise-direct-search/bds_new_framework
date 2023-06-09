function constant_value = get_default_testparameters(constant_name)
%GET_DEFAULT_PARAMETERS Get the constants needed by TESTBDS_INPUT.
%   CONSTANT_VALUE = GET_DEFAULT_TESTPARAMETERS(CONSTANT_NAME) returns the value
%   of the constant named CONSTANT_VALUE.
switch constant_name
    case {"maxfun_dim"}
        constant_value = 1000;
    case {"maxfun"}
        constant_value = 1e5;
    case {"powell_factor"}
        constant_value = 0.1;
    case {"alpha_init"}
        constant_value = 1;
    case {"expand"}
        constant_value = 2;
    case {"shrink"}
        constant_value = 0.5;
    case {"sufficient_decrease_factor"}
        constant_value = 1e-3;
    case {"accept_simple_decrease"}
        constant_value = true;
    case {"StepTolerance"}
        constant_value = eps;
    case {"ftarget"}
        constant_value = -inf;
    case {"polling_outer"}
        constant_value = "opportunistic";
    case {"cycling_outer"}
        constant_value = 3;
    case {"polling_inner"}
        constant_value = "opportunistic";
    case {"cycling_inner"}
        constant_value = 1;
    case {"with_memory"}
        constant_value = true;
    case {"nb_generator"}
        constant_value = 0.5;
    case {"nb_tag"}
        constant_value = "none";
    case {"problems_type"}
        constant_value = "u";
    case {"problems_mindim"}
        constant_value = 6;
    case {"problems_maxdim"}
        constant_value = 60;
    case {"direction"}
        constant_value = "canonical";
    case {"solvers_legend"}
        constant_value = "no-legend";
    case {"solvers_stamp"}
        constant_value = "none";
    case {"tau_minimum"}
        constant_value = -10;
    otherwise
        constant_value = "Unknown constant name";
end
end
