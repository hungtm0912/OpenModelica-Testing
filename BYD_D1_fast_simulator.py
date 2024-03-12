
from time import time
t1 = time()
import sys
import json
import os

val_str_length = 20
json_filename = sys.argv[1]
# BMS_ref_filename = sys.argv[3]


with open(json_filename,'r') as f:
    json_data = json.load(f)

override_var_str = '-override=driving_cycle_fname=' + '\"' + cycle_filename + \
    '\",' + 'ref_filename="' + BMS_ref_filename + '"' + ',' + 'startTime=' + \
    str(json_data['experiment'][0]) + ',' + 'stopTime=' + str(json_data['experiment'][1]) + \
    ',' + 'stepSize=' + str(json_data['experiment'][2]) + ',' + 'tolerance=' + \
    str(json_data['experiment'][3])

for i in range(len(json_data['override_vars'])):
    override_var_str = override_var_str + ',' + list(json_data['override_vars'].keys())[i] + '=' + str(list(json_data['override_vars'].values())[i])

for i in range(len(json_data['delta_vars'])):
    override_var_str = override_var_str + ',' + json_data['delta_vars'][i] + '=' + str(json_data['deltas'][i])
    
output_var_str = '-output='

for i in range(len(json_data['output_vars'])):
    output_var_str = output_var_str + ',' + json_data['output_vars'][i]


executable_str = 'BYD_D1_v2B.exe -noemit'

os.environ['PATH'] += R";C:/Prueba/Integracion5/ZEEmulation/ompython/res;C:/Prueba/Integracion5/ZEEmulation/ompython/res/../../usr/bin/;C:/OpenModelica/OpenModelica1.20.0-64bit/bin;C:/OpenModelica/OpenModelica1.20.0-64bit/lib/omc/msvc;C:/OpenModelica/OpenModelica1.20.0-64bit/lib/omc/cpp;C:/OpenModelica/OpenModelica1.20.0-64bit/lib/omc/cpp/msvc;"

# IMPORTANTE!!!! TERMINAR EL LLAMADO A LA FUNCIÓN!!!

# def execute_model(x,override_var_str,json_data,cost_var_str,executable_str):
#     override_var_str_aux = ''
#     for i in range(len(json_data['optim_vars'])):
#         override_var_str_aux = override_var_str_aux + ','+ json_data['optim_vars'][i] + '=' + str(x[i])
      
#     final_str = executable_str + ' ' + cost_var_str + ' ' + override_var_str + override_var_str_aux + ' -lv=-stdout,-LOG_SUCCESS'
#     # print(final_str)
#     stream = os.popen(final_str)
#     output = stream.read()
#     stream.close()
#     del stream
#     index_var = output.find(json_data['cost_var'])
#     index_val_ini = index_var + len(json_data['cost_var']) + 1
#     index_val_end = index_val_ini + val_str_length
#     value = float(output[index_val_ini:index_val_end])
#     return value
#     print(output)

# t1=time()
# test_value = execute_model([600, 30, 0.8, 0.8],override_var_str,json_data,output_var_str,executable_str)
# t2=time()-t1



        