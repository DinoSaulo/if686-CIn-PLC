instance Visivel Char where
    toString ch = [ ch ]
    size _ = 1
instance Visivel Bool where
    toString True = "True"
    toStringFalse = "False"
    size _ = 1