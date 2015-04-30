From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 19/19] clk: tegra210: add support for Tegra210 clocks
Date: Thu, 30 Apr 2015 16:57:30 -0400
Message-ID: <5542973A.5000402@nvidia.com>
References: <1430328109-537-1-git-send-email-rklein@nvidia.com>	<1430328109-537-20-git-send-email-rklein@nvidia.com> <CAL1qeaHdjb57D8U-NBeyicV=JP2pNkyx3Xfn2RDgWivdw5jWNg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL1qeaHdjb57D8U-NBeyicV=JP2pNkyx3Xfn2RDgWivdw5jWNg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 4/30/2015 4:43 PM, Andrew Bresticker wrote:
> Hi Rhyland,
> 
> On Wed, Apr 29, 2015 at 10:21 AM, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
>> Implement clock support for Tegra210.
>>
>> Signed-off-by: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
>> --- /dev/null
>> +++ b/drivers/clk/tegra/clk-tegra210.c
> 
>> +       /* PLLU */
>> +       val = readl(clk_base + pll_u_params.base_reg);
>> +       val &= ~BIT(24); /* disable PLLU_OVERRIDE */
>> +       writel(val, clk_base + pll_u_params.base_reg);
>> +
>> +       clk = tegra_clk_register_pll("pll_u", "pll_ref", clk_base, pmc, 0,
>> +                           &pll_u_params, &pll_u_lock);
>> +       clk_register_clkdev(clk, "pll_u", NULL);
>> +       clks[TEGRA210_CLK_PLL_U] = clk;
>> +
>> +       tegra210_utmi_param_configure(clk_base);
>> +
>> +       /* PLLU_480M */
>> +       clk = clk_register_gate(NULL, "pll_u_480M", "pll_u",
>> +                               CLK_SET_RATE_PARENT, clk_base + PLLU_BASE,
>> +                               22, 0, &pll_u_lock);
>> +       clk_register_clkdev(clk, "pll_u_480M", NULL);
>> +       clks[TEGRA210_CLK_PLL_U_480M] = clk;
>> +
>> +       /* PLLU_60M */
>> +       clk = clk_register_fixed_factor(NULL, "pll_u_60M", "pll_u",
>> +                                       CLK_SET_RATE_PARENT, 1, 8);
>> +       clk_register_clkdev(clk, "pll_u_60M", NULL);
>> +       clks[TEGRA210_CLK_PLL_U_60M] = clk;
>> +
>> +       /* PLLU_48M */
>> +       clk = clk_register_fixed_factor(NULL, "pll_u_48M", "pll_u",
>> +                                       CLK_SET_RATE_PARENT, 1, 10);
>> +       clk_register_clkdev(clk, "pll_u_48M", NULL);
>> +       clks[TEGRA210_CLK_PLL_U_48M] = clk;
>> +
>> +       /* PLLU_12M */
>> +       clk = clk_register_fixed_factor(NULL, "pll_u_12M", "pll_u",
>> +                                       CLK_SET_RATE_PARENT, 1, 40);
>> +       clk_register_clkdev(clk, "pll_u_12M", NULL);
>> +       clks[TEGRA210_CLK_PLL_U_12M] = clk;
> 
> The PLLU hierarchy isn't quite right here.  pll_u_480M is derived from
> the VCO output of pll_u (480Mhz) rather than the final output
> (240Mhz).  It also looks, from downstream kernels and from the "PLLU
> Configuration Information" table in the TRM, that pll_u_48M and
> pll_u_60M are derived from pll_u_out1 and pll_u_out2, respectively.  I
> don't see any mention of a 12Mhz output (pll_u_12M) either.
> 
> So I think the PLLU clock tree looks something like this:
> 
> pll_u_vco (480Mhz)
>     pll_u_480M (480Mhz - gated by PLLU_BASE[22])
>     pll_u (240Mhz)
>         pll_u_out1 (48Mhz - PLLU_OUTA[15:0])
>             pll_u_48M (48Mhz - gated by PLLU_BASE[25])
>         pll_u_out2 (60Mhz - PLLU_OUTA[31:16])
>             pll_u_60M (60Mhz - gated by PLLU_BASE[23])
> 
> -Andrew
> 

Thanks for pointing this out, I'll look into it for v3.

-rhyland

-- 
nvpublic
