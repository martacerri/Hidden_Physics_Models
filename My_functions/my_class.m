classdef my_class

    properties
        testcase
        params
        usol
        t
        x
        l1
        l2
    end

    methods
        function obj = my_class(tc,p,u,t,x)              % obj è tipo *this
            obj.testcase = tc;
            obj.params = p;
            obj.usol = u;
            obj.t = t;
            obj.x = x;
        end

        function [] = plot_lambda(obj)
            plot_lambda(obj.params);
        end
        
        function [] = suggest_N(obj)
            plot_interpolantN(obj.params);
        end

        function [] = lambda(obj)
            lambda_statistics(obj);
        end

        function obj = plot_solution(obj)
            plot_sol(obj.usol, obj.t, obj.x);
        end

        function [] = plot_estimated_solution(obj)
            plot_estim_sol(obj.l1, obj.l2, obj.usol, obj.t, obj.x);
        end

    end
end