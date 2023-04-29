# Chapter 0 - Overview

It's quite likely that most readers of this book simply take for granted what a "traditional
database" is, mostly because these databases have become the default in the 25 years since the
dot-com era. This chapter is aimed at explaining the most important characteristics of a traditional
database system, including the reasons for the most important design choices behind them.

```admonish note
Newer database architectures claiming to solve some of the issues with traditional 
RDBMS's will be dealt with shortly.
```

### What a Database System is for

The choices behind these designs made good sense in a world that looked like this (VAX 11/780, late 1970's):

| Fact (at the time)                                | Typical Value                   | Some Consequences                                                                                                                                            |
|----------------------------------------------------------|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Individual computers are a major purchasing decision     | $350K+ (incl disks)             | Plan and purchase a computer system which fully meets your needs for multiple years ahead                                                                    |
| CPU power is super-expensive and limited                 | <1MIPS                          | Centralise query and updates in a single powerful machine                                                                                                    |
| Memory is extremely expensive                            | 1MB RAM                         | Provision only the memory needed to process your workload                                                                                                    |
| Durable Storage (tape/hard disks) are expensive and slow | 10ms seek 300MB disk $160K      | Use storage sparingly: keep one copy of any data on disk, backup on a schedule to tape. Connect all your storage to the server with the powerful CPU and RAM | 
| Networks are really slow                                 | dialup 9.6Kb/s - ethernet 1Mb/s | Minimise chatty back and forth queries - pack up as much into your query as possible, ask for as much back as you can                                        |
| Programmers are relatively cheap                         | $15-20K/year                    | Business has fixed requirements, programmers can spend days or weeks writing a given fixed query for a report                                                |
| Requirements change slowly | quarterly                       | Once written, queries and/or stored procedures can remain unchanged for years |

Obviously things have changed substantially in the several decades since the late 1970's, but 
importantly they changed quite incrementally between then and now. As a result, the designers 
and developers of RDBMS systems have modified their designs one step at a time to take advantage 
of the improvements as they occurred. We'll take note of these changes as we go along.

Let's go into a bit more detail about some of these aspects:

~~~admonish info title="'item' of information"
In this discussion, we'll be thinking of the information in the database as consisting of many small,
aggregates of atomic or primitive values, which we'll call *item*s. For example, the information
about me might include my first and last names, which would each be a string-valued item.
In Clojure we'd represent my information something like this:
```clojure
(def fergal-info 
  {:first-name "Fergal" :last-name "Byrne" ...})
```
~~~

### Update In Place

Due to the high cost of hard disks back in the day, the storage available for your data was very 
limited, so it made sense to store the data in a way where each item of data was in a _single place_
in the larger store of items.

When new data came in, consisting of new _values_ for these items, what you would do is go to the _place_
for each item and overwrite the old value with the new,  a strategy known as __update in place__. 

Several things fall out from this. First, for each potential item of information, _there is a place_: each 
item has some sort of coordinates telling you how to either find the current value or where to
write in a new value. In a traditional RDBMS, the coordinates are expressed as `<Table>.<Row>.<Column>` (see below).

Secondly, because there's only one place for a value, you can only store the current value in that place, and any
previous values will disappear unless you do something else to record them. Later, as disks became
bigger and bigger, we could start keeping some copies of the old data, for example in places called
_shadow tables_ - these improvements were sometimes supported by the RDBMS, sometimes roll-your-own, and always pretty
optional.

Thirdly, the layout or **schema** of the database should avoid having multiple copies of an item. For example,
in an eCommerce system, every `Order` has a customer, but we don't want to store the customer's first name
and last name along with each of their orders - instead we'll store those in a single place for `Customer`s, and
refer to that customer using the `customer-id` (this is called a **foreign key** as it is a key used in the `Order` for another 
kind of data - the `Customers`). There is literally a whole theory of designing databases around these 
concepts, and a database in the right layout is described as being in _normal form_.

### A Client-Server Architecture - "It's _Over There_"

The extreme of this is the dumb terminal remote-controlling the central mainframe or minicomputer, but from the 1980's the 
typical business app running on a microcomputer, PC or workstation operated by compiling queries to send to
the RDBMS and get back results in some binary form, all over a _connection_ to the RDBMS.

### Structured Query Language (SQL) - a string-based interface

### Tables, Rows and Columns - 'coordinates' for items and 'shapes' for data


### ACID Transactions

- **A**tomic - either all operations in the transaction occur, or none of them
- **C**onsistent - 
- **I**solated
- **D**urable

### Indexes


```mermaid
graph TD;
    A-->B;
    A-->C;
    B-->D;
    C-->D;
```
