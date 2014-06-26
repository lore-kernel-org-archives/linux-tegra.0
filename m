From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: fix vi_sensor clocks on Tegra124
Date: Thu, 26 Jun 2014 13:30:51 +0300
Message-ID: <20140626103051.GB3679@tbergstrom-lnx.Nvidia.com>
References: <1403712609-13624-1-git-send-email-pdeschrijver@nvidia.com>
 <53AB38D6.6070901@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <53AB38D6.6070901-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jun 25, 2014 at 11:02:14PM +0200, Stephen Warren wrote:
> On 06/25/2014 10:10 AM, Peter De Schrijver wrote:
> > vi_sensor and vi_sensor2 have a wrong hw clkid on Tegra124. Fix this by
> > correcting the hw clkid for Tegra124 and creating the Tegra114 vi_sensor clock
> > from its own data. Tegra124 was also using the wrong internal clock id.
> 
> > diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> 
> > -	MUX("vi_sensor2", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR2, 20, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor2),
> > +	MUX("vi_sensor2", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR2, 165, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor2),
> ...
> > -	MUX8("vi_sensor", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR, 20, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_8),
> > +	MUX8("vi_sensor", mux_pllm_pllc2_c_c3_pllp_plla, CLK_SOURCE_VI_SENSOR, 164, TEGRA_PERIPH_NO_RESET, tegra_clk_vi_sensor_8),
> 
> If I'm reading the TRM right, these are CAM_MCLK/CAM_MCLK2 in the
> RST_DEV_X register. Is the TRM simply inconsistent in the naming of
> these clocks, or is there some other inconsistency?
> 

Yeah, the TRM has an inconsistent naming of these clocks for all I can see.

> > diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
> 
> > @@ -777,7 +784,6 @@ static struct tegra_clk tegra114_clks[tegra_clk_max] __initdata = {
> >  	[tegra_clk_spdif_in] = { .dt_id = TEGRA114_CLK_SPDIF_IN, .present = true },
> >  	[tegra_clk_spdif_out] = { .dt_id = TEGRA114_CLK_SPDIF_OUT, .present = true },
> >  	[tegra_clk_vi_8] = { .dt_id = TEGRA114_CLK_VI, .present = true },
> > -	[tegra_clk_vi_sensor_8] = { .dt_id = TEGRA114_CLK_VI_SENSOR, .present = true },
> 
> Does it make any sense to
> s/tegra_clk_vi_sensor_8/tegra_clk_vi_sensor_114/ and put the definition
> into the table in clk-tegra-periph.c instead? I suppose if this clock
> definition is specific to Tegra114 there's not much point, so this is

That was exactly my reasoning, because this clock is specific to Tegra114,
it doesn't make much sense to put in clk-tegra-periph.c. Also Tegra20 and
Tegra30 have some peripheral clocks which are not defined in
clk-tegra-periph.c.

> probably fine. Hopefully the new tegra_clk_vi_sensor_8 lasts longer than
> just Tegra124...
> 
> So overall, I think:
> Acked-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Ok. I will take this into tegra-clk-next for 3.17 together with the changes
for sata.

Cheers,

Peter.
