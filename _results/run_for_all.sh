#!/bin/bash

echo Ajustando logs...
python3 fix_logs.py blaise
python3 fix_logs.py hype
python3 fix_logs.py phoenix
python3 fix_logs.py tupi

echo Convertendo para CSV...
python3 to_csv.py blaise
python3 to_csv.py hype
python3 to_csv.py phoenix
python3 to_csv.py tupi