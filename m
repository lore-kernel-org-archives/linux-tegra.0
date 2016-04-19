From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [tegrarcm PATCH] Don't assume cryptopp is system-wide installed
Date: Tue, 19 Apr 2016 15:50:20 -0700
Message-ID: <20160419225020.GA12475@nvidia.com>
References: <1461097517-21626-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <5716B20E.8050607@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <5716B20E.8050607-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Apr 19, 2016 at 04:32:46PM -0600, Stephen Warren wrote:
> On 04/19/2016 02:25 PM, Thomas Petazzoni wrote:
> >The current build system adds "-isystem /usr/include/$(CRYPTOLIB)" to
> >AM_CPPFLAGS, but this is wrong because cryptopp might not be installed
> >in this location. Instead, the build system should simply include
> ><cryptopp/...> or <crypto++/...> and rely on the compiler include
> >path.
> >
> >The tricky part is that it can be <cryptopp/...> or <crypto++/...>. To
> >solve this, we use a solution similar to the one used in
> >https://github.com/bingmann/crypto-speedtest/blob/master/m4/cryptopp.m4
> >and
> >https://github.com/bingmann/crypto-speedtest/blob/master/src/speedtest_cryptopp.cpp:
> >the configure script fills in a variable called
> >CRYPTOLIB_HEADER_PREFIX, and we use that in the C++ code to include
> >the right header file.
> >
> >It is worth mentioning that doing #include
> ><CRYPTOLIB_HEADER_PREFIX/foobar.h> doesn't work, and we have to use an
> >intermediate #define'd constant to overcome this C preprocessor
> >limitation.
> 
> I think this looks conceptually OK. CC += Allen to double-check
> since he wrote the original cryptopp autoconf support.

Won't the same problem with the naming happen when we link as well?
(The "-lcryptopp") ?  Can pkg-config help here?

-Allen
