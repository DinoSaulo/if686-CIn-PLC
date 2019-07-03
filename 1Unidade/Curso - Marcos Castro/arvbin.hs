data ArvBin = Nulo | No Int ArvBin ArvBin

arv :: ArvBin
arv = (No 1 
			(No 2 
				(No 4 Nulo Nulo) (No 5 Nulo Nulo))
			(No 3 
				(No 6 Nulo Nulo) Nulo))

em_ordem :: ArvBin -> [Int]
em_ordem Nulo = []
em_ordem (No num esq dir) = (em_ordem esq) ++ [num] ++ (em_ordem dir)