import os,re
import errno
import random
import urllib.request as urllib
import numpy as np
from scipy.io import loadmat
from sklearn.utils import shuffle

def fliter_key(keys):
    fkeys = []
    for key in keys:
        matchObj = re.match( r'(.*)FE_time', key, re.M|re.I)
        if matchObj:
            fkeys.append(matchObj.group(1))
    if(len(fkeys)>1):
        print(keys)
    return fkeys[0]+'DE_time',fkeys[0]+'FE_time'


exps_idx = {
    '12DriveEndFault':0,
    '12FanEndFault':9,
    '48DriveEndFault':0
}

load_idx = {
    '1797': 0,
    '1772': 1,
    '1750': 2,
    '1730': 3
}

faults_idx = {
    'Normal': 0,
    '0.007-Ball': 1,
    '0.014-Ball': 2,
    '0.021-Ball': 3,
    '0.007-InnerRace': 4,
    '0.014-InnerRace': 5,
    '0.021-InnerRace': 6,
    '0.007-OuterRace6': 7,
    '0.014-OuterRace6': 8,
    '0.021-OuterRace6': 9,
#     '0.007-OuterRace3': 10,
#     '0.014-OuterRace3': 11,
#     '0.021-OuterRace3': 12,
#     '0.007-OuterRace12': 13,
#     '0.014-OuterRace12': 14,
#     '0.021-OuterRace12': 15,
}

T1 = ['Datasets/CWRU/NormalBaseline/1797/Normal.mat','Datasets/CWRU/12DriveEndFault/1797/0.007-Ball.mat','Datasets/CWRU/12DriveEndFault/1797/0.014-Ball.mat','Datasets/CWRU/12DriveEndFault/1797/0.021-Ball.mat','Datasets/CWRU/12DriveEndFault/1797/0.007-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1797/0.014-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1797/0.021-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1797/0.007-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1797/0.014-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1797/0.021-OuterRace6.mat']
T2 = ['Datasets/CWRU/NormalBaseline/1772/Normal.mat','Datasets/CWRU/12DriveEndFault/1772/0.007-Ball.mat','Datasets/CWRU/12DriveEndFault/1772/0.014-Ball.mat','Datasets/CWRU/12DriveEndFault/1772/0.021-Ball.mat','Datasets/CWRU/12DriveEndFault/1772/0.007-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1772/0.014-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1772/0.021-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1772/0.007-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1772/0.014-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1772/0.021-OuterRace6.mat']
T3 = ['Datasets/CWRU/NormalBaseline/1750/Normal.mat','Datasets/CWRU/12DriveEndFault/1750/0.007-Ball.mat','Datasets/CWRU/12DriveEndFault/1750/0.014-Ball.mat','Datasets/CWRU/12DriveEndFault/1750/0.021-Ball.mat','Datasets/CWRU/12DriveEndFault/1750/0.007-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1750/0.014-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1750/0.021-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1750/0.007-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1750/0.014-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1750/0.021-OuterRace6.mat']
T4 = ['Datasets/CWRU/NormalBaseline/1730/Normal.mat','Datasets/CWRU/12DriveEndFault/1730/0.007-Ball.mat','Datasets/CWRU/12DriveEndFault/1730/0.014-Ball.mat','Datasets/CWRU/12DriveEndFault/1730/0.021-Ball.mat','Datasets/CWRU/12DriveEndFault/1730/0.007-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1730/0.014-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1730/0.021-InnerRace.mat','Datasets/CWRU/12DriveEndFault/1730/0.007-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1730/0.014-OuterRace6.mat','Datasets/CWRU/12DriveEndFault/1730/0.021-OuterRace6.mat']
# for visualization
# T5 = [T1[2],T2[2],T3[2],T4[2]]

def get_class(exp,fault):
    if fault == 'Normal':
        return 0
    return exps_idx[exp] + faults_idx[fault]

def get_class_T5(exp, load):
    return exps_idx[exp] + load_idx[load]
 
