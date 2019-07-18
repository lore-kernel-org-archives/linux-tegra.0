From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH V5 11/18] clk: tegra210: Add support for Tegra210 clocks
Date: Thu, 18 Jul 2019 22:42:22 +0300
Message-ID: <20190718194222.GH12715@pdeschrijver-desktop.Nvidia.com>
References: <351a07d4-ba90-4793-129b-b1a733f95531@nvidia.com>
 <e3e9beaf-b195-305e-4010-66e824813472@gmail.com>
 <9271ae75-5663-e26e-df26-57cba94dab75@nvidia.com>
 <7ae3df9a-c0e9-cf71-8e90-4284db8df82f@nvidia.com>
 <b01e37aa-f14e-e628-ceef-b25a845c6359@gmail.com>
 <46b55527-da5d-c0b7-1c14-43b5c6d49dfa@nvidia.com>
 <2de9a608-cf38-f56c-b192-7ffed65092f8@nvidia.com>
 <bff3e9c0-727d-9aef-a0e2-583e53c39afd@gmail.com>
 <5eedd224-77b0-1fc9-4e5e-d884b41a64ed@nvidia.com>
 <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <89f23878-d4b2-2305-03e5-8a3e781c2b02@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: Sowjanya Komatineni <skomatineni@nvidia.com>, sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com, pgaikwad@nvidia.com, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On Thu, Jul 18, 2019 at 02:44:56AM +0300, Dmitry Osipenko wrote:
> > 
> > dependencies I am referring are dfll_ref, dfll_soc, and DVFS peripheral
> > clocks which need to be restored prior to DFLL reinit.
> 
> Okay, but that shouldn't be a problem if clock dependencies are set up
> properly.
> 
> >>> reverse list order during restore might not work as all other clocks are
> >>> in proper order no with any ref clocks for plls getting restored prior
> >>> to their clients
> >> Why? The ref clocks should be registered first and be the roots for PLLs
> >> and the rest. If it's not currently the case, then this need to be
> >> fixed. You need to ensure that each clock is modeled properly. If some
> >> child clock really depends on multiple parents, then the parents need to
> >> in the correct order or CCF need to be taught about such
> >> multi-dependencies.
> >>
> >> If some required feature is missed, then you have to implement it
> >> properly and for all, that's how things are done in upstream. Sometimes
> >> it's quite a lot of extra work that everyone are benefiting from in
> >> the end.
> >>
> >> [snip]
> > 
> > Yes, we should register ref/parents before their clients.
> > 
> > cclk_g clk is registered last after all pll and peripheral clocks are
> > registers during clock init.
> > 
> > dfllCPU_out clk is registered later during dfll-fcpu driver probe and
> > gets added to the clock list.
> > 
> > Probably the issue seems to be not linking dfll_ref and dfll_soc
> > dependencies for dfllCPU_out thru clock list.
> > 
> > clk-dfll driver during dfll_init_clks gets ref_clk and soc_clk reference
> > thru DT.

The dfll does not have any parents. It has some clocks which are needed
for the logic part of the dfll to function, but there's no parent clock
as such unlike for peripheral clocks or PLLs where the parent is at
least used as a reference. The I2C controller of the DFLL shares the
lines with a normal I2C controller using some arbitration logic. That
logic only works if the clock for the normal I2C controller is enabled.
So you need probably 3 clocks enabled to initialize the dfll in that
case. I don't think it makes sense to add complicated logic to the clock
core to deal with this rather strange case. To me it makes more sense to
use pmops and open code the sequence there.

Peter.
