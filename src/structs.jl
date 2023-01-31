# key structs for the particle filtering package EpiPf
mutable struct compartment
    const name::Symbol
    count::Int
end

mutable struct parameter
    const name::Symbol
    val::Float64
end

struct transition
    trans::Function
    outComp::Symbol
    inComp::Symbol
end

struct evolve
    evolution::Function
    param::Symbol
end