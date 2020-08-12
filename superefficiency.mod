# Number of DMUs
param N;

# Number of Inputs
param M;

# Number of Outputs
param S;

# Set of DMUs
set DMUs := 1..N;

# Set of Input Data
set Inputs := 1..M;

# Set of Output Data
set Outputs := 1..S;

# Input data
param input{i in DMUs, j in Inputs};

# Output data
param output{i in DMUs, j in Outputs};

# DMU in question
param DMUanalysed;

# Lambdas as decision variables
var lambda{DMUs} >=0;

# Eta - objective function value
var eta;

# Objective function
minimize efficiency: eta;

# Input equations
subject to inputEqs{i in Inputs}: sum {j in DMUs} lambda[j]*input[j,i] <= eta * input[DMUanalysed,i];

# Output equations
subject to outputEqs{r in Outputs}: sum {j in DMUs} lambda[j] * output[j,r] >= output[DMUanalysed,r];

# Remove the country in question from the set
subject to cons: lambda[DMUanalysed] = 0;