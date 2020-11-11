/*
 * Copyright (c) 2015, University of Kaiserslautern
 * Copyright (c) 2012-2020, Fraunhofer IESE
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
 *    Janik Schlemminger
 *    Matthias Jung
 *    Luiza Correa
 */

#include "DebugManager.h"

#ifndef NDEBUG

void DebugManager::printDebugMessage(std::string warning, int64_t timestamp, int type, unsigned bank)
{
    if (DebugManager::getInstance().debug) {
        if (writeToConsole){
            std::cout << "WARNING: " << warning << std::endl;
            std::cout << "Command: " << type << ", Timestamp: " << timestamp << ", Bank: " << bank << std::endl;
        }
        if (writeToFile && debugFile)
            debugFile << " Timestamp: " << timestamp << " bank: " << bank << " type: " << type << " \t: " << warning
                      << "\n";
    }
}

void DebugManager::printWarning(std::string warning)
{
    if (DebugManager::getInstance().debug) {
        if (writeToConsole) {
            std::cout << "WARNING: " << warning << std::endl;
        }
        if (writeToFile && debugFile)
            debugFile << " \t: " << warning
                      << "\n";
    }
}


void DebugManager::openDebugFile(std::string filename)
{
    if (debugFile)
        debugFile.close();
    debugFile.open(filename);
}

DebugManager::DebugManager() :
    writeToConsole(false), writeToFile(false), debug(false)
{
}

DebugManager::~DebugManager()
{
    if (writeToFile) {
        debugFile.flush();
        debugFile.close();
    }
}
#endif
