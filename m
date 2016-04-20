From: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>
Subject: Re: [tegrarcm PATCH] Don't assume cryptopp is system-wide installed
Date: Wed, 20 Apr 2016 11:27:35 +0200
Message-ID: <20160420112735.16eca48a@free-electrons.com>
References: <1461097517-21626-1-git-send-email-thomas.petazzoni@free-electrons.com>
	<5716B20E.8050607@wwwdotorg.org>
	<20160419235745.GA28796@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160419235745.GA28796-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hello,

On Tue, 19 Apr 2016 16:57:45 -0700, Allen Martin wrote:

> What about the following as an alternative?
> 
> --
> diff --git a/src/Makefile.am b/src/Makefile.am
> index 3dad0e6d5e72..22410b3f81bf 100644
> --- a/src/Makefile.am
> +++ b/src/Makefile.am
> @@ -1,5 +1,6 @@
>  AM_CFLAGS = -Wall -std=c99
> -AM_CPPFLAGS = -isystem /usr/include/$(CRYPTOLIB) $(LIBUSB_CFLAGS)
> +CRYPTO_PREFIX = $(shell pkg-config --variable=includedir libcrypto++)

Using pkg-config is indeed a much better option. However, there are
several gotchas:

 - First, calling pkg-config like this is not the correct way of using
   pkg-config in autoconf/automake based packages. Instead, you should
   use the PKG_CHECK_MODULES() autoconf macro, which will fill in for
   you the <foo>_CFLAGS and <foo>_LIBS variables. Look at your
   configure.ac, it is already used for the detection of libusb!

 - Second, your logic assumes that libcrypto is called libcrypto++
   while the crux of the matter is that on some platforms it is named
   libcryptopp, on others it's called libcrypto++. Of course, this can
   be solved in the configure.ac by calling PKG_CHECK_MODULES() for
   both.

 - Third, the upstream version of libcrypto++ does *not* install a
   pkg-config file. The Debian packagers have added one, so you
   probably have one on your Debian system, but if you build
   libcrypto++ from source and simply "make install" it, you won't have
   a .pc file that describes it for pkg-config.

The last point is the very reason why my patch didn't switch to simply
use pkg-config.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
