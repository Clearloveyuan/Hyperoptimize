using Hyperopt,GalacticOptim

rosenbrock(x,a) =  sum(@. x + (a[1]-1)^2 + (a[2]-1)^2)
x0 = zeros(1)
a0 = [1.00,1.00]
prob = OptimizationProblem(rosenbrock,x0,a0)

"Define a function as an API to searve for GalacticOptim as a hyperparameters optimization method. item is the parameter to control the
number of iteration. x is a variable that can be set in advance."
function Hyperoptimize(x,item)
ho = @hyperopt for i=item,
                     sampler = RandomSampler(), # This is default if none provided
                     a0[1] = LinRange(-2,2,1000),
                     #a0[2] = exp10.(LinRange(-2,2,1000))
                     a0[2] = LinRange(-2,2,1000)
                     print(i, "\t", a0[1], "\t", a0[2], "   \t")
                     x1 = x
                     @show prob.f(x1,a0)
                 end
print('\n')
print("Minimize Parameters:")
print('\n')
printmin(ho)

end

? Hyperoptimize()

Hyperoptimize(10,600)


#If we incorporate the following code into Galactic.jl/src/solve.jl function, we can use sol = solve(prob,Hyperoptimize(10,10)) to get the final result.


function Hyperoptimize(x,item)
ho = @hyperopt for i=item,
                     sampler = RandomSampler(), # This is default if none provided
                     a0[1] = LinRange(-2,2,1000),
                     #a0[2] = exp10.(LinRange(-2,2,1000))
                     a0[2] = LinRange(-2,2,1000)
                     print(i, "\t", a0[1], "\t", a0[2], "   \t")
                     x1 = x
                     @show prob.f(x1,a0)
                 end
printmin(ho)
end
    
    
function __solve(prob::OptimizationProblem, opt::Hyperoptimize,
                 data = DEFAULT_DATA;
                 maxiters = nothing,
                 cb = (args...) -> (false),
                 progress = false,
                 kwargs...)
        Hyperoptimize(x,item)
end