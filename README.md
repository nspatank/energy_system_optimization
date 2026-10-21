Energy System Optimization
-

[![License: CC BY 4.0](https://img.shields.io/badge/License-CC%20BY%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by/4.0/) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)


### Description

This course will teach students constrained optimization problems and associated solution methods, how to implement and apply linear and mixed integer linear programs to solve such problems using [Julia](https://julialang.org/)/[JuMP](https://jump.dev/JuMP.jl/dev/), and the practical application of such techniques in energy systems engineering.

The course will first introduce students to the theory and mathematics of constrained optimization problems and provide a brief introduction to linear programming, including problem formation and solution algorithms.

Finally, to build hands-on experience with optimization methods for energy systems engineering, the course will introduce students to several canonical problems in power and energy systems planning and operations, including: economic dispatch, unit commitment, and capacity planning.


### Student quickstart: Course notebooks

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

This environment includes the dependencies for **all seven course notebooks**,
including JuMP, HiGHS, GLPK, CSV, DataFrames, PrettyTables, and VegaLite.
Use the same course kernel for every notebook; no package installation inside
the notebooks is needed. Notebook 7 uses the included 10-day dataset by default;
larger datasets and integer optimization experiments can take longer to solve.
All seven course notebooks were executed in fresh Julia 1.13.2 Jupyter kernels
on macOS on October 21, 2026. Notebooks 2–7 passed all 167 code cells, including
solver-status checks, plot rendering, and result exports. Unit commitment uses
the MIP gap tolerances specified in the notebook. Notebook 7 was checked with
its default 10-day dataset; other time samples were not executed.
Windows and Linux have not yet been tested.

If the browser does not open, copy the localhost URL printed in the terminal
into your browser. If the course kernel is missing, stop Jupyter and rerun the
launcher. To install all dependencies and the kernel without opening Jupyter, run
`julia start_notebook.jl --setup-only`.
To print a browser link without automatically opening a browser, use
`julia start_notebook.jl --no-browser`.

### Notebook validation

After setting up the course environment, the following command executes notebooks
2–7 in separate Julia kernels and checks that every optimization solve returns a
feasible optimum:

```sh
.local/jupyter-env/bin/python scripts/validate_notebooks.py
```

On Windows, use `.local/jupyter-env/python.exe` instead. The script uses temporary
copies of input data so validation does not overwrite course result files. Executed
notebooks and the latest report are saved under `.local/validation/`. To run a
single notebook, append its filename, for example
`06-Optimal-Power-Flow.ipynb`. Notebook 1 can also be selected explicitly.

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
