From: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Subject: Re: [PATCH v4 1/2] platform: Remove most references to platform_bus
 device
Date: Wed, 23 Jul 2014 10:41:37 -0700
Message-ID: <20140723174137.GC16664@kroah.com>
References: <1406135239-17550-1-git-send-email-pawel.moll@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1406135239-17550-1-git-send-email-pawel.moll-5wv7dgnIgG8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Catalin Marinas <Catalin.Marinas-5wv7dgnIgG8@public.gmane.org>, paul-DWxLp4Yu+b8AvxtiuMwx3w@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 23, 2014 at 06:07:18PM +0100, Pawel Moll wrote:
> A number of board files in arch/arm and arch/unicore32
> explicitly reference platform_bus device as a parent
> for new platform devices.
> 
> This is unnecessary, as platform device API guarantees
> that devices with NULL parent are going to by adopted
> by the mentioned "root" device.
> 
> This patch removes or replaces with NULL such references.
> 
> Signed-off-by: Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>
> ---
>  arch/arm/mach-bcm/board_bcm21664.c      |  3 +--
>  arch/arm/mach-bcm/board_bcm281xx.c      |  3 +--
>  arch/arm/mach-clps711x/board-edb7211.c  |  6 +++---
>  arch/arm/mach-clps711x/board-p720t.c    |  6 +++---
>  arch/arm/mach-imx/mach-mx27ads.c        |  2 +-
>  arch/arm/mach-shmobile/board-ape6evm.c  | 14 +++++++-------
>  arch/arm/mach-shmobile/board-bockw.c    | 19 ++++++++----------
>  arch/arm/mach-shmobile/board-genmai.c   |  5 ++---
>  arch/arm/mach-shmobile/board-koelsch.c  | 26 ++++++++++++-------------
>  arch/arm/mach-shmobile/board-lager.c    | 34 ++++++++++++++-------------------
>  arch/arm/mach-shmobile/board-marzen.c   |  1 -
>  arch/arm/mach-shmobile/setup-r7s72100.c |  2 +-
>  arch/arm/mach-shmobile/setup-r8a73a4.c  |  8 ++++----
>  arch/arm/mach-shmobile/setup-r8a7778.c  | 13 ++++++-------
>  arch/arm/mach-shmobile/setup-r8a7779.c  |  6 +++---
>  arch/arm/mach-shmobile/setup-r8a7790.c  | 10 +++++-----
>  arch/arm/mach-shmobile/setup-r8a7791.c  |  8 ++++----
>  arch/unicore32/kernel/puv3-core.c       |  2 +-
>  arch/unicore32/kernel/puv3-nb0916.c     |  6 +++---
>  19 files changed, 79 insertions(+), 95 deletions(-)

Looks good, if there are no objections, I'll take this through my
driver-core tree, so that your follow-on patches that change things will
still apply.

thanks,

greg k-h
