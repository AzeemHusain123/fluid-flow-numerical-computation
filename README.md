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
