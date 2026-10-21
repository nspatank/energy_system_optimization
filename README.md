Energy System Optimization
-

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


### Description

This course will teach students constrained optimization problems and associated solution methods, how to implement and apply linear and mixed integer linear programs to solve such problems using [Julia](https://julialang.org/)/[JuMP](https://jump.dev/JuMP.jl/dev/), and the practical application of such techniques in energy systems engineering.

The course will first introduce students to the theory and mathematics of constrained optimization problems and provide a brief introduction to linear programming, including problem formation and solution algorithms.

Finally, to build hands-on experience with optimization methods for energy systems engineering, the course will introduce students to several canonical problems in power and energy systems planning and operations, including: economic dispatch, unit commitment, and capacity planning.


### Student quickstart: Constrained Optimization

1. Install **Julia 1.13.2** for your operating system from the
   [official downloads page](https://julialang.org/downloads/manual-downloads/).
   With Juliaup installed, use `juliaup add 1.13.2` and run the commands below
   with `julia +1.13.2` instead of `julia` if another version is your default.
2. Download this repository using **Code → Download ZIP** and unzip it, or clone
   it with Git. Open a terminal in the extracted repository folder (the folder
   containing `start_notebook.jl`).
3. Run:

   ```sh
   julia start_notebook.jl
   ```

   If Julia is not on your PATH, use the full path to its executable. On Windows,
   reopen the terminal after installation. Alternatively, open the Julia application
   and run `include("/full/path/to/energy_system_optimization/start_notebook.jl")`.
   On Windows, use forward slashes in this path, such as `C:/Users/YourName/...`.
4. The launcher installs Jupyter automatically and opens it in your browser. Open **Notebooks → 01-Constrained-Optimization.ipynb**,
   select **Julia 1.13.2 - Energy System Optimization** if prompted, and choose
   **Run → Run All Cells** (or **Cell → Run All** in older Jupyter versions).

**Complete the first launch before class.** It needs internet access and can take
several minutes to download and compile Julia packages and install Jupyter. Subsequent launches reuse the
installed packages. No separate Python or Jupyter installation is required.
Keep the terminal open while working; press **Ctrl+C** there to stop Jupyter.
Use **File → Save Notebook**, and keep your downloaded folder to preserve your work.

The launcher activates this repository's `Project.toml`, installs the versions
recorded in `Manifest.toml`, installs a private Python/Jupyter environment from
`CondaPkg.toml`, and registers the course kernel. Packages, compiled caches,
Jupyter, and the kernel are stored under `.local/`, which Git ignores. Start Jupyter
through this script so it can find the repository-local kernel. If you move the
folder, run the script again to refresh the kernel paths.

This environment supports **the Constrained Optimization notebook**. Later
notebooks require additional packages, including JuMP and optimization solvers.
The notebook has been executed through its Jupyter kernel on macOS with Julia
1.13.2, including all 16 code cells and 10 interactive plots. Windows and Linux
have not yet been tested.

If the browser does not open, copy the localhost URL printed in the terminal
into your browser. If the course kernel is missing, stop Jupyter and rerun the
launcher. To install all dependencies and the kernel without opening Jupyter, run
`julia start_notebook.jl --setup-only`.
To print a browser link without automatically opening a browser, use
`julia start_notebook.jl --no-browser`.

### Instructor's local Julia runtime

The optional `./julia` shell launcher uses an Apple Silicon Julia 1.13.2 runtime
installed at `.local/julia-1.13.2`. That runtime is ignored by Git and is **not
included in downloads of this repository**. Students should use the cross-platform
quickstart above. On this checkout, `./julia start_notebook.jl` uses the local runtime.

### Notebooks

1. [Constrained Optimization](Notebooks/01-Constrained-Optimization.ipynb)
2. [Anatomy of the model](Notebooks/02-Anatomy-of-a-Model.ipynb)
3. [Basic Capacity Expansion](Notebooks/03-Basic-Capacity-Expansion.ipynb)
4. [Economic Dispatch](Notebooks/04-Economic-Dispatch.ipynb)
5. [Unit Commitment](Notebooks/05-Unit-Commitment.ipynb)
6. [Optimal Power Flow](Notebooks/06-Optimal-Power-Flow.ipynb)
7. [Complex Capacity Expansion](Notebooks/07-Complex-Capacity-Expansion.ipynb)


### Homeworks



### License and copyright

If you would like to use these materials, please see the [license and copyright page](LICENSE.md).
