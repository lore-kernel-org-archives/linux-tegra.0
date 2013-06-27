From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 08/11] clk: tegra114: add suspend/resume function for
 tegar_cpu_car_ops
Date: Thu, 27 Jun 2013 18:12:36 +0800
Message-ID: <1372327956.9389.33.camel@jlo-ubuntu-64.nvidia.com>
References: <1372152475-18617-1-git-send-email-josephl@nvidia.com>
	 <1372152475-18617-9-git-send-email-josephl@nvidia.com>
	 <51CB432E.9080006@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51CB432E.9080006-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 2013-06-27 at 03:38 +0800, Stephen Warren wrote:
> On 06/25/2013 03:27 AM, Joseph Lo wrote:
> > Adding suspend/resume function for tegra_cpu_car_ops. We only save and
> > restore the setting of the clock of CoreSight. Other clocks still need
> > to be taken care by clock driver.
> 
> Mike, can I get an ack to take this through the Tegra tree with the rest
> of this series, for 3.12. Thanks.
> 
> (Nit: There's a typo in the patch subject here too.)
> 
> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> 
> > +#ifdef CONFIG_PM_SLEEP
> > +static void tegra114_cpu_clock_suspend(void)
> > +{
> > +	/* switch coresite to clk_m, save off original source */
> > +	tegra114_cpu_clk_sctx.clk_csite_src =
> > +				readl(clk_base + CLK_SOURCE_CSITE);
> > +	writel(3<<30, clk_base + CLK_SOURCE_CSITE);
> 
> Don't you need spaces around the << to satisfy checkpatch/coding style?

It didn't cause a warning by checkpatch. But I will fix it in next
version.

Thanks.
