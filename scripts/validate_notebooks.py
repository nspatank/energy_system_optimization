"""Execute course notebooks in fresh kernels, with outputs isolated in temporary folders.

Run with .local/jupyter-env/bin/python scripts/validate_notebooks.py
Requires the course kernel installed by start_notebook.jl.
"""
import argparse
import json
import os
import re
from pathlib import Path
import shutil
import tempfile
import time

import nbformat
from nbclient import NotebookClient

ROOT = Path(__file__).resolve().parents[1]
os.environ['JUPYTER_DATA_DIR'] = str(ROOT / '.local/jupyter')
parser = argparse.ArgumentParser(description=__doc__)
parser.add_argument('notebooks', nargs='*', help='Notebook filenames; defaults to 02–07')
args = parser.parse_args()
paths = [ROOT / 'Notebooks' / name for name in args.notebooks] if args.notebooks else sorted((ROOT / 'Notebooks').glob('0[2-7]-*.ipynb'))
report = []
for path in paths:
    start = time.monotonic()
    print(f'START {path.name}', flush=True)
    with tempfile.TemporaryDirectory(prefix='energy-notebook-') as tmp:
        work = Path(tmp)
        for folder in (ROOT / 'Notebooks').iterdir():
            if folder.is_dir() and folder.name.endswith('_data'):
                shutil.copytree(folder, work / folder.name)
        (work / 'results').mkdir()
        nb = nbformat.read(path, as_version=4)
        # Also verify each solve, including models inside notebook functions.
        for cell in nb.cells:
            if cell.cell_type == 'code':
                cell.source = re.sub(r'(?m)^(\s*)(?:@time )?optimize!\((\w+)\)([^\n]*)$',
                    r'\g<0>\n\1@assert is_solved_and_feasible(\2) "Optimization did not return a feasible optimum"', cell.source)
        try:
            NotebookClient(
                nb, timeout=1800, kernel_name='energy-system-optimization',
                resources={'metadata': {'path': str(work)}},
                on_cell_start=lambda cell, cell_index: print(f'  Cell {cell_index}', flush=True) if cell.cell_type == 'code' else None,
            ).execute()
            result = {'notebook': path.name, 'status': 'PASS', 'seconds': round(time.monotonic()-start, 1), 'code_cells': sum(c.cell_type == 'code' for c in nb.cells)}
        except Exception as exc:
            result = {'notebook': path.name, 'status': 'FAIL', 'seconds': round(time.monotonic()-start, 1), 'error': str(exc)}
        logdir = ROOT / '.local' / 'validation'
        logdir.mkdir(parents=True, exist_ok=True)
        nbformat.write(nb, logdir / path.name)
        report.append(result)
        (logdir / 'latest-report.json').write_text(json.dumps(report, indent=2))
        print(json.dumps(result), flush=True)
if any(r['status'] != 'PASS' for r in report):
    raise SystemExit(1)
