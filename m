From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [tegrarcm PATCH] Don't assume cryptopp is system-wide installed
Date: Thu, 21 Apr 2016 21:24:02 +0200
Message-ID: <20160421212402.4d16bbe5@free-electrons.com>
References: <1461097517-21626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<5716B20E.8050607@wwwdotorg.org>
	<20160419235745.GA28796@nvidia.com>
	<20160420112735.16eca48a@free-electrons.com>
	<20160421181359.GA17433@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160421181359.GA17433-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

On Thu, 21 Apr 2016 11:13:59 -0700, Allen Martin wrote:

> Unfortunately, libcrypto++ doesn't export any CFLAGS, so
> PKG_CHECK_MODULES() doesn't work:
> 
>   arm@chrome~$ pkg-config --cflags libcrypto++
>  
>   arm@chrome~$ pkg-config --libs libcrypto++
>   -lcrypto++  
>   arm@chrome~$ pkg-config --print-variables libcrypto++
>   exec_prefix
>   prefix
>   libdir
>   includedir
>   arm@chrome~$ pkg-config --variable=includedir libcrypto++
>   /usr/include

Ah, crap. So obviously relying on pkg-config is not an option.

> >  - Second, your logic assumes that libcrypto is called libcrypto++
> >    while the crux of the matter is that on some platforms it is named
> >    libcryptopp, on others it's called libcrypto++. Of course, this can
> >    be solved in the configure.ac by calling PKG_CHECK_MODULES() for
> >    both.
> 
> Looking at configure.ac I think there's another assumption baked in
> too.  The compile test uses:
> 
>   LDFLAGS="$LDFLAGS -lcryptopp -lpthread"

Yes, but no, because:

configure.ac:   [CRYPTOLIB="cryptopp"],
configure.ac:           [CRYPTOLIB="crypto++"],
[...]
src/Makefile.am:tegrarcm_LDADD = $(LIBUSB_LIBS) -l$(CRYPTOLIB) -lpthread

So the proper -lcryptopp or -lcrypto++ is added.

> Well that sucks.  What about a command line option to configure to
> specify the libcrypto++ include path?  My issue here is that if you
> have the headers in a non standard location (like $HOME/include), the
> compiler probably won't know how to find them either, and the compile
> check will fail at configure time.

Yes, of course, and it's my use case. I'm building tegracrm in the
context of a build system, as a native tool (i.e built for the build
machine, not cross-compiled for the target). And for such tools, we
install all host libraries in some non-standard location (since we
don't run as root, obviously).

The solution I proposed keeps the "autodetection" mechanism that is
currently in place.

> I'd like to change the -isystem to a plain -I too.  I think I added
> that because the source code used #include "foo.h" instead of 
> #include <foo.h> and I didn't want to make any source code changes
> with the automake changes. 

Sounds like a good idea.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
