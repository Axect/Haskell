-- file: ch03/BookStore.hs
type Title      = String
type Authors    = [String]
type CustomerID = Int

data BookInfo = Book Int Title Authors
                deriving (Show) -- Smart Contract

data MagazineInfo = Magazine Int Title Authors
                    deriving (Show)

myInfo = Book 9780135072455 "Algebra of Programming"
         ["Richard Bird", "Oege de Moor"]

-- WildCard
-- But this is boilerplate code
nicerID      ( Book id _     _       ) = id
nicerTitle   ( Book _  title _       ) = title
nicerAuthors ( Book _  _     authors ) = authors

data Customer = Customer { customerID      :: CustomerID
                         , customerName    :: String
                         , customerAddress :: Address
                         } deriving (Show)


