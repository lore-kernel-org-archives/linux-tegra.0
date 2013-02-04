From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v5 09/10] clk: tegra: Implement clocks for Tegra114
Date: Mon, 4 Feb 2013 16:07:55 +0200
Message-ID: <20130204140755.GU2364@tbergstrom-lnx.Nvidia.com>
References: <1359713962-16822-1-git-send-email-pdeschrijver@nvidia.com>
 <1359713962-16822-10-git-send-email-pdeschrijver@nvidia.com>
 <510F5E87.90801@nvidia.com>
 <20130204104531.GQ2364@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130204104531.GQ2364-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Rob Landley <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Feb 04, 2013 at 11:45:31AM +0100, Peter De Schrijver wrote:
> On Mon, Feb 04, 2013 at 08:08:55AM +0100, Prashant Gaikwad wrote:

...

> > > +
> > > +       /* dsia */
> > > +       clk = clk_register_mux(NULL, "dsia_mux", mux_plld_out0_plld2_out0,
> > > +                              ARRAY_SIZE(mux_plld_out0_plld2_out0), 0,
> > > +                              clk_base + PLLD_BASE, 25, 1, 0, &pll_d_lock);
> > > +       clks[dsia_mux] = clk;
> > > +       clk = tegra_clk_register_periph_gate("dsia", "dsia_mux", 0, clk_base,
> > > +                                   0, 48, &periph_h_regs,
> > > +                                   periph_clk_enb_refcnt);
> > > +       clk_register_clkdev(clk, "dsia", "tegradc.0");
> > > +       clks[dsia] = clk;
> > > +
> > > +       /* dsib */
> > > +       clk = clk_register_mux(NULL, "dsib_mux", mux_plld_out0_plld2_out0,
> > > +                              ARRAY_SIZE(mux_plld_out0_plld2_out0), 0,
> > > +                              clk_base + PLLD2_BASE, 25, 1, 0, &pll_d2_lock);
> > > +       clks[dsib_mux] = clk;
> > > +       clk = tegra_clk_register_periph_gate("dsib", "dsib_mux", 0, clk_base,
> > > +                                   0, 82, &periph_u_regs,
> > > +                                   periph_clk_enb_refcnt);
> > > +       clk_register_clkdev(clk, "dsib", "tegradc.1");
> > > +       clks[dsib] = clk;
> > > +
> > 
> > Can we use periph no div clock here for dsia and dsib?
> > 
> 
> Will check.
> 

Not as such. As you can see the muxes need a lock to protect access to the
PLLD_BASE and PLLD2_BASE registers respectively. The periph no div clock
doesn't provide for these locks though. Do you think it makes sense to add
the lock support for these 2 clocks?

Cheers,

Peter.
