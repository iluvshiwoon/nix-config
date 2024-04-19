const fs = require('fs')

function fib(n) {
    if (n < 2) {
        return n
    }
    return (fib(n - 1) + fib(n - 2))
}

const x = fib(5)
contt y = fib(*)

console.log('x: ', x, '| y: ', y)
