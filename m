From: Jimmy Zhang <jimmzhang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [cbootimage PATCH v1 3/8] Add in libmcrypto
Date: Tue, 22 Sep 2015 00:05:26 +0000
Message-ID: <eee2db9d5b064169962fb51a30fd1ba1@HQMAIL103.nvidia.com>
References: <1441228760-26042-1-git-send-email-jimmzhang@nvidia.com>
 <1441228760-26042-4-git-send-email-jimmzhang@nvidia.com>
 <56006457.4040601@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56006457.4040601-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: 'Stephen Warren' <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org



> -----Original Message-----
> From: Stephen Warren [mailto:swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org]
> Sent: Monday, September 21, 2015 1:11 PM
> To: Jimmy Zhang
> Cc: Allen Martin; Stephen Warren; linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Subject: Re: [cbootimage PATCH v1 3/8] Add in libmcrypto
> 
> On 09/02/2015 03:19 PM, Jimmy Zhang wrote:
> > Libmcrypto is an open source crypto library. It can be found at
> > http://code.google.com/p/libmcrypto/
> 
> Not for much longer; Google code is shutting down. Is there a new upstream
> location for the code that we can reference? Is the project still alive?
> 
> Can we not link against a distribution package rather than copying the code
> inside cbootimage, and having to forever maintain it ourselves, including
> watching out for security holes and backporting fixes etc.?
> 
> Has an internal IP audit been performed for this use of libmcrypto? The
> Google code page says:
> 
> > There is no license associated with this library (although I have to
> > select BSD license as code.google.com forced me to) except the
> > respective licenses of included hash implementation. Anyway, if you
> > use it, it would be nice if you drop me and David Ireland a line to
> > say thank.
> 
> ... and indeed there are no license headers in any of the files except one. I'd
> like our IP audit team to validate that using the code from cbootimage is
> acceptable and that copying the code into cbootimage is acceptable.
> 
OK. I am going to open bug for IP audit team if that is what you mean.

> >  src/libm/base64.c          |  132 +++++
> >  src/libm/bigdUtils.c       |  208 +++++++
> >  src/libm/bigdigits.h       |  294 ++++++++++
> >  src/libm/common.c          |   58 ++
> 
> "libm" is not the name of the library, and this directory layout does not match
> the upstream package. Please follow upstream's layout:
> 
> libmcrypto/include/bigdigits.h
> libmcrypto/src/base64.c
> 
> ... although I still think it'd be even better to just link against a distro package
> of libmcrypto, or otherwise require it to already exist when building
> cbootimage, if at all possible.

I agree with you.  I will try to build libmcrypto as library and link with it. 
