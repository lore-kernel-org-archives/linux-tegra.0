From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 01/20] clk: tegra: Modify tegra_audio_clk_init to accept
 more plls
Date: Thu, 7 May 2015 11:49:49 -0400
Message-ID: <554B899D.5020902@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-2-git-send-email-rklein@nvidia.com> <20150507151545.GB25866@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150507151545.GB25866-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/7/2015 11:15 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Mon, May 04, 2015 at 12:37:21PM -0400, Rhyland Klein wrote:
> [...]
>> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c
>> index 8237d16b4075..0d67efb3dd6a 100644
>> --- a/drivers/clk/tegra/clk-tegra114.c
>> +++ b/drivers/clk/tegra/clk-tegra114.c
>> @@ -935,6 +935,10 @@ static u32 mux_pllm_pllc2_c_c3_pllp_plla_idx[] = {
>>  	[0] = 0, [1] = 1, [2] = 2, [3] = 3, [4] = 4, [5] = 6,
>>  };
>>  
>> +static struct tegra_audio_clk_info tegra114_audio_plls[] = {
>> +	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
>> +};
>> +
>>  static struct clk **clks;
>>  
>>  static unsigned long osc_freq;
>> @@ -1483,7 +1487,8 @@ static void __init tegra114_clock_init(struct device_node *np)
>>  	tegra114_fixed_clk_init(clk_base);
>>  	tegra114_pll_init(clk_base, pmc_base);
>>  	tegra114_periph_clk_init(clk_base, pmc_base);
>> -	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks, &pll_a_params);
>> +	tegra_audio_clk_init(clk_base, pmc_base, tegra114_clks,
>> +			     &tegra114_audio_plls, 1);
> 
> This throws a build warning, it should be tegra114_audio_plls (without
> the ampersand). Also I think you should use ARRAY_SIZE() instead of
> hard-coding the number of entries here.

I swear I had changed those without the ampersand ... But yah ARRAY_SIZE
makes much more sense. Will change throughout...

> 
>>  	tegra_pmc_clk_init(pmc_base, tegra114_clks);
>>  	tegra_super_clk_gen4_init(clk_base, pmc_base, tegra114_clks,
>>  					&pll_x_params);
>> diff --git a/drivers/clk/tegra/clk-tegra124.c b/drivers/clk/tegra/clk-tegra124.c
>> index 11f857cd5f6a..169e236f3627 100644
>> --- a/drivers/clk/tegra/clk-tegra124.c
>> +++ b/drivers/clk/tegra/clk-tegra124.c
>> @@ -1413,6 +1413,10 @@ static struct tegra_clk_init_table tegra132_init_table[] __initdata = {
>>  	{TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0},
>>  };
>>  
>> +static struct tegra_audio_clk_info tegra124_audio_plls[] = {
>> +	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
>> +};
>> +
>>  /**
>>   * tegra124_clock_apply_init_table - initialize clocks on Tegra124 SoCs
>>   *
>> @@ -1489,7 +1493,8 @@ static void __init tegra124_132_clock_init_pre(struct device_node *np)
>>  	tegra_fixed_clk_init(tegra124_clks);
>>  	tegra124_pll_init(clk_base, pmc_base);
>>  	tegra124_periph_clk_init(clk_base, pmc_base);
>> -	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks, &pll_a_params);
>> +	tegra_audio_clk_init(clk_base, pmc_base, tegra124_clks,
>> +			     tegra124_audio_plls, 1);
> 
> ARRAY_SIZE() here as well. The ampersand isn't there in this case...
> 
>>  	tegra_pmc_clk_init(pmc_base, tegra124_clks);
>>  
>>  	/* For Tegra124 & Tegra132, PLLD is the only source for DSIA & DSIB */
>> diff --git a/drivers/clk/tegra/clk-tegra30.c b/drivers/clk/tegra/clk-tegra30.c
>> index 4b26509fc218..3198c7b7946c 100644
>> --- a/drivers/clk/tegra/clk-tegra30.c
>> +++ b/drivers/clk/tegra/clk-tegra30.c
>> @@ -1406,6 +1406,10 @@ static const struct of_device_id pmc_match[] __initconst = {
>>  	{},
>>  };
>>  
>> +static struct tegra_audio_clk_info tegra30_audio_plls[] = {
>> +	{ "pll_a", &pll_a_params, tegra_clk_pll_a, "pll_p_out1" },
>> +};
>> +
>>  static void __init tegra30_clock_init(struct device_node *np)
>>  {
>>  	struct device_node *node;
>> @@ -1443,7 +1447,8 @@ static void __init tegra30_clock_init(struct device_node *np)
>>  	tegra30_pll_init();
>>  	tegra30_super_clk_init();
>>  	tegra30_periph_clk_init();
>> -	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks, &pll_a_params);
>> +	tegra_audio_clk_init(clk_base, pmc_base, tegra30_clks,
>> +			     &tegra30_audio_plls, 1);
> 
> Same comments as for Tegra114.
> 
>> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> [...]
>> @@ -607,7 +622,8 @@ void tegra_register_devclks(struct tegra_devclk *dev_clks, int num);
>>  
>>  void tegra_audio_clk_init(void __iomem *clk_base,
>>  			void __iomem *pmc_base, struct tegra_clk *tegra_clks,
>> -			struct tegra_clk_pll_params *pll_params);
>> +			struct tegra_audio_clk_info *audio_info,
>> +			int num_plls);
> 
> Oh, and make num_plls unsigned int, please.

Will do!

Thanks,
Rhyland

> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
> 


-- 
nvpublic
