#!/usr/bin/env python3
"""
Script to run run_single_problem.py for all problems in a given domain and observability level.

Usage: python3 run_domain_obs.py <domain> <observability>

Example: python3 run_domain_obs.py blocks-world 10
"""

import os
import sys
import subprocess

print("Running benchmark for domain and observability level")

HOME_DIR = os.path.expanduser("~")
THIS_DIR = os.getcwd()
DATASET_PATH = f"{HOME_DIR}/goal-plan-recognition-dataset"
RESULTS_PATH = "./results"

print(f"HOME DIR = {HOME_DIR}")
print(f"THIS DIR = {THIS_DIR}")

os.makedirs(RESULTS_PATH, exist_ok=True)

if len(sys.argv) > 2:
    domain_arg = sys.argv[1]
    degree_arg = sys.argv[2]
    print(f"Domain argument: {domain_arg}")
    print(f"Observability argument: {degree_arg}")
else:
    print("Not enough arguments provided. Domain and observability degree needed")
    print("Usage: python3 run_domain_obs.py <domain> <observability>")
    print("Example: python3 run_domain_obs.py blocks-world 10")
    sys.exit(1)

dom = str(domain_arg)
deg = str(degree_arg)

DATASET_DOM_DEG_PATH = f"{DATASET_PATH}/{dom}/{deg}"
RESULTS_DOM_DEG_PATH = f"{RESULTS_PATH}/{dom}/{deg}"

# Check if dataset path exists
if not os.path.exists(DATASET_DOM_DEG_PATH):
    print(f"Error: Dataset path does not exist: {DATASET_DOM_DEG_PATH}")
    sys.exit(1)

os.makedirs(f"{RESULTS_PATH}/{dom}", exist_ok=True)
os.makedirs(RESULTS_DOM_DEG_PATH, exist_ok=True)

print(f"\nProcessing problems from: {DATASET_DOM_DEG_PATH}")
print(f"Results will be saved to: {RESULTS_DOM_DEG_PATH}\n")

problem_count = 0
skipped_count = 0
error_count = 0

for problem in os.scandir(DATASET_DOM_DEG_PATH):
    if problem.is_file() and problem.name.endswith('.tar.bz2'):
        problem_name_no_extension = problem.name.replace('.tar.bz2', '')
        result_file_path = f"{RESULTS_DOM_DEG_PATH}/{problem_name_no_extension}.txt"
        
        if os.path.exists(result_file_path):
            print(f"[SKIP] Result file {result_file_path} already exists. Skipping.")
            skipped_count += 1
            continue
        
        print(f"[{problem_count + 1}] Processing: {problem.name}")
        
        try:
            # Run run_single_problem.py with the problem file
            cmd = ["python3", "run_single_problem.py", problem.path]
            result = subprocess.run(
                cmd, 
                check=False, 
                timeout=2000,
                capture_output=True,
                text=True
            )
            
            if result.returncode != 0:
                print(f"  [ERROR] Failed with return code {result.returncode}")
                print(f"  STDERR: {result.stderr[:200]}")
                error_count += 1
            else:
                # Move the result file to the results directory
                expected_output = f"{problem_name_no_extension}.txt"
                if os.path.exists(expected_output):
                    subprocess.run(
                        ["mv", expected_output, result_file_path],
                        check=False,
                        timeout=10
                    )
                    print(f"  [OK] Results saved to {result_file_path}")
                    problem_count += 1
                else:
                    print(f"  [ERROR] Expected output file not found: {expected_output}")
                    error_count += 1
                    
        except subprocess.TimeoutExpired as e:
            print(f"  [TIMEOUT] {e}")
            error_count += 1
        except Exception as e:
            print(f"  [ERROR] {e}")
            error_count += 1

print(f"\n{'='*60}")
print(f"DONE")
print(f"{'='*60}")
print(f"Successfully processed: {problem_count}")
print(f"Skipped (already done): {skipped_count}")
print(f"Errors: {error_count}")
print(f"Total problems: {problem_count + skipped_count + error_count}")
