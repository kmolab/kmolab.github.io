import time
import math
   
   
class Chromosome(object):
   
    def __init__(self, n=None):
        self.np = n if n > 0 else 2
        self.f = 0.0
        self.v = [0.0] * n
   
    def cp(self, obj):
        """
        copy all atribute from another chromsome object
        """
        self.np = obj.np
        self.f = obj.f
        self.v = obj.v[:]
   
    def get_v(self, i):
        return self.v[i]
   
    def is_self(self, obj):
        """
        check the object is self?
        """
        return obj is self
   
    def assign(self, obj):
        if not self.is_self(obj):
            self.cp(obj)
   
   
class Genetic(object):
   
    def __init__(self, func, pType, nParm, nPop, pCross, pMute, pWin, bDelta, upper, lower):
        """
        init(function func)
        """
        self.func=func
        self.pType = pType
        self.nParm=nParm
        self.nPop=nPop
        self.pCross=pCross
        self.pMute=pMute
        self.pWin=pWin
        self.bDelta=bDelta
   
        self.chrom = [Chromosome(nParm) for i in range(nPop)]
        self.newChrom = [Chromosome(nParm) for i in range(nPop)]
        self.babyChrom = [Chromosome(nParm) for i in range(3)]
        self.chromElite = [Chromosome(nParm)]
        self.chromBest = [Chromosome(nParm)]
        self.maxLimit = upper[:]
        self.minLimit = lower[:]
   
        self.maxGen = None
        self.gen = None
   
        self.seed = 0.0
        self.iseed = 470211272.0
        self.mask = 2147483647
   
    def check(self, i, v):
        """
        If a variable is out of bound,
        replace it with a random value
        """
        if (v > self.maxLimit[i]) or (v < self.minLimit[i]):
            return self.randVal(self.minLimit[i], self.maxLimit[i])
        return v
   
    def crossOver(self):
        for i in range(0, self.nPop-1, 2):
            # crossover
            if(self.rnd() < self.pCross):
                for s in range(self.nParm):
                    # first baby, half father half mother
                    self.babyChrom[0].v[s] = 0.5 * self.chrom[i].v[s] + 0.5*self.chrom[i+1].v[s];
                    # second baby, three quaters of fater and quater of mother
                    self.babyChrom[1].v[s] = self.check(s, 1.5 * self.chrom[i].v[s] - 0.5*self.chrom[i+1].v[s])
                    # third baby, quater of fater and three quaters of mother
                    self.babyChrom[2].v[s] = self.check(s,-0.5 * self.chrom[i].v[s] + 1.5*self.chrom[i+1].v[s]);
   
                for j in range(3):
                    self.babyChrom[j].f = self.func(self.babyChrom[j].v)
                # maximization
                if self.pType == 1:
                       
                    if self.babyChrom[1].f > self.babyChrom[0].f:
                        self.babyChrom[0], self.babyChrom[1] = self.babyChrom[1], self.babyChrom[0]
   
                    if self.babyChrom[2].f > self.babyChrom[0].f:
                        self.babyChrom[2], self.babyChrom[0] = self.babyChrom[0], self.babyChrom[2]
   
                    if self.babyChrom[2].f > self.babyChrom[1].f:
                        self.babyChrom[2], self.babyChrom[1] = self.babyChrom[1], self.babyChrom[2]
   
                else:
                       
                    if self.babyChrom[1].f < self.babyChrom[0].f:
                        self.babyChrom[0], self.babyChrom[1] = self.babyChrom[1], self.babyChrom[0]
   
                    if self.babyChrom[2].f < self.babyChrom[0].f:
                        self.babyChrom[2], self.babyChrom[0] = self.babyChrom[0], self.babyChrom[2]
   
                    if self.babyChrom[2].f < self.babyChrom[1].f:
                        self.babyChrom[2], self.babyChrom[1] = self.babyChrom[1], self.babyChrom[2]
   
                # replace first two baby to parent, another one will be
                self.chrom[i].assign(self.babyChrom[0])
                self.chrom[i+1].assign(self.babyChrom[1])
   
    def delta(self, y):
        r = float(self.gen) / self.maxGen;
        return y*self.rnd()*math.pow(1.0-r, self.bDelta)
   
    def fitness(self):
        for j in range(self.nPop):
            self.chrom[j].f = self.func(self.chrom[j].v)
   
        self.chromBest[0].assign(self.chrom[0])
   
        for j in range(self.nPop):
            if self.pType == 1:
                if(self.chrom[j].f > self.chromBest[0].f):
                    self.chromBest[0].assign(self.chrom[j])
            else:
                if(self.chrom[j].f < self.chromBest[0].f):
                    self.chromBest[0].assign(self.chrom[j])
        if self.pType == 1:
            if(self.chromBest[0].f > self.chromElite[0].f):
                self.chromElite[0].assign(self.chromBest[0])
        else:
            if(self.chromBest[0].f < self.chromElite[0].f):
                self.chromElite[0].assign(self.chromBest[0])
   
    def initialPop(self):
        for j in range(self.nPop):
            for i in range(self.nParm):
                self.chrom[j].v[i] = self.randVal(self.minLimit[i], self.maxLimit[i])
   
    def mutate(self):
        for i in range(self.nPop):
            if self.rnd() < self.pMute:
                s = self.random(self.nParm)
                if (self.random(2) == 0):
                    self.chrom[i].v[s] += self.delta(self.maxLimit[s]-self.chrom[i].v[s])
                else:
                    self.chrom[i].v[s] -= self.delta(self.chrom[i].v[s]-self.minLimit[s])
   
    def report(self):
        if self.gen == 0:
            print("Genetik results - Initial population")
        elif self.gen == self.maxGen:
            print("Final Genetik results at", self.gen, "generations")
        else:
            print("Genetik results after", self.gen, "generations")
   
        print("Function : %.6f" % (self.chromElite[0].f))
        for i, p in enumerate(self.chromElite[0].v):
            print("Var", i+1, ":", p)
   
    def select(self):
        """
        roulette wheel selection
        """
        for i in range(self.nPop):
            j = self.random(self.nPop)
            k = self.random(self.nPop)
            self.newChrom[i].assign(self.chrom[j])
            if self.pType == 1:
                if(self.chrom[k].f > self.chrom[j].f) and (self.rnd() > self.pWin):
                    self.newChrom[i].assign(self.chrom[k])
            else:
                if(self.chrom[k].f < self.chrom[j].f) and (self.rnd() < self.pWin):
                    self.newChrom[i].assign(self.chrom[k])
        # in this stage, newChrom is select finish
        # now replace origin chrom
        for i in range(self.nPop):
            self.chrom[i].assign(self.newChrom[i])
   
        # select random one chrom to be best chrom, make best chrom still exist
        j = self.random(self.nPop);
        self.chrom[j].assign(self.chromElite[0])
   
    def run(self, mxg, rp):
        """
        // **** Init and run GA for maxGen times
        // **** mxg : maximum generation
        // **** rp  : report cycle, 0 for final report or
        // ****       report each mxg modulo rp
        """
        self.maxGen = mxg
        self.rpt = rp
   
        self.randomize()
        self.initialPop()
        self.chrom[0].f = self.func(self.chrom[0].v)
        self.chromElite[0].assign(self.chrom[0])
   
        self.gen = 0
        self.fitness()
        self.report()
   
        for self.gen in range(1, self.maxGen + 1):
            self.select()
            self.crossOver()
            self.mutate()
            self.fitness()
            if rp != 0:
                if self.gen % self.rpt == 0:
                    self.report()
        self.report()
   
    def newSeed(self):
        if(self.seed == 0.0):
            self.seed=self.iseed
        else:
            self.seed *= 16807.0
            self.seed = math.fmod(self.seed, self.mask)
   
    def rnd(self):
        self.newSeed()
        return self.seed/self.mask
   
    def randomize(self):
        self.seed = time.time()
   
    def random(self, k):
        return int(self.rnd()*k)
   
    def randVal(self, low, high):
        number_types = (int, float)
        if isinstance(low, number_types) and isinstance(high, number_types):
            return self.rnd()*(high-low)+low
        raise ValueError
           
#fittness function (cost function)
def evaluate(designVariablel):
    surface = 80.0
    # if pType is 1, the penality is negative (maximization problem)
    # if pType is 0, the penality is positive (minimization problem)
    penality = -1000
   
    z = (surface-designVariablel[0]*designVariablel[1])/(2.0*(designVariablel[0]\
         +designVariablel[1]))
    volume = designVariablel[0]*designVariablel[1]*z
     
    if(volume <= 0):
        return penality
   
    # box length and width need to be larger than 0
    if(designVariablel[0] <= 0):
        return penality
   
    if(designVariablel[1] <= 0):
        return penality
    #return 1+1/(volume*volume)
    return volume
   
#volume = Genetic(self, func, pType, nParm, nPop, pCross, pMute, pWin, bDelta, upper, lower):
volume = Genetic(evaluate, 1, 2, 1000, 0.95, 0.05, 0.95, 5, [0, 0], [50, 50])
volume.run(1000, 50)