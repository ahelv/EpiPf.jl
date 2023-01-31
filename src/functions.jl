# key functions for the particle filtering package EpiPf

function UpdateCounts!(transition, compartments, params, θ, t, n)
    comps = Dict()
    for key in keys(compartments)
        push!(comps, key => compartments[key][t][n])
    end

    change = rand(transition.trans(comps, params, θ)) # store this
    if isassigned(compartments[transition.outComp][t+1], n)
        compartments[transition.outComp][t+1][n].count -= change
        comps[transition.outComp].count -= change
    else
        compartments[transition.outComp][t+1][n] = 
            compartment(transition.outComp, 
                        comps[transition.outComp].count - change)
        comps[transition.outComp].count -= change
    end
    if isassigned(compartments[transition.inComp][t+1], n)
        compartments[transition.inComp][t+1][n].count += change
        comps[transition.inComp].count += change
    else
        compartments[transition.inComp][t+1][n] = 
            compartment(transition.inComp, 
                        comps[transition.inComp].count + change)
        comps[transition.inComp].count += change
    end
end

function UpdateParameters!(evolve, params, parameters, θ, t, n)
    parameters[evolve.param][t+1][n] = parameter(evolve.param, evolve.evolution(params, θ))
end
