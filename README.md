## Heap

A heap falls with in the family of trees-based data structures.

A heap can be useful for efficient sorting (heapsort), priority queues (like a stack) and locating a minimum or maximum in constant time

More on Wikipedia:

https://en.wikipedia.org/wiki/Heap_(data_structure)

https://en.wikipedia.org/wiki/Binary_heap

### Overview

A binary heap is a binary tree with two constraints:

**Shape property**

* A heap is a complete binary tree
  * A complete binary tree is defined as having all levels of the tree fully filled except possibly the last one
  * If the last level of the complete binary tree is not filled. The nodes are filled from left to right

**Heap property**

* All nodes are either greater than or equal to or less than or equal to each of its children, according to a comparison predicate defined for the heap
  * Common comparison predicates include max-heaps and min-heaps
  * Max-heaps use the comparison predicate ">=" and min-heaps use "<=" when constructing the heap

**Max-heap**

```ruby
top of heap - >  100
                /   \
              20     40  
             /  \    / \
           10   15 32   8
```

**Min-heap**

```ruby
top of heap - >  10
                /   \
              20     40  
             /  \    / \
           30   25 45   80
```

Due to the unordered nature of heaps readjustments will occur when inserting or deleting nodes.

For example if 1000 was inserted into the previous max-heap:

```ruby
top of heap - >  100
                /   \
              20     40  
             /  \    / \
           10   15 32   8


                100
               /   \
             20     40  
            /  \    / \
          10   15 32   8
         /
      1000

                100
               /   \  
             20     40  
            /  \    / \
          1000 15 32   8
         /
        10
                100
               /   \  
             1000   40  
            /  \    / \
          20   15 32   8
         /
        10

                1000
               /   \  
             100    40  
            /  \    / \
          20   15 32   8
         /
        10
```


### Implementation Tips

* Binary heaps are typically implemented within an array
  * Ex: [1000, 100, 40, 20, 15, 32, 8, 10]
* They are adjusted using shifting (moving the contents of the given array around)
* The heap property does not lend itself to creation by insertion (like a binary search tree)
  * Creation by insertion is suboptimal versus rearranging an already complete binary tree
