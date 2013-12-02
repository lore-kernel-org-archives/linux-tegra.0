From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Correct clock number for UARTE
Date: Mon, 2 Dec 2013 14:34:19 +0200
Message-ID: <20131202123419.GX26617@tbergstrom-lnx.Nvidia.com>
References: <1385983825-20317-1-git-send-email-treding@nvidia.com>
 <1385984847.4086.3.camel@weser.hi.pengutronix.de>
 <20131202121447.GB12793@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131202121447.GB12793-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 02, 2013 at 01:14:48PM +0100, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, Dec 02, 2013 at 12:47:27PM +0100, Lucas Stach wrote:
> > Am Montag, den 02.12.2013, 12:30 +0100 schrieb Thierry Reding:
> > > UARTE has clock number 66. Number 65 is the right one for UARTD.
> > > 
> > > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > > ---
> > >  drivers/clk/tegra/clk-tegra-periph.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/tegra/clk-tegra-periph.c b/drivers/clk/tegra/clk-tegra-periph.c
> > > index 5c35885f4a7c..3744a6fe589e 100644
> > > --- a/drivers/clk/tegra/clk-tegra-periph.c
> > > +++ b/drivers/clk/tegra/clk-tegra-periph.c
> > > @@ -492,7 +492,7 @@ static struct tegra_periph_init_data periph_clks[] = {
> > >  	UART("uartb", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTB, 7, tegra_clk_uartb),
> > >  	UART("uartc", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTC, 55, tegra_clk_uartc),
> > >  	UART("uartd", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTD, 65, tegra_clk_uartd),
> > > -	UART("uarte", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTE, 65, tegra_clk_uarte),
> > > +	UART("uarte", mux_pllp_pllc_pllm_clkm, CLK_SOURCE_UARTE, 66, tegra_clk_uarte),
> > >  	XUSB("xusb_host_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_HOST_SRC, 143, TEGRA_PERIPH_ON_APB | TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_host_src),
> > >  	XUSB("xusb_falcon_src", mux_clkm_pllp_pllc_pllre, CLK_SOURCE_XUSB_FALCON_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_falcon_src),
> > >  	XUSB("xusb_fs_src", mux_clkm_48M_pllp_480M, CLK_SOURCE_XUSB_FS_SRC, 143, TEGRA_PERIPH_NO_RESET, tegra_clk_xusb_fs_src),
> > 
> > Is this a stable patch or why are those magic numbers even necessary? I
> > have to admit I didn't follow the Tegra clk stuff closely, but with all
> > the churn going on there I would have suspected that those numbers would
> > have been replaced by the DT include defines by now.
> 
> There is no 1:1 mapping between the DT include defines and the hardware
> clock numbers. For instance, UARTB has DT define 192, but the enable bit
> is at offset 7.
> 

Indeed. Some clocks share the enable bit (eg UARTB and VFIR) and hence
the hardware 'clock number'. The hardware 'clock number' really only tells you
the bank number and the bit in the clk_enable/disable/state register. The bank
number is just 'clock number' / 32. bit number is  'clock number' % 32.

> I think the main reason for doing was because of the Tegra-specific
> reset API. Now that that's being converted to the generic API, there may
> be some room to refactor this. Until then I think we're stuck with
> having these numbers in this table.
> 

It's still a rather convenient way I think. An alternative would be to specify
the bit number and the bank ID as 2 separate parameters.

Cheers,

Peter.
