require "./vertex"
class Graph
    attr_accessor :vertices

    #Uses a double for loop (gross, I know) to initialize the "chess board" with vertices and adjacency maps
    def initialize
        @vertices = []   
        for j in 0..7 
            for i in 0..7 
                @vertices << Vertex.new([j,i])
            end 
        end 
        append
    end 

    def append
        vertices.each {|v| v.append}
    end 

    def dfs(v, visited = [])
        vert = get_v(v)
        visited << v 
        puts v.to_s + " "

        vert.neighbors.each do |neighbor|
            if !visited.include?(neighbor)
                dfs(neighbor, visited)
            end 
        end 


    end 

    def bfs(origin)

        bfs_info = {}

        #below method initiates the bfs_info hash which takes the coordinate as the key, and 
        #sets the distance and predecessor to nil
        vertices.each do |info|
            bfs_info[info.coord] = [distance = nil, predecessor = nil]
        end 

        bfs_info[origin] = [0,nil]

        queue = []

        queue << origin

        while !queue.empty? 
            u = queue.shift

            
            get_v(u).neighbors.each do |neighbor|
                if bfs_info[neighbor][0] == nil
                    bfs_info[neighbor] = [bfs_info[u][0]+1, u]
                    queue << neighbor
                end 
            end 
        end 

        bfs_info
        
    end 

    def knights_move(origin, dest, arr = [dest])
        bfs = bfs(origin)

        arr << precursor = bfs[dest][1]

        knights_move(origin, precursor, arr) unless precursor == origin

        arr
    end 

    

    def get_v(coord)
        v = vertices.select {|v| v.coord == coord}
        v[0]
    end 


end 

graph = Graph.new




graph.bfs([3,3]).each do |v|
    p v
end 

p graph.knights_move([3,3],[4,3])


#graph.vertices.each {|v| p "#{v.coord}:  #{v.neighbors}"}






    

