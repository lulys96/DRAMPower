# DRAM Power Model (DRAMPower)
[![Build Status](https://travis-ci.org/ravenrd/DRAMPower.svg?branch=master)](https://travis-ci.org/ravenrd/DRAMPower)
[![Coverage Status](https://coveralls.io/repos/ravenrd/DRAMPower/badge.png?branch=master)](https://coveralls.io/r/ravenrd/DRAMPower?branch=master)
## 0. Releases

The last official release can be found here:
https://github.com/ravenrd/DRAMPower/releases/tag/4.0

The master branch of the repository should be regarded as the bleeding-edge version, which has all the latest features, but also all the latest bugs. Use at your own discretion.

## 1. Installation

Clone the repository, or download the zip file of the release you would like to use. The source code is available in src folder. [drampower.cc](src/cli/drampower.cc) file gives the user interface, where the user can specify the memory to be employed and the commandtrace to be analyzed. To build, use:
```bash
cmake .
make -j4
```
This command will download a set of trace files from https://github.com/Sv3n/DRAMPowerTraces which can be used as test input for the tool.

## 2. Required Packages

The tool was verified on Ubuntu >= 14.04. For building a gcc or clang is required which supports C++11.

## 3. Directory Structure
 * src/: contains the source code of the DRAMPower tool that covers the power  model, the command scheduler and the trace analysis tool.
 * memspecs/   : contains the memory specification JSONs, which give the architectural, timing and current/voltage details for different DRAM memories.
 * traces/     : 1 sample command trace (after the installation / compilation)
 * test/       : contains test script and reference output

## 4. Trace Specification
### Command Traces
If the command-level interface is being used, a command trace can be logged in a file.
An example is given in ```traces/commands.trace```

The format it uses is: ```<timestamp>,<command>,<rank>, <bank>```.
For example, "500,ACT,0,2", where ACT is the command, 0 is the rank and 2 is the bank. Timestamp is in clock cycles (cc), the list of supported commands is
mentioned in [MemCommand.h](src/MemCommand.h) and the bank is the target bank number. For non-bank-specific commands, bank can be set to 0. For non-rank specific rank can be set to 0. The timing correctness of the trace is not verified by the tool and is assumed to be accurate. However, warning messages are provided when enabled, to identify if the memory or bank state is inconsistent in the trace. A sample command traces are provided in the traces/ folder.

### Transaction Traces
This feature is obsolete and not supported any more. One can check out [commit](https://github.com/tukl-msd/DRAMPower/commit/0e24b8ebfa6144fc543d3acdcc3e6ad845dd98a9) to use this feature with an older version of DRAMPower, until which the feature is included. The usage and other details are documented. The future versions of DRAMPower will rely on simulators like [DRAMSys](https://www.jstage.jst.go.jp/article/ipsjtsldm/8/0/8_63/_article) and [Ramulator](https://github.com/CMU-SAFARI/ramulator) for this purpose.

## 5. Usage

[drampower.cc](src/cli/drampower.cc) is the main interface file, which accepts user inputs to specify memory to be employed and the command trace to be analyzed.

To list out the CLI options supported by DRAMPower, type
```bash
./DRAMPowerCli -h
DRAMPower
Usage: ./DRAMPowerCli [OPTIONS]

Options:
  -h,--help                   Print this help message and exit
  -r,--io_term                IO and Termination
  -v,--version                Display DRAMPower version information
  -f,--debug_file             Debug messages on a debug file
  -d,--debug_console          Display debug messages on console
  -m,--mem_spec TEXT:FILE REQUIRED
                              Memory specification file
  -c,--cmd_trace TEXT:FILE REQUIRED
                              Commands trace file
```
The table below gives a detailed overview of the available CLI options.

| Option short | Option long  | Description                                |Usage    | Type |
| --------------|--------------|:------------------------------------------|:----------|:------|
| ```-r``` | ```--io_term```  | The user can optionally include IO and Termination power estimates (obtained from Micron's DRAM Power Calculator)  | Optional | Flag  |
| ```-f``` |```--debug_file```| Debug messages are provided to identify if the memory command or bank state are inconsistent in the chosen trace or messages regarding the memory specification provided. If this flag is enabled the messages are written in a debug file.   | Optional | Flag  |
| ```-d``` |```--debug_console```| Debug messages are provided to identify if the memory command or bank state are inconsistent in the chosen trace or messages regarding the memory specification provided. If this flag is enabled the messages displayed in the console   | Optional | Flag  |
| ```-m``` | ```--mem_spec``` | The memory specification file (JSON format) for the corresponding memory to be analyzed. The file contains the necessary DRAM specific parameters to start power simulation.| Mandatory | String | 
| ```-c``` |```--cmd_trace``` | The command trace file, which is a special file format for specifying memory controller commands. The syntactic details about command trace is described in Trace Specification/ Command Traces above .|  Mandatory | String |

## 6. Memory Specifications

Various sample memory specifications are given in the JSON files targeting DDR2/DDR3/DDR4,LPDDR/LPDDR2/LPDDR3/LPDDR4,HBM2 and WIDE IO DRAM devices. The memory specifications are based on 1Gb DDR2, 1Gb & 2Gb DDR3, 2Gb LPDDR/LPDDR2 and 4Gb DDR4/LPDDR3 Micron datasheets and the 256Mb Wide IO SDR specifications are based on JEDEC timing specifications and circuit-level IDD measurements by TU Kaiserslautern, inplace of the as yet unavailable vendor datasheets. 4 of the memory specifications target dual-rank DDR3 DIMMs.

It is possible to include bankwise parameters: ρ - ACT Standby bankwise power offset factor, σ - Self-Refresh bankwise power offset factor. If not included both will be by default defined as 100.

For DDR3 and DDR4 it is also possible to enable partial array self refresh and define the PASR mode. Example:

```
	"bankwisespec": {
		"factRho":100,
		"factSigma":100,
		"hasPASR": true,
		"pasrMode": 1
	}
```

For DDR4 it is possible to specify the refresh mode as "1X", "2X" or "4X". If not specified the refresh mode will be by default defined as "1X". Example:
```
"RefreshMode": "1X",
```
Note: The timing specifications in the memory specifcaton file are in clock cycles (cc). The current specifications for Reading and Writing do not include the I/O consumption. They are computed and included seperately based on Micron Power Calculator. The currents associated with different power supply sources (DDR4, WIDE IO) can be included in the memory specification file named the same way as in the respective JEDEC standard. 

Full example of a DDR3 memory specification file:
```
{
    "memspec": {
        "memarchitecturespec": {
            "burstLength": 8,
            "dataRate": 2,
            "nbrOfBanks": 8,
            "nbrOfColumns": 1024,
            "nbrOfRanks": 1,
            "nbrOfRows": 16384,
            "width": 8,
       	    "nbrOfDevicesOnDIMM": 8,
            "nbrOfChannels": 1
        },
        "memoryId": "MICRON_1Gb_DDR3-1066_8bit_G",
        "memoryType": "DDR3",
        "mempowerspec": {
            "idd0": 60.0,
            "idd2n": 35.0,
            "idd2p0": 12.0,
            "idd2p1": 25.0,
            "idd3n": 40.0,
            "idd3p": 30.0,
            "idd4r": 105.0,
            "idd4w": 110.0,
            "idd5": 160.0,
            "idd6": 8.0,
            "vdd": 1.5
        },
        "memtimingspec": {
            "AL": 0,
            "CCD": 4,
            "CKE": 3,
            "CKESR": 4,
            "CL": 7,
            "DQSCK": 0,
            "FAW": 20,
            "RAS": 20,
            "RC": 27,
            "RCD": 7,
            "REFI": 4160,
            "RFC": 59,
            "RL": 7,
            "RP": 7,
            "RRD": 4,
            "RTP": 4,
            "WL": 6,
            "WR": 8,
            "WTR": 4,
            "XP": 4,
            "XPDLL": 13,
            "XS": 64,
            "XSDLL": 512,
            "ACTPDEN": 1,
            "PRPDEN": 1,
            "REFPDEN": 1,
            "RTRS": 1,
            "clkMhz": 533
        },
	
       	"bankwisespec": {
		        "factRho":100,
		        "factSigma":100,
		        "hasPASR": true,
		        "pasrMode": 1
	      }
    }
}

```

## 7. Variation-aware Power And Energy Estimation

15 of the included datasheets reflect the impact of process-variations on DRAM currents for a selection of DDR3 memories manufactured at 50nm process technology. These memories include:
(1) MICRON_128MB_DDR3-1066_8bit - revision G
(2) MICRON_128MB_DDR3-1066_16bit - revision G
(3) MICRON_128MB_DDR3-1600_8bit - revision G
(4) MICRON_256MB_DDR3-1066_8bit - revision D
(5) MICRON_256MB_DDR3-1600_16bit - revision D

The original vendor-provided datasheet current specifications are given in JSONs
without suffixes such as _mu, _2s and _3s. JSONs including suffixes indicate that the
current measures are either: (1) typical (mu), or (2) include +2 sigma variation (2s),
or (3) include +3 sigma variation (3s). These measures are derived based on the
Monte-Carlo analysis performed on our SPICE-based DRAM cross-section.

To include these JSONs in your simulations, simply use them as the target memory.

## 8. Example Usage

An example of using this tool is provided below. Clone the repository and make.

Once the build is successful, run with the command trace for combined bank simulation:
```
./DRAMPowerCli -m memspecs/MICRON_1Gb_DDR3-1066_8bit_G.json -c traces/commands.trace -r
```
The output should be something like this:

```
■ ■ ■  DRAMPower, Copyright (c) 2020
■ ■ ■  TU Eindhoven, TU Delft, TU Kaiserslautern
■ ■ ■  Fraunhofer IESE

* Analysis start time: Wed Nov 11 11:01:23 2020
* Analyzing the input trace
* Bankwise mode: 3040
* Bankwise Details:
## @ Bank 0
  #ACT commands: 268
  #RD + #RDA commands: 268
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 268
## @ Bank 1
  #ACT commands: 205
  #RD + #RDA commands: 205
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 205
## @ Bank 2
  #ACT commands: 170
  #RD + #RDA commands: 170
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 170
## @ Bank 3
  #ACT commands: 181
  #RD + #RDA commands: 181
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 181
## @ Bank 4
  #ACT commands: 208
  #RD + #RDA commands: 205
  #WR + #WRA commands: 3
  #PRE (+ PREA) commands: 208
## @ Bank 5
  #ACT commands: 215
  #RD + #RDA commands: 215
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 215
## @ Bank 6
  #ACT commands: 106
  #RD + #RDA commands: 106
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 106
## @ Bank 7
  #ACT commands: 149
  #RD + #RDA commands: 149
  #WR + #WRA commands: 0
  #PRE (+ PREA) commands: 149

## @ Bank 0
  ACT Cmd Energy: 301689 pJ
  PRE Cmd Energy: 105591 pJ
  RD Cmd Energy: 196098 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 2169352 pJ

## @ Bank 1
  ACT Cmd Energy: 230769 pJ
  PRE Cmd Energy: 80769 pJ
  RD Cmd Energy: 150000 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 2027513 pJ

## @ Bank 2
  ACT Cmd Energy: 191370 pJ
  PRE Cmd Energy: 66979 pJ
  RD Cmd Energy: 124390 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 1948714 pJ

## @ Bank 3
  ACT Cmd Energy: 203752 pJ
  PRE Cmd Energy: 71313 pJ
  RD Cmd Energy: 132439 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 1973480 pJ

## @ Bank 4
  ACT Cmd Energy: 234146 pJ
  PRE Cmd Energy: 81951 pJ
  RD Cmd Energy: 150000 pJ
  WR Cmd Energy: 2364 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 2034437 pJ

## @ Bank 5
  ACT Cmd Energy: 242026 pJ
  PRE Cmd Energy: 84709 pJ
  RD Cmd Energy: 157317 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 2050028 pJ

## @ Bank 6
  ACT Cmd Energy: 119325 pJ
  PRE Cmd Energy: 41764 pJ
  RD Cmd Energy: 77561 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 1804624 pJ

## @ Bank 7
  ACT Cmd Energy: 167730 pJ
  PRE Cmd Energy: 58705 pJ
  RD Cmd Energy: 109024 pJ
  WR Cmd Energy: 0 pJ
  Auto-Refresh Energy: 89662 pJ
  ACT Stdby Energy: 435633 pJ
  PRE Stdby Energy: 1040680 pJ
  Active Idle Energy: 176299 pJ
  Precharge Idle Energy: 929967 pJ
  Fast-Exit Active Power-Down Energy: 0 pJ
  Fast-Exit Precharged Power-Down Energy: 0 pJ
  Slow-Exit Precharged Power-Down Energy: 0 pJ
  Self-Refresh Energy: 0 pJ
  Slow-Exit Active Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Slow-Exit Precharged Power-Down Energy during Auto-Refresh cycles in Self-Refresh: 0 pJ
  Self-Refresh Power-Up Energy: 0 pJ
  Active Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Precharge Stdby Energy during Auto-Refresh cycles in Self-Refresh Power-Up: 0 pJ
  Active Power-Up Energy: 0 pJ
  Precharged Power-Up Energy: 0 pJ
  Total Energy of Bank: 1901435 pJ


----------------------------------------
  Total Trace Energy : 15909583 pJ
  Total Average Power : 73 mW
----------------------------------------

RD I/O Energy: 0 pJ
WR Termination Energy: 0 pJ
* Power Computation End time: Wed Nov 11 11:01:23 2020
* Total Simulation time: 0.039071 seconds

----------------------------------------
  Total Trace Energy : 15909583 pJ
  Total Average Power : 73 mW
  Cycles: 115482
----------------------------------------

RD I/O Energy: 0 pJ
WR Termination Energy: 0 pJ
* Power Computation End time: Wed Nov 11 11:01:23 2020
* Total Simulation time: 0.039071 seconds


```

As can be noticed, the tool performs DRAM command scheduling and reports the number
of activates, precharges, reads, writes, refreshes, power-downs and self-refreshes
besides the number of clock cycles spent in the active and precharged states, in the
power-down (fast/slow-exit) and self-refresh states and in the idle mode. It also
reports the energy consumption of these components, besides the IO and Termination
components in pJ (pico Joules) and the average power consumption of the trace in mW.
It also reports the simulation start/end times and the total simulation time in seconds.

## 9. DRAMPower Library

The DRAMPower tool has an additional feature and can be used as a library.
In order to use the library run "make lib", include [LibDRAMPower.h](src/libdrampower/LibDRAMPower.h) in your project and
link the file src/libdrampower.a with your project.
Examples for the usage of the library are [lib_test.cc](test/libdrampowertest/lib_test.cc) and [window_example.cc](test/libdrampowertest/window_example.cc).

## 10. Authors & Acknowledgment

The tool is based on the DRAM power model developed jointly by the Computer Engineering Research Group at TU Delft and the Electronic Systems Group at TU Eindhoven
and verified by the Microelectronic System Design Research Group at TU Kaiserslautern with equivalent circuit-level simulations. This tool has been developed by
Karthik Chandrasekar with Yonghui Li under the supervision of Dr. Benny Akesson and Prof. Kees Goossens. The IO and Termination Power measures have been employed
from Micron's DRAM Power Calculator. If you decide to use DRAMPower in your research, please cite one of the following references:

**To cite the DRAMPower Tool:**
```
[1] DRAMPower: Open-source DRAM Power & Energy Estimation Tool
Karthik Chandrasekar, Christian Weis, Yonghui Li, Sven Goossens, Matthias Jung, Omar Naji, Benny Akesson, Norbert Wehn, and Kees Goossens
URL: http://www.drampower.info
```

**To cite the DRAM power model:**
```
[2] "Improved Power Modeling of DDR SDRAMs"
Karthik Chandrasekar, Benny Akesson, and Kees Goossens
In Proc. 14th Euromicro Conference on Digital System Design (DSD), 2011
```
**To cite Bank-Wise granular power model:**
```
[3] "A Bank-Wise DRAM Power Model for System Simulations"
Deepak M. Mathew, Éder F. Zulian, Subash Kannoth, Matthias Jung, Christian Weis, Norbert Wehn
RAPIDO ’17, January 23-25, 2017, Stockholm, Sweden
```
**To cite the 3D-DRAM power model:**
```
[4] "System and Circuit Level Power Modeling of Energy-Efficient 3D-Stacked Wide I/O DRAMs"
Karthik Chandrasekar, Christian Weis, Benny Akesson, Norbert Wehn, and Kees Goossens
In Proc. Design, Automation and Test in Europe (DATE), 2013
```

**To cite variation-aware DRAM power estimation:**
```
[5] "Towards Variation-Aware System-Level Power Estimation of DRAMs: An Empirical Approach"
Karthik Chandrasekar, Christian Weis, Benny Akesson, Norbert Wehn, and Kees Goossens
In Proc. Design Automation Conference (DAC), 2013
```
## 11. Contact Information

Further questions about the tool and the power model can be directed to:

Matthias Jung (matthias.jung@iese.fraunhofer.de)

Feel free to ask for updates to the tool's features and please do report any bugs
and errors you encounter. This will encourage us to continuously improve the tool.

## Disclaimer

The tool does not check the timing accuracy of the user's memory command trace
and the use of commands and memory modes. It is expected that the user employs
a valid trace generated using a DRAM memory controller or simulator, which
satisfies all memory timing constraints and other requirements. The user DOES
NOT get ANY WARRANTIES when using this tool. This software is released under the
BSD 3-Clause License. By using this software, the user implicitly agrees to the
licensing terms.
