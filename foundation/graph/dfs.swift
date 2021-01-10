/*
 DFS in Graph
 Time: O(V + E)
 */

class Vertex<T> {
 
    let value: T
    var visited: Bool = false
    var adjacencyList: [Vertex] = []

    init(value: T) {
        self.value = value
    }
}

func dfs(from vertex: Vertex<Any>) {
    vertex.visited = true
    for adjacentVertex in vertex.adjacencyList {
        if !adjacentVertex.visited {
            dfs(from: adjacentVertex)
        }
    }
}