class CWRU:
    def __init__(self, exps, rpms, length):
        for exp in exps:
            if exp not in ('12DriveEndFault', '12FanEndFault', '48DriveEndFault'):
                print("wrong experiment name: {}".format(exp))
                return
        for rpm in rpms:    
            if rpm not in ('1797', '1772', '1750', '1730'):
                print("wrong rpm value: {}".format(rpm))
                return
        # root directory of all data
        rdir = os.path.join('Datasets/CWRU')
        print(rdir,exp,rpms)
        
        # download address
        fmeta = os.path.join(os.path.dirname('__file__'), 'metadata.txt')
        all_lines = open(fmeta).readlines()
        # all_lines = open(fmeta).readlines()
        lines = []
        for line in all_lines:
            l = line.split()
            if (l[0] in exps or l[0] == 'NormalBaseline') and l[1] in rpms:
                if 'Normal' in l[2] or '0.007' in l[2] or '0.014' in l[2] or '0.021' in l[2]:
                    if faults_idx.get(l[2],-1)!=-1:
                        lines.append(l)
 
        self.length = length  # sequence length
        lines = sorted(lines, key=lambda line: get_class(line[0],line[2])) 
        print(lines)
        self._load_and_slice_data(rdir, lines)
        # shuffle training and test arrays
        self._shuffle()
        self.all_labels = tuple(((line[0]+line[2]),get_class(line[0],line[2])) for line in lines)
        self.classes = sorted(list(set(self.all_labels)), key=lambda label: label[1]) 
        self.nclasses = len(self.classes)  # number of classes
 
    def _mkdir(self, path):
        try:
            os.makedirs(path)
        except OSError as exc:
            if exc.errno == errno.EEXIST and os.path.isdir(path):
                pass
            else:
                print("can't create directory '{}''".format(path))
                exit(1)
 
    def _download(self, fpath, link):
        print(link + " Downloading to: '{}'".format(fpath))
        urllib.urlretrieve(link, fpath)
        
    def _load_and_slice_data(self, rdir, infos):
        self.T1_X_train = np.zeros((0, self.length ,2))
        self.T2_X_train = np.zeros((0, self.length ,2))
        self.T3_X_train = np.zeros((0, self.length ,2))
        self.T4_X_train = np.zeros((0, self.length ,2))
        # self.T5_X_train = np.zeros((0, self.length ,2))
        self.T1_y_train = []
        self.T2_y_train = []
        self.T3_y_train = []
        self.T4_y_train = []
        # self.T5_y_train = []
        cuts = list(range(0,120000,80))[:1400]
        for idx, info in enumerate(infos):
            
            print("info:",info)
 
            # directory of this file
            fdir = os.path.join(rdir, info[0], info[1])
            self._mkdir(fdir)
            fpath = os.path.join(fdir, info[2] + '.mat')
            print(idx,fpath) # eg. 0 Datasets/CWRU/NormalBaseline/1730/Normal.mat
            if not os.path.exists(fpath):# download
                self._download(fpath, info[3].rstrip('\n'))
 
            if fpath in T1:
 
                mat_dict = loadmat(fpath)
                key1,key2 = fliter_key(mat_dict.keys())
                # print(key1,key2) eg. X100_DE_time X100_FE_time the key of two time series
                time_series = np.hstack((mat_dict[key1], mat_dict[key2]))
                idx_last = -(time_series.shape[0] % self.length)
                # print(idx_last)

                print(time_series.shape) # eg. (483903,2)

                clips = np.zeros((0, 2))
                for cut in shuffle(cuts):
                    clips = np.vstack((clips, time_series[cut:cut+self.length]))
                clips = clips.reshape(-1, self.length,2)
                self.T1_X_train = np.vstack((self.T1_X_train, clips))

                self.T1_y_train += [get_class(info[0],info[2])] * 1400
                # self.y_test += [get_class(info[0],info[2])] * 25
            
            if fpath in T2:
 
                mat_dict = loadmat(fpath)
                key1,key2 = fliter_key(mat_dict.keys())
                # print(key1,key2) eg. X100_DE_time X100_FE_time the key of two time series
                time_series = np.hstack((mat_dict[key1], mat_dict[key2]))
                idx_last = -(time_series.shape[0] % self.length)
                # print(idx_last)

                print(time_series.shape) # eg. (483903,2)

                clips = np.zeros((0, 2))
                for cut in shuffle(cuts):
                    clips = np.vstack((clips, time_series[cut:cut+self.length]))
                clips = clips.reshape(-1, self.length,2)
                self.T2_X_train = np.vstack((self.T2_X_train, clips))

                self.T2_y_train += [get_class(info[0],info[2])] * 1400
                # self.y_test += [get_class(info[0],info[2])] * 25
            
            if fpath in T3:
 
                mat_dict = loadmat(fpath)
                key1,key2 = fliter_key(mat_dict.keys())
                # print(key1,key2) eg. X100_DE_time X100_FE_time the key of two time series
                time_series = np.hstack((mat_dict[key1], mat_dict[key2]))
                idx_last = -(time_series.shape[0] % self.length)
                # print(idx_last)

                print(time_series.shape) # eg. (483903,2)

                clips = np.zeros((0, 2))
                for cut in shuffle(cuts):
                    clips = np.vstack((clips, time_series[cut:cut+self.length]))
                clips = clips.reshape(-1, self.length,2)
                self.T3_X_train = np.vstack((self.T3_X_train, clips))

                self.T3_y_train += [get_class(info[0],info[2])] * 1400
                # self.y_test += [get_class(info[0],info[2])] * 25
                    
            if fpath in T4:
 
                mat_dict = loadmat(fpath)
                key1,key2 = fliter_key(mat_dict.keys())
                # print(key1,key2) eg. X100_DE_time X100_FE_time the key of two time series
                time_series = np.hstack((mat_dict[key1], mat_dict[key2]))
                idx_last = -(time_series.shape[0] % self.length)
                # print(idx_last)

                print(time_series.shape) # eg. (483903,2)

                clips = np.zeros((0, 2))
                for cut in shuffle(cuts):
                    clips = np.vstack((clips, time_series[cut:cut+self.length]))
                clips = clips.reshape(-1, self.length,2)
                self.T4_X_train = np.vstack((self.T4_X_train, clips))

                self.T4_y_train += [get_class(info[0],info[2])] * 1400
                # self.y_test += [get_class(info[0],info[2])] * 25
            
