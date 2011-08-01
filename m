From: Marc Dietich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: nvec TODO
Date: Mon, 1 Aug 2011 13:28:28 +0200
Message-ID: <201108011328.29440.marvin24@gmx.de>
References: <20110801104549.GG15578@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110801104549.GG15578-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Greg KH <greg-U8xfFu+wG4EAvxtiuMwx3w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, ac100-+ipbUBPD95tH4x6Dk/4f9A@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Russell, Greg,

> Greg,
> 
> A small patch to add something to this staging drivers todo list which
> I just noticed.  BTW, why isn't there any easy way to find a list of
> addresses to copy against stuff in staging?  I hope I have everyone...

the Tegra/Nvidia/Google people are not involved in this driver development. The 
hw was used in the first generation Android devices only and became kind of 
obsolete (in kernels > .32 released by NV), but still there are a handfull older 
devices using it. That's why some community people (ml: 
ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, irc:#ac100 on freenode) try to port it to newer 
kernels. 

> The note is about something which should be easy enough to fix by people
> who know the Tegra stuff (it probably involves changes outside of this
> driver to fix.)

I'll post some update to the driver soon (V2 of the patches I already submitted, 
http://driverdev.linuxdriverproject.org/pipermail/devel/2011-July/018751.html). 
In fact, the clock stuff should be done by the i2c-tegra driver and not in nvec 
itself. I hope I have time to prepare a corresponding patch for the next merge 
window (kernel 3.2). So the patch below is not needed anymore. 

Thanks

Marc


> 8<-------
> From: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> Staging: Add clk API note to nvec/TODO
> 
> Add a note about the abuse of the clk API to the nvec/TODO list.
> 
> Signed-off-by: Russell King <rmk+kernel-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
> ---
>  drivers/staging/nvec/TODO |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/nvec/TODO b/drivers/staging/nvec/TODO
> index 77b47f7..649d6b7 100644
> --- a/drivers/staging/nvec/TODO
> +++ b/drivers/staging/nvec/TODO
> @@ -4,5 +4,7 @@ ToDo list (incomplete, unordered)
>  	- add compile as module support
>  	- move nvec devices to mfd cells?
>  	- adjust to kernel style
> -
> -
> +	- fix clk usage
> +	  should not be using clk_get_sys(), but clk_get(&pdev->dev, conn)
> +	  where conn is either NULL if the device only has one clock, or
> +	  the device specific name if it has multiple clocks.
