type CardHolder = String
type CardNumber = String
type Address    = [String]
type CustomerID = Int

-- Algebraic Data Type
data BillingInfo = CreditCard CardNumber CardHolder Address
                 | CashOnDelivery
                 | Invoice CustomerID
                   deriving (Show)
