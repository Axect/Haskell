class BoolLike a where
  fromBoolLike :: a -> Bool

instance BoolLike (Maybe a) where
  fromBoolLike Nothing = False
  fromBoolLike (Just _) = True

instance BoolLike Int where
  fromBoolLike = (0 /=)

instance BoolLike Bool where
  fromBoolLike x = x
