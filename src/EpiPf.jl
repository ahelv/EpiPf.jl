module EpiPf

# package dependencies 
using CSV, DataFrames, Random, LinearAlgebra, 
      Plots, Distributions, ColorSchemes, PlotThemes 

# Include your package code here.
export 
    # functions
    UpdateCounts!,
    # structs
    compartment, 
    parameter,
    transition


include("functions.jl")
include("structs.jl")

end

