From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v7 3/5] misc: fuse: Add efuse driver for Tegra
Date: Thu, 05 Jun 2014 12:09:36 -0600
Message-ID: <5390B260.2010801@wwwdotorg.org>
References: <1401973754-19701-1-git-send-email-pdeschrijver@nvidia.com> <1401973754-19701-4-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401973754-19701-4-git-send-email-pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Andrew Morton <akpm-de/tnXTf+JLsfHDXvbKv3WD2FQJk+8+b@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/05/2014 07:09 AM, Peter De Schrijver wrote:
> Implement fuse driver for Tegra20, Tegra30, Tegra114 and Tegra124.

This series isn't bisectable; building at either patch 3 or patch 4 yie=
lds:

> In file included from arch/arm/mach-tegra/fuse.c:28:0:
> arch/arm/mach-tegra/fuse.h:40:5: error: conflicting types for =91tegr=
a_fuse_readl=92
> In file included from arch/arm/mach-tegra/fuse.c:26:0:
> include/linux/tegra-soc.h:43:5: note: previous declaration of =91tegr=
a_fuse_readl=92 was here
> arch/arm/mach-tegra/fuse.c:98:5: error: conflicting types for =91tegr=
a_fuse_readl=92
> In file included from arch/arm/mach-tegra/fuse.c:26:0:
> include/linux/tegra-soc.h:43:5: note: previous declaration of =91tegr=
a_fuse_readl=92 was here
> make[1]: *** [arch/arm/mach-tegra/fuse.o] Error 1
> make[1]: *** Waiting for unfinished jobs....
> make: *** [arch/arm/mach-tegra] Error 2
> make: *** Waiting for unfinished jobs....
