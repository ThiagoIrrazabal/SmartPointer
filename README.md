# SmartPointer for Delphi

![GitHub Contributors](https://img.shields.io/github/contributors/ThiagoIrrazabal/SmartPointer)
![GitHub Forks](https://img.shields.io/github/forks/ThiagoIrrazabal/SmartPointer?style=social)
![GitHub Issues](https://img.shields.io/github/issues/ThiagoIrrazabal/SmartPointer)
![GitHub Stars](https://img.shields.io/github/stars/ThiagoIrrazabal/SmartPointer?style=social)
![GitHub License](https://img.shields.io/github/license/ThiagoIrrazabal/SmartPointer)

This unit provides a generic `SmartPointer` class in Delphi, designed to manage object lifecycle automatically, acting as a garbage collector. It simplifies memory management by ensuring that objects are automatically freed when they are no longer needed, thus preventing memory leaks.

## Overview

The `SmartPointer` class is a generic wrapper around Delphi objects that implements reference-counting. It ensures that the object it manages is automatically destroyed when the reference count drops to zero. This class can be used in any Delphi project that requires simplified memory management, removing the need to manually free objects.

## Features

- Automatic object destruction when the reference count reaches zero.
- Supports any class that has a parameterless constructor (`constructor` constraint).
- Prevents memory leaks by managing the object lifecycle.
- Can be created with a new object or assigned an existing one.

## Usage

### Installation

To use the `SmartPointer` class in your project, include the `Classe.SmartPointer` unit in your Delphi application:

```delphi
uses
  Classe.SmartPointer;
````
Creating a `SmartPointer`
Option 1: Automatic Object Creation
You can create a `SmartPointer` that will automatically instantiate the object:

```delphi
var
  MyPointer: ISmartPointer<TMyClass>;
begin
  MyPointer := TSmartPointer<TMyClass>.Create;
  MyPointer.DoSomething; // Access your object as needed
end; // Object is automatically freed when the reference goes out of scope
````
Option 2: Using an Existing Object
Alternatively, create the `SmartPointer` with an already instantiated object:

```delphi
var
  MyPointer: ISmartPointer<TMyClass>;
begin
  MyPointer := TSmartPointer<TMyClass>.Create(TMyClass.Create);
  MyPointer.DoSomething; // Access the object through the smart pointer
end; // The object is freed automatically
````
Option 3: Using an Existing Object with Separate Instantiation
You can also pass a pre-existing, separately instantiated object to the `SmartPointer`:

```delphi
var
  MyObject: TMyClass;
  MyPointer: ISmartPointer<TMyClass>;
begin
  MyObject := TMyClass.Create;
  MyPointer := TSmartPointer<TMyClass>.Create(MyObject);
  MyPointer.DoSomething; // Access the object through the smart pointer
end; // The object is freed automatically
````
### Accessing the Object

To access the object managed by the `SmartPointer`, you can directly call methods or access properties without needing to invoke any specific method. The `SmartPointer` automatically handles the reference to the object.

```delphi
MyPointer.DoSomething;  // No need to call Invoke
````

### Contribuições:
![Snake animation](https://github.com/ThiagoIrrazabal/SmartPointer/blob/main/dist/snake.svg)
