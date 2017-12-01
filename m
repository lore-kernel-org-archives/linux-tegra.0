From: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] clk: tegra: Mark APB clock as critical
Date: Fri, 1 Dec 2017 10:48:18 +0200
Message-ID: <20171201084818.GI32106@tbergstrom-lnx.Nvidia.com>
References: <1508757172-13030-1-git-send-email-jonathanh@nvidia.com>
 <18f57c1f-add0-908a-6a26-7cc81f29d7d9@gmail.com>
 <f940d9f1-aaec-cf25-24d2-956df63bbbd1@gmail.com>
 <e0fa0df8-aaec-04fe-72b6-21ee1b3c9acb@nvidia.com>
 <95c14859-a2c7-1c61-adba-bd6c16155c01@gmail.com>
 <9d479a38-f40b-0e58-09c3-d06e9ee32a25@nvidia.com>
 <a96d03da-c2a3-1e44-f227-02577f972df6@gmail.com>
 <e69dc6c8-cbca-0498-c9d8-23e9a7ac1ad6@nvidia.com>
 <6264cf17-0850-37dd-ca92-9362521d2db6@gmail.com>
 <236aa250-3b9b-94de-0978-0fb8546d504d@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <236aa250-3b9b-94de-0978-0fb8546d504d-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Nov 30, 2017 at 04:39:22PM +0000, Jon Hunter wrote:
> 
> On 30/11/17 13:24, Dmitry Osipenko wrote:
> > On 30.11.2017 14:31, Jon Hunter wrote:
> >>
> >> On 29/11/17 23:13, Dmitry Osipenko wrote:
> >>> On 30.11.2017 01:55, Jon Hunter wrote:
> >>
> >> ...
> >>
> >>> I've asked you to re-test Tegra114/124 or whatever was failing for you with the
> >>> PLL_M being marked as critical instead of PCLK. Maybe it was PLL_M that actually
> >>> caused trouble on Tegra114/124.
> >>
> >> Please share the exact change you would like me to test and I will.
> > 
> > Please try this:
> 
> I tried the patch, but this does not work for Tegra124 it still hangs.
> Tracing the clk calls the last thing I see is ...
> 
> [    2.687846] tegra124-dfll 70110000.clock: couldn't get vdd_cpu regulator
> [    2.694403] clk_prepare: hclk_div
> [    2.695929] clk_prepare_complete: hclk_div
> [    2.700027] clk_prepare: hclk
> [    2.702947] clk_prepare_complete: hclk
> [    2.706673] clk_prepare: pclk_div
> [    2.709986] clk_prepare_complete: pclk_div
> [    2.714039] clk_prepare: pclk
> [    2.716985] clk_prepare_complete: pclk
> [    2.720739] clk_prepare: apbdma
> [    2.723833] clk_prepare_complete: apbdma
> [    2.727736] clk_enable: hclk_div
> [    2.730940] clk_enable_complete: hclk_div
> [    2.734926] clk_enable: hclk
> [    2.737788] clk_enable_complete: hclk
> [    2.741426] clk_enable: pclk_div
> [    2.744633] clk_enable_complete: pclk_div
> [    2.748619] clk_enable: pclk
> [    2.751481] clk_enable_complete: pclk
> [    2.755120] clk_enable: apbdma
> [    2.758153] clk_enable_complete: apbdma
> [    2.762390] clk_disable: apbdma
> [    2.765088] clk_disable_complete: apbdma
> [    2.768986] clk
> 
> So I believe this change is correct and that Peter's analysis on IRC
> seems correct, that this change has exposed another issue with the clock
> driver.
> 
> Peter, can you summarise which other clocks should be made critical?

The following clocks should be critical:

pclk
hclk
sclk
emc
mc
pll_p

I think that's it.

Peter.
