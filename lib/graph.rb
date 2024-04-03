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

    #First tried this with the depth search first method, which was interesting, but didn't
    #give me the results I wanted. 
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

    #recursively runs through the bfs map returned from the bfs method and prints out an array 
    #the path taken from the origin to the destination
    def path(map, origin, dest, arr = [dest])
        bfs = map

        arr << precursor = bfs[dest][1]

        path(map, origin, precursor, arr) unless precursor == origin

        arr
    end 

    

    def get_v(coord)
        v = vertices.select {|v| v.coord == coord}
        v[0]
    end 

    def knights_move(origin, destination)
        bfs = bfs(origin)
        puts "You got to #{destination} from #{origin} in #{bfs[destination][0]} moves"
        puts "This is the path taken: "
        p path(bfs, origin, destination).reverse
    end 

    


end 

graph = Graph.new

graph.knights_move([0,0], [7,7])






    

