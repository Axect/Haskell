# -----------------------------------
# Chap.2 Expressions & Types & Values
# Author: Tae Geun Kim (Axect)
# -----------------------------------

* 나와있는 코드는 Vim + Tmux로 실행하기를 권장합니다. 자세한 사항은 https://github.com/Axect/Typora 의 haskell+vim.md 를 참조하세요.

보통 우리는 함수를 Explicit하게 작성합니다.

> succ, double :: Int -> Int
> succ n = n + 1
> double n = 2*n

하지만 하스켈에서는 Section이라 불리는 신기한 기능을 제공하는데, Section에서는 연산자와 한 개의 argument가 괄호 안에 들어갑니다.

> (+1) n = n + 1
> (0<) n = 0 < n
> (<0) n = n < 0
> (1/) x = 1 / x

따라서 이것들을 합성하려면 다음과 같이 써야합니다.

> ((+1) . (*2)) 3

답은 7이 나오지만, 이것은 매우 이상한 형식이고, . 따라서 우리는 이름을 짓지 않으면서 효율적인 방안을 모색해야 할 필요가 있습니다.
답안은 이미 과거부터 잘 알려져 있는데, 바로 Lambda 표현식입니다.

> map (\n -> 2*n + 1) [1..5]

하스켈은 느긋한 계산 (Lazy Evaluation)을 좋아하는데, 극단적인 예로 다음 예시를 들 수 있습니다.

> infinity :: Integer
> three :: Integer -> Integer
> infinity = infinity + 1
> three x = 3

무한대와 three라는 함수를 위와 같이 지정했을 때, 다음의 결과는 뭐가 나올까요?

> three infinity

만일, 느긋하지 않은 계산이라면 Stack Overflow Error 가 일어날 것입니다. 무한대부터 계산한 후 그것을 three에 대입해야되니까요. 하지만, 느긋한 계산에서는 답은 그저 3입니다. three는 x가 무엇이든 간에 답이 3이 나오니까요. 따라서 Haskell에서는 답이 3으로 바로 나옵니다.

> factorial :: Integer -> Integer
> factorial n = fact(n,1)
> fact :: (Integer, Integer) -> Integer
> fact(x,y) = if x == 0 then y else fact(x-1, x*y)

하지만 Lazy 가 항상 좋기만 한 것은 아닙니다. 위의 Factorial 예시를 보면 Eager와 Lazy는 계산단계는 동일하지만, Lazy가 좀 더 메모리소비를 하는 것을 알 수 있죠. 따라서 같은 함수형 프로그래밍 언어일지라도 Eager Evaluation을 택하는 언어도 있습니다. (ML 등등)  하지만 효율적으로 잘 짠다면, 크게 문제는 없습니다.

함수에는 Strict 개념이 있습니다. 만일, f undefined = undefined 라면, 그 함수 f는 strict한거죠. 반대로 아니라면, non-strict 입니다. 예를 들어, (+) 는 strict한 함수지만, three는 아닙니다. 
Haskell이 Lazy Evaluation을 사용하기 때문에 우리는 비록 그 함수가 non-strict한 함수일지라도 정의할 수 있습니다. 이것이 바로 Haskell이 non-strict functional language라고 불리는 이유입니다.

Haskel은 Int, Float, Char이라는 Built-in(or primitive)타입이 존재합니다. Bool은 Built-in 타입이 아니라 data declaration으로 선언된 타입입니다.

> data Bool = False | True

위의 Bool Type은 False와 True라는 두 가지 형태의 Data Constructor를 가지고 있습니다. 하지만, 실제로 Type Bool은 세 가지 값을 가지고 있습니다. True, False, undefined죠. 마지막이 필요한 것은 True가 무한 루프를 불러오기 때문에 그를 제한하기 위해서 입니다.

Haskell은 Compound Type을 갖고 있는데, 이는 다음과 같습니다.

* [Int] = a list of elements, all of type Int
* (Int, Char) = a pair consisting of an Int and a Char
* (Int, Char, Bool) = a triple
* () = an empty tuple
* Int -> Int = a function from Int to Int

Haskell에는 polymorphic function을 위한 기능도 존재합니다. 예를 들어 list의 원소를 가져오는 take 함수를 봅시다.

> take 3 [1,2,3,4,5] -- = [1,2,3]
> take 3 "category"  -- = "cat"
> take 3 [sin,cos]   -- = [sin,cos]

take의 정체는 다음과 같죠.

> take :: Int -> [a] -> [a]

즉, Int를 받고 임의의 타입의 리스트를 받으면 출력값이 그 타입의 List가 됩니다. 이때, a를 타입변수라고 합니다.
몇 가지를 더 봅시다.

> (++) :: [a] -> [a] -> [a]
> map  :: (a -> b) -> [a] -> [b]
> (.)  :: (b -> c) -> (a -> b) -> (a -> c)

여기까지는 충분히 이해하기 쉽습니다. 다음을 봅시다.

> (+) :: Num a => a -> a -> a

Num a 는 하스켈의 고유 기능 중 하나인 Type Class에 속합니다. 모든 Number a (Integer, Real etc.) 에 대하여 a -> a -> a 를 하라는 의미죠.
Type Class를 선언하는 것 역시 간단합니다.

> class Eq a where
>   (==),(/=) :: a -> a -> Bool
>   x /= y = not (x==y)

다만, 이것으로는 모호합니다. x==y의 의미가 정립되지 않았기 때문이죠. 따라서 정의해봅시다.

> instance Eq Bool where
>   x == y = if x then y else not y

> instance Eq Person where
>   x == y = (pin x == pin y)

이렇게 정의해두면, Bool과 Person은 Eq 라는 하나의 범주에 묶이게 됩니다. 더불어 == 과 /= 라는 연산자를 사용할 수 있게 되죠.

다음은 기본타입클래스의 몇 가지 간단한 정의입니다.

> class (Eq a) => Ord a where
>   (<),(<=),(>=),(>) :: a -> a -> Bool
>   x < y = not (x >= y)
>   x <= y = x == y || x < y
>   x >= y = x == y || x > y
>   x > y = not (x <= y)

Haskell 에서는 print를 하면 괴랄해지는 경향이 있습니다. 다음을 해보세요.

> print $ "안녕하세요"

웬 숫자들만 나타납니다. 그렇다면 이번엔 다음을 해보세요.

> putStrLn "안녕하세요"

예쁘게 나타납니다. 이는 print의 타입과 putStrLn의 타입이 다르기 때문인데, String에 한해서는 putStrLn이 좋다는 것만 알면 될 것 같습니다.

