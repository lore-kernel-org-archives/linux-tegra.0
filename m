From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 09/10] clk: tegra: Implement clocks for Tegra114
Date: Mon, 4 Feb 2013 12:45:31 +0200
Message-ID: <20130204104531.GQ2364@tbergstrom-lnx.Nvidia.com>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com>
 <1359713962-16822-10-git-send-email-pdeschrijver@nvidia.com>
 <510F5E87.90801@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <510F5E87.90801-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 04, 2013 at 08:08:55AM +0100, Prashant Gaikwad wrote:

...

> > +#define RST_DEVICES_L                  0x004
> > +#define RST_DEVICES_H                  0x008
> > +#define RST_DEVICES_U                  0x00C
> > +#define RST_DEVICES_V                  0x358
> > +#define RST_DEVICES_W                  0x35C
> > +#define RST_DEVICES_X                  0x28C
> > +#define RST_DEVICES_SET_L              0x300
> > +#define RST_DEVICES_CLR_L              0x304
> > +#define RST_DEVICES_SET_H              0x308
> > +#define RST_DEVICES_CLR_H              0x30c
> > +#define RST_DEVICES_SET_U              0x310
> > +#define RST_DEVICES_CLR_U              0x314
> > +#define RST_DEVICES_SET_V              0x430
> > +#define RST_DEVICES_CLR_V              0x434
> > +#define RST_DEVICES_SET_W              0x438
> > +#define RST_DEVICES_CLR_W              0x43c
> > +#define RST_DEVICES_NUM                        5
> 
> RST_DEVICES_SET/CLR_X?
> 

For all I can see (from the not yet public TRM), this is not actually used?
So I decided to not mention it here.

> > +
> > +#define CLK_OUT_ENB_L                  0x010
> > +#define CLK_OUT_ENB_H                  0x014
> > +#define CLK_OUT_ENB_U                  0x018
> > +#define CLK_OUT_ENB_V                  0x360
> > +#define CLK_OUT_ENB_W                  0x364
> > +#define CLK_OUT_ENB_X                  0x280
> > +#define CLK_OUT_ENB_SET_L              0x320
> > +#define CLK_OUT_ENB_CLR_L              0x324
> > +#define CLK_OUT_ENB_SET_H              0x328
> > +#define CLK_OUT_ENB_CLR_H              0x32c
> > +#define CLK_OUT_ENB_SET_U              0x330
> > +#define CLK_OUT_ENB_CLR_U              0x334
> > +#define CLK_OUT_ENB_SET_V              0x440
> > +#define CLK_OUT_ENB_CLR_V              0x444
> > +#define CLK_OUT_ENB_SET_W              0x448
> > +#define CLK_OUT_ENB_CLR_W              0x44c
> > +#define CLK_OUT_ENB_SET_X              0x284
> > +#define CLK_OUT_ENB_CLR_X              0x288
> > +#define CLK_OUT_ENB_NUM                        6
> 
> <snip>
> 
> > +
> > +       /* dsia */
> > +       clk = clk_register_mux(NULL, "dsia_mux", mux_plld_out0_plld2_out0,
> > +                              ARRAY_SIZE(mux_plld_out0_plld2_out0), 0,
> > +                              clk_base + PLLD_BASE, 25, 1, 0, &pll_d_lock);
> > +       clks[dsia_mux] = clk;
> > +       clk = tegra_clk_register_periph_gate("dsia", "dsia_mux", 0, clk_base,
> > +                                   0, 48, &periph_h_regs,
> > +                                   periph_clk_enb_refcnt);
> > +       clk_register_clkdev(clk, "dsia", "tegradc.0");
> > +       clks[dsia] = clk;
> > +
> > +       /* dsib */
> > +       clk = clk_register_mux(NULL, "dsib_mux", mux_plld_out0_plld2_out0,
> > +                              ARRAY_SIZE(mux_plld_out0_plld2_out0), 0,
> > +                              clk_base + PLLD2_BASE, 25, 1, 0, &pll_d2_lock);
> > +       clks[dsib_mux] = clk;
> > +       clk = tegra_clk_register_periph_gate("dsib", "dsib_mux", 0, clk_base,
> > +                                   0, 82, &periph_u_regs,
> > +                                   periph_clk_enb_refcnt);
> > +       clk_register_clkdev(clk, "dsib", "tegradc.1");
> > +       clks[dsib] = clk;
> > +
> 
> Can we use periph no div clock here for dsia and dsib?
> 

Will check.

> > +       /* xusb_hs_src */
> > +       val = readl(clk_base + CLK_SOURCE_XUSB_SS_SRC);
> > +       val |= BIT(25); /* always select PLLU_60M */
> > +       writel(val, clk_base + CLK_SOURCE_XUSB_SS_SRC);
> > +
> > +       clk = clk_register_fixed_factor(NULL, "xusb_hs_src", "pll_u_60M", 0,
> > +                                       1, 1);
> > +       clks[xusb_hs_src] = clk;
> > +
> 
> With device tree we can directly use pll_u_60M, no need to register 
> clock with fixed factor 1.

This is true for now. In the future these clocks will need to be dvfs aware
though. I think it makes sense to have a separate clock then?

> Same comment for dis1-fixed, dsi2-fixed and mipi-cal-fast clocks.
> 

Those might not need to become dvfs aware.

> > +       /* xusb_host */
> > +       clk = tegra_clk_register_periph_gate("xusb_host", "xusb_host_src", 0,
> > +                                   clk_base, 0, 89, &periph_u_regs,
> > +                                   periph_clk_enb_refcnt);
> > +       clk_register_clkdev(clk, "tegra_xhci", "host");
> > +       clks[xusb_host] = clk;
> > +
> > +       /* xusb_ss */
> > +       clk = tegra_clk_register_periph_gate("xusb_ss", "xusb_ss_src", 0,
> > +                                   clk_base, 0, 156, &periph_w_regs,
> > +                                   periph_clk_enb_refcnt);
> > +       clk_register_clkdev(clk, "tegra_xhci", "ss");
> > +       clks[xusb_host] = clk;
> > +
> > +       /* xusb_dev */
> > +       clk = tegra_clk_register_periph_gate("xusb_dev", "xusb_dev_src", 0,
> > +                                   clk_base, 0, 95, &periph_u_regs,
> > +                                   periph_clk_enb_refcnt);
> > +       clk_register_clkdev(clk, "tegra_xhci", "dev");
> 
> clks[xusb_dev] = clk;
> 

Missing indeed.

Cheers,

Peter.
