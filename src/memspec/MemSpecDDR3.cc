/*
 * Copyright (c) 2019, University of Kaiserslautern
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are
 * met:
 *
 * 1. Redistributions of source code must retain the above copyright notice,
 *    this list of conditions and the following disclaimer.
 *
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * 3. Neither the name of the copyright holder nor the names of its
 *    contributors may be used to endorse or promote products derived from
 *    this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
 * "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED
 * TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER
 * OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
 * PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
 * LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
 * NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 *
 * Authors:
 *    Lukas Steiner
 *    Luiza Correa
 */

#include "MemSpecDDR3.h"

using json = nlohmann::json;

MemSpecDDR3::MemSpecDDR3(json &memspec)
    : MemSpec(memspec)
{
      memTimingSpec.fCKMHz   = (parseUdouble(memspec["memtimingspec"]["clkMhz"], "clkMhz"));
      memTimingSpec.tCK      = (1000.0 / memTimingSpec.fCKMHz); //clock period in mili seconds
      memTimingSpec.tCKESR   = (parseUint(memspec["memtimingspec"]["CKESR"], "CKESR"));
      memTimingSpec.tCKE     = (parseUint(memspec["memtimingspec"]["CKE"], "CKE"));
      memTimingSpec.tDQSCK   = (parseUint(memspec["memtimingspec"]["DQSCK"], "DQSCK"));
      memTimingSpec.tRAS     = (parseUint(memspec["memtimingspec"]["RAS"], "RAS"));
      memTimingSpec.tRC      = (parseUint(memspec["memtimingspec"]["RC"], "RC"));
      memTimingSpec.tRCD     = (parseUint(memspec["memtimingspec"]["RCD"], "RCD"));
      memTimingSpec.tRL      = (parseUint(memspec["memtimingspec"]["RL"], "RL"));
      memTimingSpec.tRTP     = (parseUint(memspec["memtimingspec"]["RTP"], "RTP"));
      memTimingSpec.tWL      = (parseUint(memspec["memtimingspec"]["WL"], "WL"));
      memTimingSpec.tWR      = (parseUint(memspec["memtimingspec"]["WR"], "WR"));
      memTimingSpec.tXP      = (parseUint(memspec["memtimingspec"]["XP"], "XP"));
      memTimingSpec.tXS      = (parseUint(memspec["memtimingspec"]["XS"], "XS"));
      memTimingSpec.tCCD     = (parseUint(memspec["memtimingspec"]["CCD"], "CCD"));
      memTimingSpec.tFAW     = (parseUint(memspec["memtimingspec"]["FAW"], "FAW"));
      memTimingSpec.tREFI    = (parseUint(memspec["memtimingspec"]["REFI"], "REFI"));
      memTimingSpec.tRFC     = (parseUint(memspec["memtimingspec"]["RFC"], "RFC"));
      memTimingSpec.tRP      = (parseUint(memspec["memtimingspec"]["RP"], "RP"));
      memTimingSpec.tRRD     = (parseUint(memspec["memtimingspec"]["RRD"], "RRD"));
      memTimingSpec.tWTR     = (parseUint(memspec["memtimingspec"]["WTR"], "WTR"));
      memTimingSpec.tAL      = (parseUint(memspec["memtimingspec"]["AL"], "AL"));
      memTimingSpec.tXPDLL   = (parseUint(memspec["memtimingspec"]["XPDLL"], "XPDLL"));
      memTimingSpec.tXSDLL   = (parseUint(memspec["memtimingspec"]["XSDLL"], "XSDLL"));
      memTimingSpec.tACTPDEN = (parseUint(memspec["memtimingspec"]["ACTPDEN"], "ACTPDEN"));
      memTimingSpec.tPRPDEN  = (parseUint(memspec["memtimingspec"]["PRPDEN"], "PRPDEN"));
      memTimingSpec.tREFPDEN = (parseUint(memspec["memtimingspec"]["REFPDEN"], "REFPDEN"));
      memTimingSpec.tRTRS    = (parseUint(memspec["memtimingspec"]["RTRS"], "RTRS"));

      prechargeOffsetRD      =  memTimingSpec.tAL + std::max(memTimingSpec.tRTP, int64_t(4));
      prechargeOffsetWR      =  ((memArchSpec.burstLength)/(memArchSpec.dataRate)) + memTimingSpec.tWL + memTimingSpec.tWR;

      //Push back new subject created with default constructor.
      memPowerSpec.push_back(MemPowerSpec());

      memPowerSpec[0].iDD0      = (parseUdouble(memspec["mempowerspec"]["idd0"], "idd0"));
      memPowerSpec[0].iDD2N     = (parseUdouble(memspec["mempowerspec"]["idd2n"], "idd2n"));
      memPowerSpec[0].iDD3N     = (parseUdouble(memspec["mempowerspec"]["idd3n"], "idd3n"));
      memPowerSpec[0].iDD4R     = (parseUdouble(memspec["mempowerspec"]["idd4r"], "idd4r"));
      memPowerSpec[0].iDD4W     = (parseUdouble(memspec["mempowerspec"]["idd4w"], "idd4w"));
      memPowerSpec[0].iDD5      = (parseUdouble(memspec["mempowerspec"]["idd5"], "idd5"));
      memPowerSpec[0].iDD6      = (parseUdouble(memspec["mempowerspec"]["idd6"], "idd6"));
      memPowerSpec[0].vDD       = (parseUdouble(memspec["mempowerspec"]["vdd"], "vdd"));
      memPowerSpec[0].iDD2P0    = (parseUdouble(memspec["mempowerspec"]["idd2p0"], "idd2p0"));
      memPowerSpec[0].iDD2P1    = (parseUdouble(memspec["mempowerspec"]["idd2p1"], "idd2p1"));
      memPowerSpec[0].iDD3P0    = (parseUdouble(memspec["mempowerspec"]["idd3p0"], "idd3p0"));
      memPowerSpec[0].iDD3P1    = (parseUdouble(memspec["mempowerspec"]["idd3p1"], "idd3p1"));

      //optional parameters
      memPowerSpec[0].capacitance = (parseUdoubleWithDefault(memspec["mempowerspec"]["capacitance"], "capacitance"));
      memPowerSpec[0].ioPower = (parseUdoubleWithDefault(memspec["mempowerspec"]["ioPower"], "ioPower"));
      memPowerSpec[0].wrOdtPower = (parseUdoubleWithDefault(memspec["mempowerspec"]["wrOdtPower"], "wrOdtPower"));
      memPowerSpec[0].termRdPower = (parseUdoubleWithDefault(memspec["mempowerspec"]["termRdPower"], "termRdPower"));
      memPowerSpec[0].termWrPower = (parseUdoubleWithDefault(memspec["mempowerspec"]["termWrPower"], "termWrPower"));

//      json bankWise = memspec["bankwisespec"];
//      if (!bankWise.empty()){

//          unsigned nbrofBanks = memArchSpec.numberOfBanks; // TODO: check if it should be banks per rank

//          bwParams.bwPowerFactRho = parseUint(memspec["bankwisespec"]["factRho"],"factRho");
//          bwParams.bwPowerFactSigma = parseUint(memspec["bankwisespec"]["factSigma"],"factSigma");
//          bwParams.bwMode = parseBool(memspec["bankwisespec"]["opMode"],"opMode");
//          bwParams.flgPASR = parseBool(memspec["bankwisespec"]["hasPASR"],"hasPASR");
//          if (bwParams.flgPASR){

//              bwParams.pasrMode = parseBool(memspec["bankwisespec"]["pasrMode"],"pasrMode");
//              ///////////////////////////////////////////////////////////
//              // Activate banks for self refresh based on the PASR mode
//              // ACTIVE     - X
//              // NOT ACTIVE - 0
//              ///////////////////////////////////////////////////////////
//              switch(bwParams.pasrMode){

//              case(BankWiseParams::pasrModes::PASR_0):{
//                  // PASR MODE 0
//                  // FULL ARRAY
//                  // |X X X X |
//                  // |X X X X |
//                  bwParams.activeBanks.resize(nbrofBanks);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 0);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_1):{
//                  // PASR MODE 1
//                  // (1/2) ARRAY
//                  // |X X X X |
//                  // |0 0 0 0 |
//                  bwParams.activeBanks.resize(nbrofBanks - 4);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 0);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_2):{
//                  // PASR MODE 2
//                  // (1/4) ARRAY
//                  // |X X 0 0 |
//                  // |0 0 0 0 |
//                  bwParams.activeBanks.resize(nbrofBanks - 6);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 0);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_3):{
//                  // PASR MODE 3
//                  // (1/8) ARRAY
//                  // |X 0 0 0 |
//                  // |0 0 0 0 |
//                  bwParams.activeBanks.resize(nbrofBanks - 7);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 0);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_4):{
//                  // PASR MODE 4
//                  // (3/4) ARRAY
//                  // |0 0 X X |
//                  // |X X X X |
//                  bwParams.activeBanks.resize(nbrofBanks - 2);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 2);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_5):{
//                  // PASR MODE 5
//                  // (1/2) ARRAY
//                  // |0 0 0 0 |
//                  // |X X X X |
//                  bwParams.activeBanks.resize(nbrofBanks - 4);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 4);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_6):{
//                  // PASR MODE 6
//                  // (1/4) ARRAY
//                  // |0 0 0 0 |
//                  // |0 0 X X |
//                  bwParams.activeBanks.resize(nbrofBanks - 6);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 6);
//                  break;
//              }
//              case(BankWiseParams::pasrModes::PASR_7):{
//                  // PASR MODE 7
//                  // (1/8) ARRAY
//                  // |0 0 0 0 |
//                  // |0 0 0 X |
//                  bwParams.activeBanks.resize(nbrofBanks - 7);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 7);
//                  break;
//              }
//              default:{
//                  // PASR MODE 0
//                  // FULL ARRAY
//                  // |X X X X |
//                  // |X X X X |
//                  bwParams.activeBanks.resize(nbrofBanks);
//                  std::iota(bwParams.activeBanks.begin(), bwParams.activeBanks.end(), 0);
//                  break;
//              }
//            } //end switch
//          } // end IF flgPASR
//      } // end if !bankwise.empty()
//      else{
         bwParams.bwPowerFactRho = 100;
         bwParams.bwPowerFactSigma = 100;
         bwParams.bwMode = false;
         bwParams.flgPASR = false;
     // }
}

