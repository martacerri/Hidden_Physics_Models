# Hidden_Physics_Models
Hidden Physics Models are essentially data-efficient learning machines capable of leveraging the underlying laws of physics, expressed by time dependent and nonlinear partial differential equations, to extract patterns from high-dimensional data generated from experiments. The proposed methodology may be applied to the problem of learning, system identification, or data-driven discovery of partial differential equations. Our framework relies on Gaussian Processes, a powerful tool for probabilistic inference over functions, that enables us to strike a balance between model complexity and data fitting. The effectiveness of the proposed approach is demonstrated through a variety of canonical problems, spanning a number of scientific domains, including the Navier-Stokes, Schrödinger, Kuramoto-Sivashinsky, and time dependent linear fractional equations. The methodology provides a promising new direction for harnessing the long-standing developments of classical methods in applied mathematics and mathematical physics to design learning machines with the ability to operate in complex domains without requiring large quantities of data.

For more details, please refer to the following: (https://maziarraissi.github.io/HPM/)

Raissi, Maziar, and George Em Karniadakis. "Hidden Physics Models: Machine Learning of Nonlinear Partial Differential Equations." arXiv preprint arXiv:1708.00588 (2017).

Raissi, Maziar, and George Em Karniadakis. "Hidden physics models: Machine learning of nonlinear partial differential equations." Journal of Computational Physics 357 (2018): 125-141.

## Brief Description
Starting from the work and the code provided by the authors (Raissi, Maziar, and George Em Karniadaki), our goal was to critically inspect the results and then try to adress arising questions. 
The code that we provide was meant just for our analysis so it is not commented in details. If you are interested, do not hesitate to contact us!

## Provided Code 
- [Function](https://github.com/martacerri/Hidden_Physics_Models/tree/main/Functions): contains the functions provided by the authors of the orginal work
## Our implemented code
- [My_Functions](https://github.com/martacerri/Hidden_Physics_Models/tree/main/My_functions): contains the functions that we wrote to answer our questions concerning      possible improvements and generalizations
  - `my_class.m`: stucture of the class to store the outputs 
  - `my_function.m`: takes as input data (file .mat) and the test case (label indicating the PDE considered) and returns a my_class object
  - [Plots](https://github.com/martacerri/Hidden_Physics_Models/tree/main/My_functions/Plots) : contains auxiliar functions to display some plots
  - [Statistics](https://github.com/martacerri/Hidden_Physics_Models/tree/main/My_functions/Statistics) : contains functions to perform some statistical analysis
- `direct_prediction.m`: function that predicts the estimates of the parameters of the given equation
- `error_lessN.m` : function that computes how the predictions get worse if we decrease the number of training data
- `my_main.m` : main file
- `set_test.m` : function that associates a tag to the physical equation
  - Burgers <-- 1
  - KdV <-- 2
  - KS <-- 3
  - Schrodinger <-- 4
  - Navier-Stokes <-- 5
 
 RMK: to generate new data it is necessary to dowload the Chebfun folder (https://www.chebfun.org/download/)


## Presentation
The presentation can be found in [Presentation](https://github.com/martacerri/Hidden_Physics_Models/tree/main/Presentation) folder.

## Authors
- Marta Cerri ([@martacerri](https://www.github.com/martacerri))
- Martina Ciancarelli ([@martinaciancarelli](https://www.github.com/martinaciancarelli))
- Samuele Brunati ([@samub11](https://www.github.com/samub11))
