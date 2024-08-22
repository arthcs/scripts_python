from carbontracker.tracker import CarbonTracker
import os
import sys

max_epochs = 1
num_application = 0
threads_num = sys.argv[1] #parâmetro do bash
log_dir = './out/'

tracker = CarbonTracker(
        epochs=1,
        decimal_precision=4,
        verbose=1,
        log_dir=str(log_dir),
        log_file_prefix='fft_'+str(threads_num)+'T',
        ignore_errors=True
)

# Training loop.
for epoch in range(max_epochs):
    tracker.epoch_start()

    os.system('OMP_NUM_THREADS='+str(threads_num)+' ./fft_omp')

    tracker.epoch_end()

# Optional: Add a stop in case of early termination before all monitor_epochs has
# been monitored to ensure that actual consumption is reported.

tracker.stop()