#             if fpath in T5:
#                 print("enter T5")
#                 mat_dict = loadmat(fpath)
#                 key1,key2 = fliter_key(mat_dict.keys())
#                 # print(key1,key2) eg. X100_DE_time X100_FE_time the key of two time series
#                 time_series = np.hstack((mat_dict[key1], mat_dict[key2]))
#                 idx_last = -(time_series.shape[0] % self.length)
#                 # print(idx_last)

#                 print(time_series.shape) # eg. (483903,2)

#                 clips = np.zeros((0, 2))
#                 for cut in shuffle(cuts):
#                     clips = np.vstack((clips, time_series[cut:cut+self.length]))
#                 clips = clips.reshape(-1, self.length,2)
#                 self.T5_X_train = np.vstack((self.T5_X_train, clips))

#                 self.T5_y_train += [get_class_T5(info[0], info[1])] * 1400
#                 # self.y_test += [get_class(info[0],info[2])] * 25
            
            self.T1_X_train.reshape(-1, self.length,2)  
            self.T2_X_train.reshape(-1, self.length,2)
            self.T3_X_train.reshape(-1, self.length,2) 
            self.T4_X_train.reshape(-1, self.length,2)  
            # self.T5_X_train.reshape(-1, self.length,2)  
 
    def _shuffle(self):
        # shuffle training samples
        index = list(range(self.T1_X_train.shape[0]))
        random.Random(0).shuffle(index)
        self.T1_X_train = self.T1_X_train[index]
        self.T1_y_train = np.array(tuple(self.T1_y_train[i] for i in index))
        
        index = list(range(self.T2_X_train.shape[0]))
        random.Random(0).shuffle(index)
        self.T2_X_train = self.T2_X_train[index]
        self.T2_y_train = np.array(tuple(self.T2_y_train[i] for i in index))
        
        index = list(range(self.T3_X_train.shape[0]))
        random.Random(0).shuffle(index)
        self.T3_X_train = self.T3_X_train[index]
        self.T3_y_train = np.array(tuple(self.T3_y_train[i] for i in index))
        
        index = list(range(self.T4_X_train.shape[0]))
        random.Random(0).shuffle(index)
        self.T4_X_train = self.T4_X_train[index]
        self.T4_y_train = np.array(tuple(self.T4_y_train[i] for i in index))
        
#         index = list(range(self.T5_X_train.shape[0]))
#         random.Random(0).shuffle(index)
#         self.T5_X_train = self.T5_X_train[index]
#         self.T5_y_train = np.array(tuple(self.T5_y_train[i] for i in index))
 
 