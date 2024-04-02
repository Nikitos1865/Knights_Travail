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


end 

graph = Graph.new



graph.vertices.each {|v| p "#{v.coord}:    #{v.vertex[v.coord]}"}
    

