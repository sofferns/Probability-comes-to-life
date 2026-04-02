Probability in Motion: CLT & Random Walk Simulations

A visual exploration of fundamental probabilistic concepts, implemented using Java and the Processing library. This project bridges the gap between abstract mathematical theorems and interactive software.

🚀 Overview

This repository features two distinct stochastic simulations:

1. The Central Limit Theorem (CLT) Visualization

This simulation demonstrates the emergence of the Gaussian (Normal) Distribution. By performing repeated, independent probabilistic experiments and aggregating the results, the simulation visually shows how the empirical distribution converges into the iconic "Bell Curve," regardless of the underlying distribution of the individual variables.

2. 1D Symmetric Random Walk

A classic model in stochastic processes. The simulation tracks a "walker" moving on a one-dimensional line, where each step is taken either to the right or to the left with a probability of P=0.5. It provides a clear visual intuition for the properties of random movements and variance over time.

🛠 Technical Highlights

The core of this project wasn't just the math, but the software architecture behind it:

• Object-Oriented Programming (OOP): Each simulation component (the "walker," the "data bars," the "environment") is encapsulated as a distinct object. This allowed for clean, reusable, and maintainable code.

• Design Patterns: Used to manage the flow of the simulations and the rendering engine. This ensures that the logic of the mathematical calculations is decoupled from the visual representation.

• Optimization: Handling real-time rendering of large data sets to ensure smooth visual convergence of the distributions.

👨‍💻 About Me

I am a Mathematics and Computer Science student at the Technion - Israel Institute of Technology. I am passionate about visualizing complex systems and using software engineering to provide intuition for deep mathematical truths.

🎮 How to Run

1. Download and install Processing.

2. Clone this repository:

git clone https://github.com/sofferns/Probability-comes-to-life.git

3. Open the .pde files in the Processing IDE and hit Run.
