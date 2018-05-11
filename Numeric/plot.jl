using Plots; gr()

T = 1:7300
data = readcsv("taylor.csv")

plot(T, data[:,1], lab="x", w=3, alpha=0.5)
plot(T, data[:,2], lab="y", w=3, alpha=0.5)
plot(T, data[:,3], lab="z", w=3, alpha=0.5)

savefig("orbit.png")
