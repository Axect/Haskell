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

