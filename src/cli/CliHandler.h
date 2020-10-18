/*
 * Copyright (c) 2012-2014, TU Delft
 * Copyright (c) 2012-2014, TU Eindhoven
 * Copyright (c) 2012-2014, TU Kaiserslautern
 * Copyright (c) 2012-2019, Fraunhofer IESE
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * 1. Redistributions of source code must retain the above copyright
 * notice, this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 * notice, this list of conditions and the following disclaimer in the
 * documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 * contributors may be used to endorse or promote products derived from
 * this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
 * IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
 * PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
 * HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
 * SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
 * TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Authors: Subash Kannoth
 *          Luiza Correa
 *
 */
#include <iostream>
#include <fstream>
#include <vector>
#include "./memspec/MemSpec.h"
#include "./memspec/MemSpecDDR3.h"
#include "./dramtypes/DRAMPowerIF.h"
#include "./dramtypes/DRAMPowerDDR3.h"
#include "./dramtypes/DRAMPowerDDR4.h"
#include "TraceParser.h"
#include "common/version.h"
#include "common/libraries/cli11/CLI11.h"


namespace DRAMPower{

constexpr const char* IO_TERM("--io_term,-r");
constexpr const char* DEBUG_FILE("--debug_file,-f");
constexpr const char* DEBUG_CONSOLE("--debug_console,-d");
constexpr const char* VERS("--version,-v");
constexpr const char* MEM_SPEC("--mem_spec,-m");
constexpr const char* CMD_TRACE("--cmd_trace,-c");

class CliHandler{
public:
  CliHandler(int _argc, char** _argv);
  ~CliHandler();

  bool get_io_term_active() const;
  bool get_writeToConsole() const;
  bool get_writeToFile() const;
  const std::string& get_mem_spec_path() const;
  const std::string& get_cmd_trace_path() const;
  void loadMemSpec(const std::string &memspecUri);
  void logo();
  void parse_arguments();
  void run_simulation();

private:
  CliHandler(){};
  CLI::App* app;
  int argc;
  char** argv;
  bool io_term_active;
  std::string mem_spec_path;
  std::string cmd_trace_path;
  bool debug_file_active;
  bool debug_console_active;


  TraceParser traceparser;

  DRAMPowerIF *dramPower;

  std::vector<DRAMPower::MemCommand> cmd_list;
};

}

