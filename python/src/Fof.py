import sys


class Point:
    def __init__(self, x=0, y=0):
        self.x = x
        self.y = y 



class Fof:
    def __init__(self):
        self.points=[Point(0.1, 3.452),
                     Point(3.23, 453.34)]

    def findA(self, x):
        a = None
        i = 0
        while i < len(self.points):
            if (self.points[i].x > x):
                return a
            else:
                a = self.points[i]
            i += 1
        return a

    def findB(self, x):
        print x
        i = 0
        while i < len(self.points):
            if (self.points[i].x > x):
                return self.points[i]
            i += 1
        return None


    def interpolate(self, x, a, b):
        return a.y + ((b.y - a.y) *   ((x - a.x) / (b.x - a.x)))

    def getYforX(self, x):
        a = self.findA(x)
        b = self.findB(x)
        return self.interpolate(x, a, b)




if __name__ == '__main__':
    x =  float(sys.argv[1])
    fof = Fof()
    print fof.getYforX(x) 
