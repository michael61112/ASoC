/**************************************************************************
 *                                                                        *
 *  Edge Detect Design Walkthrough for HLS                                *
 *                                                                        *
 *  Software Version: 1.0                                                 *
 *                                                                        *
 *  Release Date    : Tue Jan 14 15:40:43 PST 2020                        *
 *  Release Type    : Production Release                                  *
 *  Release Build   : 1.0.0                                               *
 *                                                                        *
 *  Copyright 2020, Siemens                                               *
 *                                                                        *
 **************************************************************************
 *  Licensed under the Apache License, Version 2.0 (the "License");       *
 *  you may not use this file except in compliance with the License.      *
 *  You may obtain a copy of the License at                               *
 *                                                                        *
 *      http://www.apache.org/licenses/LICENSE-2.0                        *
 *                                                                        *
 *  Unless required by applicable law or agreed to in writing, software   *
 *  distributed under the License is distributed on an "AS IS" BASIS,     *
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or       *
 *  implied.                                                              *
 *  See the License for the specific language governing permissions and   *
 *  limitations under the License.                                        *
 **************************************************************************
 *                                                                        *
 *  The most recent version of this package is available at github.       *
 *                                                                        *
 *************************************************************************/
#pragma once

#include "EdgeDetect_defs.h"
#include <mc_scverify.h>


namespace EdgeDetect_IP 
{
  class EdgeDetect_MagAng
  {
  public:
    EdgeDetect_MagAng() {}
  
    #pragma hls_design interface
    void CCS_BLOCK(run)(ac_channel<gradType> &dx_in,
                        ac_channel<gradType> &dy_in,
                        maxWType             &widthIn,
                        maxHType             &heightIn,
                        ac_channel<magType>  &magn,
                        ac_channel<angType>  &angle)
    {
      gradType dx, dy;
      sqType dx_sq;
      sqType dy_sq;
      sumType sum; // fixed point integer for sqrt
      angType at;
      ac_fixed<16,9,false> sq_rt; // square-root return type
  
      MROW: for (maxHType y = 0; ; y++) {
        #pragma hls_pipeline_init_interval 1
        MCOL: for (maxWType x = 0; ; x++) {
          dx = dx_in.read();
          dy = dy_in.read();
          dx_sq = dx * dx;
          dy_sq = dy * dy;
          sum = dx_sq + dy_sq;
          // Catapult's math library piecewise linear implementation of sqrt and atan2
          ac_math::ac_sqrt_pwl(sum,sq_rt);
          magn.write(sq_rt.to_uint());
          ac_math::ac_atan2_cordic((ac_fixed<9,9>)dy, (ac_fixed<9,9>) dx, at);
          angle.write(at);
          // programmable width exit condition
          if (x == maxWType(widthIn-1)) { // cast to maxWType for RTL code coverage
            break;
          }
        }
        // programmable height exit condition
        if (y == maxHType(heightIn-1)) { // cast to maxHType for RTL code coverage
          break;
        }
      }
    }
  
  };

}


