#!/usr/bin/env python3
"""
Script to run prob_PR.py for a given problem file and generate a summary report.

Usage: python3 run_single_problem.py <problem_file_path>
"""

import sys
import os
import subprocess
import tarfile
import tempfile
import shutil
import time


def count_observations(obs_file_path):
    """Count the number of non-empty lines in obs.dat file."""
    if not os.path.exists(obs_file_path):
        return 0
    
    with open(obs_file_path, 'r') as f:
        lines = [line.strip() for line in f if line.strip()]
    return len(lines)


def parse_report(report_file_path):
    """Parse the report.txt file and extract relevant metrics."""
    if not os.path.exists(report_file_path):
        raise FileNotFoundError(f"Report file not found: {report_file_path}")
    
    with open(report_file_path, 'r') as f:
        content = f.read()
    
    lines = content.strip().split('\n')
    
    # Get number of hypotheses
    num_hyps = None
    for line in lines:
        if line.startswith('Num_Hyp='):
            num_hyps = int(line.split('=')[1])
            break
    
    if num_hyps is None:
        raise ValueError("Could not find Num_Hyp in report.txt")
    
    # Parse all hypotheses
    hypotheses = []
    current_hyp = {}
    
    for line in lines:
        if line.startswith('Hyp_Atoms='):
            # Start of a new hypothesis
            if current_hyp:
                hypotheses.append(current_hyp)
            current_hyp = {'atoms': line.split('=', 1)[1]}
        elif line.startswith('Hyp_Prob_O='):
            current_hyp['prob_o'] = float(line.split('=')[1])
        elif line.startswith('Hyp_Is_True='):
            current_hyp['is_true'] = line.split('=')[1] == 'True'
    
    # Add the last hypothesis
    if current_hyp:
        hypotheses.append(current_hyp)
    
    # Find the highest probability
    max_prob = max(hyp['prob_o'] for hyp in hypotheses)
    
    # Find all hypotheses with the highest probability (for SPREAD)
    top_hyps = [hyp for hyp in hypotheses if hyp['prob_o'] == max_prob]
    spread = len(top_hyps)
    
    # Check if any of the top hypotheses is the true one (for CORRECT)
    correct = any(hyp.get('is_true', False) for hyp in top_hyps)
    
    return num_hyps, spread, correct


def run_recognizer(problem_file_path):
    """Run prob_PR.py with the given problem file and measure execution time."""
    if not os.path.exists(problem_file_path):
        raise FileNotFoundError(f"Problem file not found: {problem_file_path}")
    
    # Build command
    cmd = ['python3', 'prob_PR.py', '-e', problem_file_path]
    
    print(f"Running: {' '.join(cmd)}")
    
    # Run the recognizer and measure time
    start_time = time.time()
    result = subprocess.run(cmd, capture_output=True, text=True)
    end_time = time.time()
    
    elapsed_time = end_time - start_time
    
    if result.returncode != 0:
        print(f"Error running prob_PR.py:")
        print(f"STDOUT: {result.stdout}")
        print(f"STDERR: {result.stderr}")
        raise RuntimeError(f"prob_PR.py failed with return code {result.returncode}")
    
    return elapsed_time


def extract_results(tar_path, temp_dir):
    """Extract the results.tar.bz2 file to a temporary directory."""
    if not os.path.exists(tar_path):
        raise FileNotFoundError(f"Results tar file not found: {tar_path}")
    
    print(f"Extracting {tar_path} to {temp_dir}")
    
    with tarfile.open(tar_path, 'r:bz2') as tar:
        tar.extractall(path=temp_dir)
    
    return temp_dir


def generate_summary(num_hyps, observations, correct, spread, elapsed_time, output_file):
    """Generate the summary report."""
    summary = f"""HYPS = {num_hyps}
OBSERVATIONS = {observations}
CORRECT = {correct}
SPREAD = {spread}
TIME = {elapsed_time:.6f}
"""
    
    with open(output_file, 'w') as f:
        f.write(summary)
    
    print(f"\nSummary written to {output_file}:")
    print(summary)


def main():
    if len(sys.argv) != 2:
        print("Usage: python3 run_single_problem.py <problem_file_path>")
        sys.exit(1)
    
    problem_file_path = sys.argv[1]
    
    try:
        # Step 1: Run the recognizer
        print(f"\n=== Running recognizer for {problem_file_path} ===\n")
        elapsed_time = run_recognizer(problem_file_path)
        print(f"\nRecognizer completed in {elapsed_time:.6f} seconds")
        
        # Step 2: Extract results
        tar_path = './results.tar.bz2'
        temp_dir = tempfile.mkdtemp(prefix='pr_results_')
        
        try:
            extract_results(tar_path, temp_dir)
            
            # Step 3: Parse report.txt
            report_path = os.path.join(temp_dir, 'report.txt')
            num_hyps, spread, correct = parse_report(report_path)
            
            # Step 4: Count observations
            obs_path = os.path.join(temp_dir, 'obs.dat')
            observations = count_observations(obs_path)
            
            # Step 5: Generate summary
            problem_name = os.path.basename(problem_file_path)
            # Remove .tar.bz2 extension if present
            if problem_name.endswith('.tar.bz2'):
                problem_name = problem_name[:-8]
            output_file = f'{problem_name}.txt'
            generate_summary(num_hyps, observations, correct, spread, elapsed_time, output_file)
            
        finally:
            # Clean up temporary directory
            if os.path.exists(temp_dir):
                shutil.rmtree(temp_dir)
                print(f"\nCleaned up temporary directory: {temp_dir}")
    
    except Exception as e:
        print(f"\nError: {e}", file=sys.stderr)
        sys.exit(1)


if __name__ == '__main__':
    main()
