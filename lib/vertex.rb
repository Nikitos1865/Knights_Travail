class Vertex
    attr_accessor :vertex, :coord

    def initialize(coord = [])
        @coord = [coord[0], coord[1]]
        @vertex = {coord => []}
    end 

    def append
        self.vertex[coord] <<  [@coord[0]-1, @coord[1]-2] unless (coord[0] < 1 || @coord[1] < 2)
        self.vertex[coord] << [@coord[0]+1, @coord[1]-2] unless (coord[0] > 6 || @coord[1] < 2)
        self.vertex[coord] <<  [@coord[0]-1, @coord[1]+2] unless (coord[0] < 1 || @coord[1] > 5)
        self.vertex[coord] << [@coord[0]+1, @coord[1]+2] unless (coord[0] > 6 || @coord[1] > 5)
        self.vertex[coord] << [@coord[0]-2, @coord[1]-1] unless (coord[0] < 2 || @coord[1] < 1)
        self.vertex[coord] <<  [@coord[0]-2, @coord[1]+1] unless (coord[0] < 2 || @coord[1] > 6)
        self.vertex[coord] << [@coord[0]+2, @coord[1]-1] unless (coord[0] > 5 || @coord[1] < 1)
        self.vertex[coord] << [@coord[0]+2, @coord[1]+1] unless (coord[0] > 5 || @coord[1] > 6)
    end 

end 

v = Vertex.new([3,3])

v.append

