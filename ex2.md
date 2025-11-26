# Astro 528 Lab 9
## Exercise 2:  Using a workflow management system

Goals:
- Use a workflow management system

In this exercise, you will inspect three different [Snakemake](https://snakemake.readthedocs.io/en/stable/) scripts.
The Astro 528 environment that is loaded when you start a Jupyter lab session activates a conda environment that already provides access snakemake.  
If instead you log in via ssh, then the key steps from that script to have access to snakemake are
```shell
module load anaconda/2023
eval "$(/storage/icds/RISE/sw8/anaconda-2023.09-0/bin/conda shell.bash hook)"
module load julia/1.11.2
conda activate /storage/egroup/hpc4astro/default/astro_528/julia_env
```

1a.  Change into directory for snakemake_ex1 and inspect its Snakemake file.
What do you predict will happen when you run Snakemake? 

It will instantiate/build the Julia project once.


1b.  Run snakemake.
```shell
snakemake -c 1
```
How did the files created compare to your prediction?

I think it did the same and also for each mean in {0,1,2} and sigma in {1,2}, it has generated a CSV of 10 draws using draw_vars.jl and for each of those CSVs, it has ran calc_summary.jl to produce a TOML summary file as per as I can understand. 


1c.  Delete one of the toml files.  E.g., `rm summary_mu=0_sigma=1.toml`.  
What do you predict will happen when you rerun Snakemake?  

Maybe that .toml will be missing.


1d.  Run snakemake again.
How did the resulting actions compare to your prediction?

It didn't go as I expected rather it is regenrating the missing file by running calc_summary.jl


1e.  Delete one of the csv files.  E.g., `rm draws_mu=0_sigma=1.csv`.  
What do you predict will happen when you rerun Snakemake?  

Maybe it will get regenerated!!


1f.  Run snakemake again.
How did the resulting actions compare to your prediction?

It is indeed matching the prediction.




2a.  Change into directory for snakemake_ex2 and inspect its Snakemake file.
What do you predict would happen when you run Snakemake?

It will fail maybe!

If you think it would run successfully to completion, then try it and see.  Then explain why it didn't.
Snakemake did not complete because it attempted to run the download rule, but the output directory wasn't created yet.

2b.  We can tell snakemake to run only until it reaches a specified rule or file. 
In this case, we'll first tell snakemake to run until the download rule.  And then we can run it a second time to complete the analysis.
What do you predict would happen when you run Snakemake adding the `--until download` option?

I predict that Snakemake will run only the download rule and stop before any downstream processing.

Run snakemake, but limiting it to stop after the download rule.
```shell
snakemake -c 1 --until download
```
How did the resulting actions compare to your prediction?

Snakemake ran only the download rule as predicted, stopped immediately afterward

2c.  What do you predict will happen if you run Snakemake a second time (without an until option)?

I predict that Snakemake will now recognize that the files (download outputs) already exist, so it will skip the download step


2d.  Run snakemake a second time, this time using 4 cores and letting it run to completion.
```shell
snakemake -c 4
```
How did the resulting actions compare to your prediction?

Snakemake behaved as predicted: it skipped the already-existing download rule and executed only the downstream rules


2e.  Delete one of the toml files E.g., `rm neidL2_20231014T150537.toml`
What do you predict will happen when you rerun Snakemake?  

Snakemake behaved as predicted: it skipped the already-existing download rule and executed only the downstream rules.


2f.  Run snakemake again.
How did the resulting actions compare to your prediction?

It did likewise.


2g.  Delete one of the fits files E.g., `rm neidL2_20231014T150537.fits`
What do you predict will happen when you rerun Snakemake?  

I predict Snakemake will notice that the FITS file is missing and rerun the download rule for that specific file.


2h.  Run snakemake again.
How did the resulting actions compare to your prediction?

Snakemake redownloaded only the missing FITS file, then reran the parsing and summary creation for that one file




3a.  Change into directory for snakemake_ex3 and inspect its Snakemake file.
What do you predict will happen when you run Snakemake twice, first specifying `--until download` and the second time letting it run to completion?

When running Snakemake with --until download, I predict that Snakemake will only run the download rule and stop before any preprocessing or later rules.


3b.  Run snakemake once.
```shell
snakemake -c 1 --until download
```
How did the resulting actions compare to your prediction?

Snakemake behaved exactly as predicted


3c.  What do you predict will happen if you run Snakemake a second time?
 
I predict Snakemake will skip the download rule because the files already exist, and then run all remaining rules in the workflow


3d.  Run snakemake a second time, but this time using a separate slurm job for each step of the pipeline by running
```shell
snakemake --profile=../profile/sla --latency-wait=30
```
How did the resulting actions compare to your prediction?

It did as predicted.


3e.  Change the value of `preprocess_param` in `config.yaml`..  
What do you predict will happen when you rerun Snakemake?  

I predict that Snakemake will rerun the preprocess rule for all affected files and then rerun any downstream steps that depend on those outputs, but it will not rerun the download step


3f.  Run snakemake again.
How did the resulting actions compare to your prediction?

It did as it has been predicted


3g.  (Optional:  Hopefully this will be helpful if you're considering using Snakemake for your project.)  
Edit the Snakemake file so that snakemake will generate a csv file for each fits file (e.g., neidL2_20231014T150537.csv).
Try running snakemake with your new script.  If you get an error, try editting your Snakemake file to fix it (just a few times is fine).   


Regardless of which step you reach before moving on to the final exercise, commit and push your changes to the ex1.md, ex2.md, ex3.md, snakemake_ex3/config.yaml and snakemake_ex3/Snakefile.

