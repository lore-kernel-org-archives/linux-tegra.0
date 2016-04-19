From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [tegrarcm PATCH] Don't assume cryptopp is system-wide installed
Date: Tue, 19 Apr 2016 16:32:46 -0600
Message-ID: <5716B20E.8050607@wwwdotorg.org>
References: <1461097517-21626-1-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1461097517-21626-1-git-send-email-thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04/19/2016 02:25 PM, Thomas Petazzoni wrote:
> The current build system adds "-isystem /usr/include/$(CRYPTOLIB)" to
> AM_CPPFLAGS, but this is wrong because cryptopp might not be installed
> in this location. Instead, the build system should simply include
> <cryptopp/...> or <crypto++/...> and rely on the compiler include
> path.
>
> The tricky part is that it can be <cryptopp/...> or <crypto++/...>. To
> solve this, we use a solution similar to the one used in
> https://github.com/bingmann/crypto-speedtest/blob/master/m4/cryptopp.m4
> and
> https://github.com/bingmann/crypto-speedtest/blob/master/src/speedtest_cryptopp.cpp:
> the configure script fills in a variable called
> CRYPTOLIB_HEADER_PREFIX, and we use that in the C++ code to include
> the right header file.
>
> It is worth mentioning that doing #include
> <CRYPTOLIB_HEADER_PREFIX/foobar.h> doesn't work, and we have to use an
> intermediate #define'd constant to overcome this C preprocessor
> limitation.

I think this looks conceptually OK. CC += Allen to double-check since he 
wrote the original cryptopp autoconf support.

Could you please re-spin this on top of the latest git commits? There's 
a new file rsa-pss.cpp that needs to be updated too. Without that, this 
patch causes compile failures.

> diff --git a/src/aes-cmac.cpp b/src/aes-cmac.cpp

> -#include "cryptlib.h"
> -using CryptoPP::Exception;
> +#define CRYPTOPP_INCLUDE_CRYPTLIB	<CRYPTOLIB_HEADER_PREFIX/cryptlib.h>
> +#define CRYPTOPP_INCLUDE_CMAC		<CRYPTOLIB_HEADER_PREFIX/cmac.h>
> +#define CRYPTOPP_INCLUDE_AES		<CRYPTOLIB_HEADER_PREFIX/aes.h>
> +#define CRYPTOPP_INCLUDE_HEX		<CRYPTOLIB_HEADER_PREFIX/hex.h>
> +#define CRYPTOPP_INCLUDE_FILTERS	<CRYPTOLIB_HEADER_PREFIX/filters.h>
> +#define CRYPTOPP_INCLUDE_SECBLOCK	<CRYPTOLIB_HEADER_PREFIX/secblock.h>
>
> -#include "cmac.h"
> -using CryptoPP::CMAC;
> +#include CRYPTOPP_INCLUDE_CRYPTLIB
> +#include CRYPTOPP_INCLUDE_CMAC
> +#include CRYPTOPP_INCLUDE_AES
> +#include CRYPTOPP_INCLUDE_HEX
> +#include CRYPTOPP_INCLUDE_FILTERS
> +#include CRYPTOPP_INCLUDE_SECBLOCK

It'd be nice to avoid re-ordering everything; just edit the existing 
lines in place. That'd make the diff smaller, and make it more obvious 
that the only thing changing is the include filenames and not the using 
statements.
