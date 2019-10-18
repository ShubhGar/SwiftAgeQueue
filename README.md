# SwiftAgeQueue
SwiftAgeQueue is an open source swift Datastructue. Each elements of SwiftAgeQueue have some life and its work like a queue in FIFO order.
It have majorly 4 parts.

1. SwiftList: It is a singly linked list have node.
2. Timeslice: It contains Array of SwiftList and  have some life.
3. Deathhandler: DeathHandler is a protocol which handel death of Timeslice which spend full lifespan.
4. SwiftAgeQueue: It is a queue which have array of Timeslice. It  flushes objects out after the object has spent a certain duration in queue.
he object will be removed from the queue once it has spent a defined life.


