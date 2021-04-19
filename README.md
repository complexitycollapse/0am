# 0am

A minimal test framework for Common Lisp.

There are many others, but I'm trying to hit the sweet spot of exactly
what I need, and nothing more.

Inspired by <https://github.com/lmj/1am>.

## Usage

The API consists of ```test```, ```run```, ```clear-tests```, ```is```
and ```*tests*```.

Define a test as folows:

```
(test my-test
  (is (zerop (foo))))
```

Run all defined tests with the ```run``` command. Rather than dividing
tests into 'suites', you can just use ```clear-tests``` to remove all
the defined tests and then manually evaluate the tests that you want
to run. Or you can pass a lists of tests to ```run```. (Note that the
list can consist of anything that's a valid argument to funcall, such
as symbols or functions).

If you want to define formal suites of tests, then you can use a
function like this:

```
(defun my-suite (&optional clear)
  (if clear (clear-tests))

  (test test1 ...)
  (test test2 ...))
```
