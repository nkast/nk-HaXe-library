/*
TERMS OF USE - EASING EQUATIONS

Open source under the BSD License.

Copyright � 2001 Robert Penner
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
    * Neither the name of the author nor the names of contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


-Ported to haXe by Michel Romecki (filt3r@free.fr)
Changes:
2.0 - ported to ActionScript 2.0; functions now in packages and use strong typing
1.5 - added bounce easing
1.4 - added elastic and back easing
1.3 - tweaked the exponential easing functions to make endpoints exact
1.2 - inline optimizations (changing t and multiplying in one step)--thanks to Tatsuo Kato for the idea
*/

package feffects.easing;

class Bounce implements haxe.Public
{
	inline static function easeOut ( t : Float, b : Float, c : Float, d : Float ) : Float
	{
		if ( ( t /= d ) < ( 1 / 2.75 ) )
			return c * ( 7.5625 * t * t ) + b;
		else if ( t < ( 2 / 2.75 ) )
			return c * ( 7.5625 * ( t -= ( 1.5 / 2.75 ) ) * t + .75 ) + b;
		else if ( t < ( 2.5 / 2.75 ) )
			return c * ( 7.5625 * ( t -= ( 2.25 / 2.75 ) ) * t + .9375 ) + b;
		else
			return c * ( 7.5625 * ( t -= ( 2.625 / 2.75 ) ) * t + .984375 ) + b;
	}
	
	inline static function easeIn ( t : Float, b : Float, c : Float, d : Float ) : Float
	{
		return c - easeOut ( d - t, 0, c, d ) + b;
	}
	
	inline static function easeInOut ( t : Float, b : Float, c : Float, d : Float ) : Float
	{
		if ( t < d / 2 )
			return easeIn ( t * 2, 0, c, d ) * .5 + b;
		else
			return easeOut ( t * 2 - d, 0, c, d ) * .5 + c *.5 + b;
	}
}
