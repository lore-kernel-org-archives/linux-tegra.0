From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 1/8] clk: tegra: Add PLLP_UD and PLLMB_UD for Tegra210
Date: Tue, 10 Mar 2020 20:50:07 +0300
Message-ID: <f613a047-bf3f-3fb5-4034-ce435bb6cd6d@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-2-thierry.reding@gmail.com>
 <9b343fd1-15df-409a-390f-e30fa6bbbfe7@gmail.com>
 <20200310170508.GA3079591@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310170508.GA3079591@ulmo>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 20:05, Thierry Reding пишет:
> On Tue, Mar 10, 2020 at 07:19:59PM +0300, Dmitry Osipenko wrote:
>> 10.03.2020 18:19, Thierry Reding пишет:
>>> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>>
>>> Introduce the low jitter path of PLLP and PLLMB which can be used as EMC
>>> clock source.
>>>
>>> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>>>  drivers/clk/tegra/clk-tegra210.c         | 11 +++++++++++
>>>  include/dt-bindings/clock/tegra210-car.h |  4 ++--
>>>  2 files changed, 13 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>>> index 45d54ead30bc..f99647b4a71f 100644
>>> --- a/drivers/clk/tegra/clk-tegra210.c
>>> +++ b/drivers/clk/tegra/clk-tegra210.c
>>> @@ -3161,6 +3161,17 @@ static void __init tegra210_pll_init(void __iomem *clk_base,
>>>  	clk_register_clkdev(clk, "pll_m_ud", NULL);
>>>  	clks[TEGRA210_CLK_PLL_M_UD] = clk;
>>>  
>>> +	/* PLLMB_UD */
>>> +	clk = clk_register_fixed_factor(NULL, "pll_mb_ud", "pll_mb",
>>> +					CLK_SET_RATE_PARENT, 1, 1);
>>> +	clk_register_clkdev(clk, "pll_mb_ud", NULL);
>>> +	clks[TEGRA210_CLK_PLL_MB_UD] = clk;
>>> +
>>> +	/* PLLP_UD */
>>> +	clk = clk_register_fixed_factor(NULL, "pll_p_ud", "pll_p",
>>> +					0, 1, 1);
>>> +	clks[TEGRA210_CLK_PLL_P_UD] = clk;
>>
>> Isn't it possible to auto-enable the low-jitter bit when necessary
>> during of the rate-change based on a given clock-rate?
> 
> I don't think so. These new clocks (pll_mb_ud and pll_p_ud) are parents
> for the emc clock, so they are needed to properly reflect the position
> of the emc clock in the clock tree.

Okay, even if it's possible to do, I guess that won't be very compatible
with the firmware.
