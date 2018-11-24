// Siddhesh Rajiv Karekar
// karekar@usc.edu

// Q1. Create the graph
g = TinkerGraph.open().traversal()
g.addV('course').property(id, 'CS101').as('CS101').
addV('course').property(id, 'CS201').as('CS201').
addV('course').property(id, 'CS220').as('CS220').
addV('course').property(id, 'CS334').as('CS334').
addV('course').property(id, 'CS400').as('CS400').
addV('course').property(id, 'CS420').as('CS420').
addV('course').property(id, 'CS526').as('CS526').
addV('course').property(id, 'CS681').as('CS681').
addE('requires pre-req').from('CS201').to('CS101').
addE('requires pre-req').from('CS220').to('CS201').
addE('requires pre-req').from('CS420').to('CS220').
addE('requires pre-req').from('CS334').to('CS201').
addE('requires pre-req').from('CS400').to('CS334').
addE('requires pre-req').from('CS681').to('CS334').
addE('requires pre-req').from('CS526').to('CS400').
addE('is a co-req of').from('CS420').to('CS220').
addE('is a co-req of').from('CS526').to('CS400').iterate()

// Q2. Write a query that will output JUST the doubly-connected nodes.
g.V().as('a').outE().inV().as('b').select('a','b').groupCount().unfold().filter(select(values).is(eq(2))).select(keys)

// Q3. Write a query that will output all the ancestors (for us, these would be prerequisites) of a given vertex.
g.V().has(id,'CS526').repeat(out().dedup()).emit()

// Q4. Write a query that will output the max depth starting from a given node (provides a count (including itself) of all the connected nodes till the deepest leaf).
g.V().has(id,'CS101').repeat(__.in()).emit().path().count(local).max()

// Alternative Bonus: Queries 2-4 were done in a single command and query 1 in two commands instead of the Eulerian Circuit problem.
