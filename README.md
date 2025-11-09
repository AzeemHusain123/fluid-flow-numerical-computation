# 💧 Fluid Flow in a Pipe Network (Numerical Computation Project)

**Semester:** 5th  
**Subject:** Numerical Computation  
**Language:** MATLAB  
**Author:** Azeem Husain  

---

## 📘 Project Overview
This project solves the **fluid flow in a pipe network** using **numerical methods** — specifically the **Newton-Raphson method** and an **iterative approach**.  
It determines the pressure (`P`) at different points in a pipe based on given constants like flow rate (`Q`), pipe coefficient (`K`), and source pressure (`S`).

The project demonstrates:
- Root-finding using Newton-Raphson method  
- Iterative method for convergence  
- Plotting convergence results  

---

## ⚙️ Equations Used

1. **Function:**
   \[
   f(P) = K \sqrt{S - P} - Q
   \]

2. **Derivative:**
   \[
   f'(P) = -\frac{K}{2\sqrt{S - P}}
   \]

3. **Newton-Raphson Update Formula:**
   \[
   P_{n+1} = P_n - \frac{f(P_n)}{f'(P_n)}
   \]

4. **Iterative Update:**
   \[
   P_{n+1} = P_n + \frac{2(Q - K\sqrt{S - P_n})\sqrt{S - P_n}}{K}
   \]

---

## 🧮 Example Parameters

| Variable | Meaning | Example |
|-----------|----------|----------|
| `Q` | Flow rate | 15 |
| `K` | Pipe constant | 2.5 |
| `S` | Source pressure | 100 |
| `P0` | Initial guess | 90 |
| `tol` | Convergence tolerance | 1e-6 |
| `max_iter` | Max iterations | 100 |

---

## 🧰 How to Run (MATLAB)

1. Open MATLAB or Octave.  
2. Copy the code into a file named `fluid_flow_solver.m`.  
3. Run the file:
   ```matlab
   fluid_flow_solver


---

## ✅ Recommended Next Step – Convert to Python 🐍

Yes — you’re absolutely right.  
Doing this project in **Python** makes it more flexible, easier to debug, and perfect for sharing on GitHub or running anywhere (without MATLAB).

Here’s a **Python version** of your MATLAB program (fully equivalent and much simpler):

```python
import math
import matplotlib.pyplot as plt

# Constants
Q = -15
K = 2.5
S = 100

# Function and its derivative
def f(P):
    return K * math.sqrt(S - P) - Q

def df(P):
    return -K / (2 * math.sqrt(S - P))

# Initial guess and parameters
P0 = 90
tol = 1e-6
max_iter = 100

# Newton-Raphson Method
root_estimates = []
for i in range(max_iter):
    P1 = P0 - f(P0) / df(P0)
    root_estimates.append(P1)
    if abs(P1 - P0) < tol:
        print(f"Root found: {P1:.6f} after {i+1} iterations")
        break
    P0 = P1
else:
    print(f"Did not converge after {max_iter} iterations")

# Plot the root estimates
plt.plot(range(1, len(root_estimates)+1), root_estimates, '-o')
plt.xlabel('Iteration Number')
plt.ylabel('Root Estimate')
plt.title('Newton-Raphson: Root Estimate vs Iteration')
plt.grid(True)
plt.show()

# Iterative method
Q = 15
Pn = 90
Ps = 100
epsilon = 1e-6
max_iter = 100
error = float('inf')
iter_count = 0

print("\nIteration\tP(n)\t\tError")
while error > epsilon and iter_count < max_iter:
    iter_count += 1
    if Ps - Pn <= 0:
        print("Iteration stopped: Ps - Pn <= 0")
        break
    P_next = Pn + (2 * (Q - K * math.sqrt(Ps - Pn)) * math.sqrt(Ps - Pn)) / K
    error = abs(P_next - Pn)
    print(f"{iter_count}\t\t{P_next:.6f}\t{error:.6e}")
    Pn = P_next

if error <= epsilon:
    print(f"Converged to P = {Pn:.6f} after {iter_count} iterations.")
else:
    print("Did not converge within the maximum number of iterations.")

