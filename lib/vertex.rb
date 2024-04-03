class Vertex
    attr_accessor :coord, :neighbors

    def initialize(coord = [])
        @coord = [coord[0], coord[1]]
        @neighbors = []
    end 

    def append
        @neighbors <<  [@coord[0]-1, @coord[1]-2] unless (coord[0] < 1 || @coord[1] < 2)
        @neighbors << [@coord[0]+1, @coord[1]-2] unless (coord[0] > 6 || @coord[1] < 2)
        @neighbors <<  [@coord[0]-1, @coord[1]+2] unless (coord[0] < 1 || @coord[1] > 5)
        @neighbors << [@coord[0]+1, @coord[1]+2] unless (coord[0] > 6 || @coord[1] > 5)
        @neighbors << [@coord[0]-2, @coord[1]-1] unless (coord[0] < 2 || @coord[1] < 1)
        @neighbors <<  [@coord[0]-2, @coord[1]+1] unless (coord[0] < 2 || @coord[1] > 6)
        @neighbors << [@coord[0]+2, @coord[1]-1] unless (coord[0] > 5 || @coord[1] < 1)
        @neighbors << [@coord[0]+2, @coord[1]+1] unless (coord[0] > 5 || @coord[1] > 6)
    end 

end 


