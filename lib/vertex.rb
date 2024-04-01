class Vertex
    attr_accessor :vertex, :edges

    def initialize(vertex = [])
        @vertex = vertex
        @edges = []
        @edges << [vertex[0]-1, vertex[1]-2] unless (vertex[0] < 1 || vertex[1] < 2)
        @edges << [vertex[0]+1, vertex[1]-2] unless (vertex[0] > 6 || vertex[1] < 2)
        @edges << [vertex[0]-1, vertex[1]+2] unless (vertex[0] < 1 || vertex[1] > 5)
        @edges << [vertex[0]+1, vertex[1]+2] unless (vertex[0] > 6 || vertex[1] > 5)
        @edges << [vertex[0]-2, vertex[1]-1] unless (vertex[0] < 2 || vertex[1] < 1)
        @edges << [vertex[0]-2, vertex[1]+1] unless (vertex[0] < 2 || vertex[1] > 6)
        @edges << [vertex[0]+2, vertex[1]-1] unless (vertex[0] > 5 || vertex[1] < 1)
        @edges << [vertex[0]+2, vertex[1]+1] unless (vertex[0] > 5 || vertex[1] > 6)
    end 
    
end 
