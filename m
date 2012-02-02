From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/1] ARM: tegra: Add support for USB2 port on Seaboard
Date: Thu, 2 Feb 2012 11:21:45 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF178E124B0C@HQMAIL01.nvidia.com>
References: <4B9C9637D5087840A465BDCB251780E9E2D185633D@HKMAIL02.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4B9C9637D5087840A465BDCB251780E9E2D185633D-jYPH5V5jAeRDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "'ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org'" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "'olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org'" <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: "'linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org'" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jim Lin wrote at Thursday, February 02, 2012 4:36 AM:
> ...

Jim,

This message was sent as rich-text which makes it unsuitable for public
mailing lists. Also, the email wasn't formatted as appropriate for a
patch. If you use "git send-email", it'll do all the hard work for you.
Please see our internal upstreaming wiki for details (which for reference
points at the usual files in the kernel's Documentation/ tree), or talk
to me off-list about this.

> 1. ULPI_RESET* is routed to GPIO_PV1, based on schematic file.

That's true for Seaboard, but not for Toshiba AC100 and TrimSlice, which
both share the same PHY platform data structure at present. Consequently,
this patch would break those boards.

The best course of action here would be to define complete device tree
bindings for Tegra's USB hardware. However, be aware that there's an
effort in progress to revamp our USB drivers so that features like USB
device mode can be upstreamed in a cleaner fashion than they exist in
our downstream kernels; you should co-ordinate with the people working
on that (I can give you names off-list).

> diff --git a/arch/arm/mach-tegra/board-seaboard.c b/arch/arm/mach-tegra/board-seaboard.c

>  static __initdata struct tegra_clk_init_table seaboard_clk_init_table[] = {
>  	/* name		parent		rate		enabled */
> +	{ "pll_c",	"clk_m",	600000000,	true },
> +	{ "pll_c_out1",	"pll_c",	120000000,	true },
> +	{ "sclk",	"pll_c_out1",	120000000,	true },
> +	{ "hclk",	"sclk",		120000000,	true },
> +	{ "pclk",	"hclk",		60000000,	true },
> +	{ "pll_p_out4",	"pll_p",	24000000,	true },

That seems like general setup that'd be better off in common.c or
board-dt-*.c. Actually, this change conflicts with some of the clocking
already in those files. Can you explain more re: whether this is a
safe change, and will work for all boards; it'd be nice to use the same
base clock tree setup everywhere if possible.

-- 
nvpublic
