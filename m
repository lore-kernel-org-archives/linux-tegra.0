From: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
Subject: Re: [PATCH v2 0/6] usb: host: Cleanup for ioremap'ing hcd memory
Date: Mon, 12 May 2014 10:08:13 -0400 (EDT)
Message-ID: <Pine.LNX.4.44L0.1405121007410.1202-100000@iolanthe.rowland.org>
References: <1399723210-21569-1-git-send-email-gautam.vivek@samsung.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399723210-21569-1-git-send-email-gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vivek Gautam <gautam.vivek-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org>
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shc_work-JGs/UdohzUI@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, 10 May 2014, Vivek Gautam wrote:

> Based on 'usb-next' branch of Greg's usb tree.
> 
> devm_ioremap_resource() API is advantageous over devm_ioremap()
> and should therefore be preferred to request any ioremap'ed address
> for hcd.
> 
> Changes from v1:
>  - Changed the way returned pointer is checked for error value
>    as pointed out in the review comment in the mailing list.
> 
> Vivek Gautam (6):
>   usb: host: ehci-exynos: Use devm_ioremap_resource instead of
>     devm_ioremap
>   usb: host: ehci-msm: Use devm_ioremap_resource instead of
>     devm_ioremap
>   usb: host: ehci-mv: Use devm_ioremap_resource instead of devm_ioremap
>   usb: host: ehci-spear: Use devm_ioremap_resource instead of
>     devm_ioremap
>   usb: host: ehci-tegra: Use devm_ioremap_resource instead of
>     devm_ioremap
>   usb: host: ohci-exynos: Use devm_ioremap_resource instead of
>     devm_ioremap
> 
>  drivers/usb/host/ehci-exynos.c |    7 +++----
>  drivers/usb/host/ehci-msm.c    |    7 +++----
>  drivers/usb/host/ehci-mv.c     |   16 ++++++----------
>  drivers/usb/host/ehci-spear.c  |   13 +++----------
>  drivers/usb/host/ehci-tegra.c  |    7 +++----
>  drivers/usb/host/ohci-exynos.c |    7 +++----
>  6 files changed, 21 insertions(+), 36 deletions(-)

For all six patches,

Acked-by: Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>
