from carbontracker.tracker import CarbonTracker
import os
import sys

max_epochs = 1
num_application = 0
threads_num = sys.argv[1] #parâmetro do bash
benchmark = sys.argv[2]
version = sys.argv[3]
data_set = sys.argv[4]
log_dir = './out/'+str(benchmark)+'/'

tracker = CarbonTracker(
        epochs=1,
        decimal_precision=4,
        verbose=1,
        log_dir=str(log_dir),
        log_file_prefix='parboil_'+str(benchmark)+'_'+str(threads_num)+'T',
        ignore_errors=True
)

# Training loop.
for epoch in range(max_epochs):
    
    #print("\n Start Clean")
    #os.system('python2 parboil clean '+str(benchmark))
    #print("\n Start Compile")
    #os.system('python2 parboil compile '+str(benchmark)+' '+str(version))

    tracker.epoch_start()
    os.system('OMP_NUM_THREADS='+str(threads_num)+' python2 parboil run '+str(benchmark)+' '+str(version)+' '+str(data_set))
    tracker.epoch_end()

# Optional: Add a stop in case of early termination before all monitor_epochs has
# been monitored to ensure that actual consumption is reported.

tracker.stop()