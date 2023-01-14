# Fast ![](https://github.com/ahcode0919/Fast/actions/workflows/swift.yml/badge.svg?branch=main)

A collection of helpful Swift extensions and utilities

## Usage

- Add to following to your project's Swift Package Manager dependencies: `https://github.com/ahcode0919/Fast.git`

## Features

### Array

- `[Double]`
    - `.random(range:_size:_)` create a array of random values within a specified range
- `[Float]`
    - `.random(range:_size:_)` create a array of random values within a specified range
- `[Int]`
    - `.random(range:_size:_)` create a array of random values within a specified range
- `[UInt]`
    - `.random(range:_size:_)` create a array of random values within a specified range
    
### Collections

- `OrderedSet`

### String

- `String.random(length:_)` - Create a string of alphanumeric characters of the specified length
- `chomp()` - Removes white space from the start and end of a String
- `contains(_ type: NSTextCheckingResult.CheckingType)` - Checks for matching string format. Date, link, phonenumber, etc
- `withQuotes()` - Encapsulates a String in quotations 
