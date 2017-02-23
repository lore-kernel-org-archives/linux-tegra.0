From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 4/7] clk: tegra: remove non-existing pll_m_out1 clock
Date: Thu, 23 Feb 2017 10:17:25 +0200
Message-ID: <65ad6aa9-d2c9-0264-bf17-6434cb1d84e5@kapsi.fi>
References: <1487776444-4701-1-git-send-email-pdeschrijver@nvidia.com>
 <1487776444-4701-5-git-send-email-pdeschrijver@nvidia.com>
 <3be69e34-354c-81ea-0c5e-182a79aa42d0@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <3be69e34-354c-81ea-0c5e-182a79aa42d0-/1wQRMveznE@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Whoops, that is, after a commit message is added.

On 23.02.2017 10:17, Mikko Perttunen wrote:
> Reviewed-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> On 22.02.2017 17:13, Peter De Schrijver wrote:
>> Signed-off-by: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/clk/tegra/clk-tegra210.c | 5 -----
>>  1 file changed, 5 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-tegra210.c
>> b/drivers/clk/tegra/clk-tegra210.c
>> index 7bda8ba..b7ef8a7 100644
>> --- a/drivers/clk/tegra/clk-tegra210.c
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -2115,7 +2115,6 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
>>      [tegra_clk_pll_c2] = { .dt_id = TEGRA210_CLK_PLL_C2, .present =
>> true },
>>      [tegra_clk_pll_c3] = { .dt_id = TEGRA210_CLK_PLL_C3, .present =
>> true },
>>      [tegra_clk_pll_m] = { .dt_id = TEGRA210_CLK_PLL_M, .present =
>> true },
>> -    [tegra_clk_pll_m_out1] = { .dt_id = TEGRA210_CLK_PLL_M_OUT1,
>> .present = true },
>>      [tegra_clk_pll_p] = { .dt_id = TEGRA210_CLK_PLL_P, .present =
>> true },
>>      [tegra_clk_pll_p_out1] = { .dt_id = TEGRA210_CLK_PLL_P_OUT1,
>> .present = true },
>>      [tegra_clk_pll_p_out3] = { .dt_id = TEGRA210_CLK_PLL_P_OUT3,
>> .present = true },
>> @@ -2229,7 +2228,6 @@ static u32 pll_expo_p_to_pdiv(u32 p, u32 *pdiv)
>>      { .con_id = "pll_p_out3", .dt_id = TEGRA210_CLK_PLL_P_OUT3 },
>>      { .con_id = "pll_p_out4", .dt_id = TEGRA210_CLK_PLL_P_OUT4 },
>>      { .con_id = "pll_m", .dt_id = TEGRA210_CLK_PLL_M },
>> -    { .con_id = "pll_m_out1", .dt_id = TEGRA210_CLK_PLL_M_OUT1 },
>>      { .con_id = "pll_x", .dt_id = TEGRA210_CLK_PLL_X },
>>      { .con_id = "pll_x_out0", .dt_id = TEGRA210_CLK_PLL_X_OUT0 },
>>      { .con_id = "pll_u", .dt_id = TEGRA210_CLK_PLL_U },
>> @@ -2404,9 +2402,6 @@ static void __init tegra210_pll_init(void
>> __iomem *clk_base,
>>      clk_register_clkdev(clk, "pll_mb", NULL);
>>      clks[TEGRA210_CLK_PLL_MB] = clk;
>>
>> -    clk_register_clkdev(clk, "pll_m_out1", NULL);
>> -    clks[TEGRA210_CLK_PLL_M_OUT1] = clk;
>> -
>>      /* PLLM_UD */
>>      clk = clk_register_fixed_factor(NULL, "pll_m_ud", "pll_m",
>>                      CLK_SET_RATE_PARENT, 1, 1);
>>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
