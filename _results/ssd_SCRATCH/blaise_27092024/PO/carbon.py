from carbontracker.tracker import CarbonTracker
import os
import sys

max_epochs = 1
num_application = 0
#application = ['Castro','Nyx','CCN','CCR','DFT','DJ','FFT','GL','GS','HS','JA','LU','MC','MM','OE','PO']
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

    os.system('OMP_NUM_THREADS='+str(threads_num)+' ./omp_po')

    tracker.epoch_end()

# Optional: Add a stop in case of early termination before all monitor_epochs has
# been monitored to ensure that actual consumption is reported.

tracker.stop()

# scp /home/users/acsilveira/carbontracker/CTlog gppd@gppd-209-8:/home/gppd/Desktop/Arthur/carbon>
# scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/carbontracker/CTlog /home/gppd/D>
# scp -r acsilveira@gppd-hpc.inf.ufrgs.br:/home/users/acsilveira/carbontracker/CTlog /home/users/>
