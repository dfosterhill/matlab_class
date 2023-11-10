# In-Class Example 1

Below is a sketch of a pendulumn. This is a classic problem in physics where the pendulumn oscillates back and forth, constantly trading potential energy for kinetic energy and vice versa.

![pendulumn](../../images/pendulumn.jpg)

The equation that describes this motion is 

$$\frac{d^{2}\theta}{dt^{2}}+\frac{g}{L}\sin(\theta)=0$$

where g is gravity (9.81 $m^2 s^{-1}$) and L is the pendulumn length in m. If we assume that the angle of deflection ($\theta$) of the pendulumn is small, this simplifies to

$$\frac{d^{2}\theta}{dt^{2}}+\frac{g}{L}\theta=0$$

So, this is a second-order ordinary differential equation (ODE). With a second order ODE, you need two initial conditions. These are the *initial position* and the *initial velocity* of the penulum, or $\theta$ and $d\theta/dt$. I would like you to write a piece of code that will numerically integrate this equation. Use $L=1m, $\theta(t=0)=0.5$ radians and $d\theta/dt(t=0)=0$ radians per second. This initial condition corresponds to the pendulumn being released from rest with a small deflection. Use the technique of re-casting the single second order equation as a system of two first-order equations. In other words, use:

$$z_{1}=\theta$$

$$z_{2}=\frac{d\theta}{dt}=\frac{dz_{1}}{dt}$$