bool MemSpecDDR3::BankWiseParams::isBankActiveInPasr(const unsigned bankIdx) const
{
  return (std::find(activeBanks.begin(), activeBanks.end(), bankIdx)
      != activeBanks.end());
}

int64_t MemSpecDDR3::timeToCompletion(DRAMPower::MemCommand::cmds type)
{
  int64_t offset = 0;

  if (type == DRAMPower::MemCommand::RD) {
    offset = memTimingSpec.tRL +
                              memTimingSpec.tDQSCK + 1 + (memArchSpec.burstLength /
                                                         memArchSpec.dataRate);
  } else if (type == DRAMPower::MemCommand::WR) {
    offset = memTimingSpec.tWL +
                              (memArchSpec.burstLength / memArchSpec.dataRate) +
                              memTimingSpec.tWR;
  } else if (type == DRAMPower::MemCommand::ACT) {
    offset = memTimingSpec.tRCD;
  } else if ((type == DRAMPower::MemCommand::PRE) || (type == DRAMPower::MemCommand::PREA)) {
    offset = memTimingSpec.tRP;
  }
  return offset;
} // MemSpecDDR3::timeToCompletion


int64_t MemSpecDDR3::getRAS(){
    return memTimingSpec.tRAS;
}

int64_t MemSpecDDR3::getRP(){
    return memTimingSpec.tRP;
}
int64_t MemSpecDDR3::getRCD(){
    return memTimingSpec.tRCD;
}
int64_t MemSpecDDR3::getRFC(){
    return memTimingSpec.tRFC;
}
int64_t MemSpecDDR3::getXP(){
    return memTimingSpec.tXP;
}
int64_t MemSpecDDR3::getXPDLL(){
    return memTimingSpec.tXPDLL;
}
int64_t MemSpecDDR3::getCKESR(){
    return memTimingSpec.tCKESR;
}
int64_t MemSpecDDR3::getExitSREFtime(){
    return memTimingSpec.tXSDLL - memTimingSpec.tRCD;
}
