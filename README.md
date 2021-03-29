# <img src="https://raw.githubusercontent.com/MOMOKO606/Pic-Library/master/SwaveSplit_loading_pic.jpg" alt="logo1" style="zoom:50%;" />Introduction
SwaveSplit 2.0 (Comprehensive analysis system of shear-wave splitting parameters) is a one-stop seismological analysis software, mainly used to compute shear-wave splitting parameters and study regional anisotropy issues. 

The system is compatible with multiple formats of seismic waveform files, supports many kinds of flexible and convenient file operations. 
It provides plentiful preprocessing functions such as Hilbert-Huang adaptive filtering etc. 
It integrates two algorithms for calculating shear-wave splitting parameters, correlated analysis method and maximum eigenvalue method respectively. 
The two algorithms can be mutually tested. Also, the system gives reliability indicators for each calculation. 

Compared to version 1.0, I added the statistical analysis function to collect each calculation results through  data container. 
Researchers can study regional seismological issue more conveniently, and developers can extract seismic data from for more statistical analysis. 
From searching seismic events and downloading waveform data in the early stage, to preprocessing, automatically filtering data, and computing shear-wave splitting parameters in the middle stage, to analyzing reliability and exporting reports in the late stage, all functions are completed in one system.


SwaveSplit 2.0(剪切波分裂参数综合分析系统)是一款一站式数字地震学分析软件,主要用于计算剪切波分裂参数以及研究区域各向异性问题。

系统兼容多种格式的波形文件，支持多种灵活便捷的文件操作；提供希尔伯特-黄自适应滤波等多种预处理数据功能；集合了两种计算剪切波分裂参数算法——相关分析法和最大特征值法，并对每个计算结果给出可靠性指标，且两种算法可以相互检验。

相比1.0版本，我们通过数据容器实现了计算结果的统计分析功能。研究者可以更便捷地研究，开发者可以提取大量地震数据进行更多统计分析。从前期查找地震事件、下载波形数据，到中期对数据进行预处理、自动滤波、计算剪切波分裂参数、可靠性分析，到后期的数据分析、输出报告全部在一个系统内完成。


# Install

- If you don't have MATLAB on your computer, you have 2 options:

  1. Install MATLAB(R2010b) or a higher version of MATLAB first, 

     - then you can download all the source code (including *.m and *.fig etc.) and run "Main_SwaveSplit_2.m"  to start SwaveSplit 2.0.

     - or download and install the "setup.exe", then start SwaveSplit 2.0 (For Windows only).

  2. Install "MCR installer.exe" which is the MATLAB Function Library, then download and install the "setup.exe" to start SwaveSplit 2.0 (For Windows only).

- If you have already installed MATLAB(R2010b) or a higher version of MATLAB on your device, you can either run "Main_SwaveSplit_2.m"  or  install the "setup.exe"to start SwaveSplit 2.0.

  

# User's Manual

Please see the “Swavesplit v2_users_guide.chm” for details.



# List of Shortcut Keys

|        Features        | Shortcut Keys |
| :--------------------: | :-----------: |
|        **File**        |               |
|          Open          |    Ctrl+O     |
|       Close All        |    Ctrl+A     |
|      Save Figures      |    Ctrl+S     |
|       Save Data        |    Ctrl+T     |
|     Print Preview      |    Ctrl+V     |
|         Print          |    Ctrl+P     |
|          Exit          |    Ctrl+X     |
|    **Proprocesses**    |               |
|  Eliminate Zero Drift  |    Ctrl+Z     |
| Eliminate Linear Drift |    Ctrl+L     |
|      **Compute**       |               |
|       Integrate        |    Ctrl+I     |
|       Derivative       |    Ctrl+D     |
|          SNR           |    Ctrl+0     |
|   Epicenter Distance   |    Ctrl+1     |
|        Azimuth         |    Ctrl+2     |
|    Inverse Azimuth     |    Ctrl+3     |
|     Take-Off Angle     |    Ctrl+4     |
|        **Help**        |               |
|      User’s Guide      |    Ctrl+H     |



# Appendix

![logo1](https://raw.githubusercontent.com/MOMOKO606/Pic-Library/master/SwaveSplit_loading_pic.jpg)

![initial pic](https://raw.githubusercontent.com/MOMOKO606/Pic-Library/master/Initial_Pic.bmp)

**Software Copyright**

- **Bian L.** A comprehensive analysis system of shear-wave splitting parameters – SwaveSplit V2.0. Software Copyright

  CN2019SR0624437, 2019.

**Patents**

- **Bian L.** A method for detecting the crustal stress state and its system and related components. Patent Application CN110095814A, 2019-08-06. 
