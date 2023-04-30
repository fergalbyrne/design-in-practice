# Introduction

This small book is about a very big idea in databases, or perhaps a small set of very big ideas that
change everything about how your software uses the database. Datomic is the flagship example of a new 
kind of database system, and this book is about how Datomic works in its latest 
incarnation - _Datomic Cloud_.

Datomic is written (mostly) in Clojure, the dialect of LISP for the JVM created by Rich Hickey between 2005
and 2007. Clojure is important to this story because, in a way, Clojure was created to make things like Datomic,
and indeed Datomic is like a highpoint of the Clojure way of thinking (this'll become clearer
as we go on). 

Clojure is also important in this book, as it is among the best computer languages for expressing ideas 
in precisely the way you would code them for real. If Clojure is not your bag, no problem, you can 
find extensive documentation on how to do exactly what's shown here using Datomic's Java APIs
(the Java APIs are actually primary in the design, so you'll not lose out either way).

~~~admonish warning
Precise details in this book may differ from what's current in the Datomic you're looking at. 
Please take care to consult the relevant docs and guides provided by Cognitect at 
[https://docs.datomic.com/cloud/](https://docs.datomic.com/cloud/). Let me know if there's
any material updates and I'll incorporate them here ASAP.
~~~


~~~admonish info title='Design'
~~~

