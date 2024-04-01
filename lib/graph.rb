require "./vertex"
class Graph
    attr_accessor :vertices

    def initialize
        @vertices = []   
        for j in 0..7 
            for i in 0..7 
                @vertices << Vertex.new([j,i])
            end 
        end 
    end 


end 

graph = Graph.new

p graph.vertices.each {|v| p v.vertex}