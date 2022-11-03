#include <iostream>
#include <emscripten/bind.h>

using namespace emscripten;

constexpr int product(int x, int y) 
{ 
    return (x * y); 
}

constexpr int factorial(int n) {
  if(n > 1)
    return n * factorial(n - 1);
  else
    return 1;
}

template<typename T>
constexpr int sum(T v) {
    return v;
}

template<typename T, typename... Types>
constexpr int sum(T v, Types&&... others) {
    return v + sum(others...);
}

const int PRODUCT_30_20 =  product(30, 20);

EMSCRIPTEN_BINDINGS(my_module) {
    constant("HARDCODED_1234567890", 1234567890); // YES, it is constant 
    constant("PRODUCT_30_20", PRODUCT_30_20); // not constant
    constant("PRODUCT_10_20", product(10, 20)); // not constant
    function("factorial", &factorial); // not constexpr, 
    constant("SUM_42_14_2_18_9", sum(42, 14, 2, 18, 9));  // not constant
}


