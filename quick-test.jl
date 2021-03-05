# Test new_refresh_graph

using QuNet

# Make Graph
Q = QNetwork()
A = BasicNode("A")
C = BasicNode("C")
B = BasicNode("B")
AB = BasicChannel(A, B, exp_cost=false)
AC = BasicChannel(A, C, exp_cost=false)
CB = BasicChannel(C, B, exp_cost=false)
AB.costs = unit_costvector()
AC.costs = unit_costvector()
CB.costs = unit_costvector()

for i in [A, B, C, AB, AC, CB]
    add(Q, i)
end

QuNet.new_refresh_graph!(Q)
println(Q.graph["Z"])
ne(Q.graph["Z"])
