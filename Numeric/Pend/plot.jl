using Plots; gr()

data = readcsv("pend.csv")
plot(data[:,1], data[:,2], w=3, alpha=0.6)
savefig("pend.png")
