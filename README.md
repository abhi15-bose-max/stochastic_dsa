Deterministic Stochastic Arithmetic (DSA) Hardware Prototype

This project explores an alternative hardware architecture for multiplication-heavy workloads (such as AI inference and linear algebra) using stochastic computing.

Instead of using traditional digital multipliers, numbers are represented as probabilities encoded in stochastic bitstreams, allowing multiplication to be implemented using simple logic gates.

The design is implemented in Verilog and simulated using Icarus Verilog and GTKWave.

Core Idea

In stochastic computing, a real number in the range [0,1] is represented as a bitstream, where the probability of a bit being 1 corresponds to the value.

Example:

Value	Example Bitstream
0.5 -	101001011010...
0.25 -	100001000100...
0.75 -	111011011110...

If

P(A = 1) = a
P(B = 1) = b

then

P(A AND B) = a × b

Therefore multiplication can be implemented using a single AND gate.


Architecture:

The hardware pipeline implemented in this project is:

Scalar values (INT8)
        ↓
Random / quasi-random generator
        ↓
Comparator
        ↓
Stochastic bitstream generator
        ↓
AND-based stochastic multipliers
        ↓
Counter accumulators
        ↓
Vector dot products / matrix multiplication

This replaces traditional multipliers with simple logic gates and counters, potentially reducing hardware complexity and power.

Example: Vector Dot Product

The following vectors were tested:

A = [0.5, 0.25, 0.75, 0.125]
B = [0.5, 0.5, 0.5, 0.5]

These values are stored as 8-bit magnitudes:

INT8	Value
128 -	0.5
64	- 0.25
192	- 0.75
32	- 0.125

Exact dot product:

0.5×0.5 + 0.25×0.5 + 0.75×0.5 + 0.125×0.5
= 0.8125

Simulation result (1000 stochastic cycles):

Estimated result ≈ 0.879

The difference arises from stochastic variance, which decreases as the bitstream length increases.

Example: Matrix Multiplication

Matrices used:

A =
[0.5   0.25]
[0.75  0.125]

B =
[0.5   0.25]
[0.5   0.25]

Exact result:

C =
[0.375   0.1875]
[0.4375  0.21875]

Stochastic simulation output:

C11 = 329
C12 = 152
C21 = 446
C22 = 207

These values represent counts of 1s in the stochastic streams and correspond to approximate probabilities close to the exact results.

Implemented Modules

The current prototype includes the following Verilog modules:

sobol_generator.v
comparator.v
stochastic_bitstream.v
stochastic_multiplier.v
counter_accumulator.v
stochastic_vector_dot_product.v
stochastic_matrix_multiply.v

Testbenches are provided for simulation and verification.
