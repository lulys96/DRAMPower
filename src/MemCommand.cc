/*
 * Copyright (c) 2012-2014, TU Delft
 * Copyright (c) 2012-2014, TU Eindhoven
 * Copyright (c) 2012-2014, TU Kaiserslautern
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
 * Authors: Karthik Chandrasekar
 */

#include "MemCommand.h"

#include <algorithm>  // for max


using namespace DRAMPower;
using namespace std;


MemCommand::MemCommand(MemCommand::cmds type,
                       unsigned bank, int64_t timestamp, unsigned rank) :
    type(type),
    bank(bank),
    timestamp(timestamp),
    rank(rank)
{
}

void MemCommand::setType(MemCommand::cmds _type)
{
    type = _type;
}

MemCommand::cmds MemCommand::getType() const
{
    return type;
}

void MemCommand::setBank(unsigned _bank)
{
    bank = _bank;
}

unsigned MemCommand::getBank() const
{
    return bank;
}

void MemCommand::setTime(int64_t _timestamp)
{
    timestamp = _timestamp;
}

int64_t MemCommand::getTimeInt64() const
{
    return timestamp;
}

void MemCommand::setRank(unsigned _rank)
{
    rank = _rank;
}

unsigned MemCommand::getRank() const
{
    return rank;
}

MemCommand::cmds MemCommand::typeWithoutAutoPrechargeFlag() const
{
    if (type == MemCommand::RDA) {
        return MemCommand::RD;
    } else if (type == MemCommand::WRA) {
        return MemCommand::WR;
    }
    return type;
}
