From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [cbootimage PATCH v1 3/8] Add in libmcrypto
Date: Mon, 21 Sep 2015 14:11:03 -0600
Message-ID: <56006457.4040601@wwwdotorg.org>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-4-git-send-email-jimmzhang@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441228760-26042-4-git-send-email-jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> Libmcrypto is an open source crypto library. It can be found at
> http://code.google.com/p/libmcrypto/

Not for much longer; Google code is shutting down. Is there a new 
upstream location for the code that we can reference? Is the project 
still alive?

Can we not link against a distribution package rather than copying the 
code inside cbootimage, and having to forever maintain it ourselves, 
including watching out for security holes and backporting fixes etc.?

Has an internal IP audit been performed for this use of libmcrypto? The 
Google code page says:

> There is no license associated with this library (although I have to
> select BSD license as code.google.com forced me to) except the
> respective licenses of included hash implementation. Anyway, if you
> use it, it would be nice if you drop me and David Ireland a line to
> say thank.

... and indeed there are no license headers in any of the files except 
one. I'd like our IP audit team to validate that using the code from 
cbootimage is acceptable and that copying the code into cbootimage is 
acceptable.

>  src/libm/base64.c          |  132 +++++
>  src/libm/bigdUtils.c       |  208 +++++++
>  src/libm/bigdigits.h       |  294 ++++++++++
>  src/libm/common.c          |   58 ++

"libm" is not the name of the library, and this directory layout does 
not match the upstream package. Please follow upstream's layout:

libmcrypto/include/bigdigits.h
libmcrypto/src/base64.c

... although I still think it'd be even better to just link against a 
distro package of libmcrypto, or otherwise require it to already exist 
when building cbootimage, if at all possible.
