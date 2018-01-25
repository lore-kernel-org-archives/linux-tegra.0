From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v3 3/4] clk: tegra: MBIST work around for Tegra210
Date: Thu, 25 Jan 2018 10:19:08 +0000
Message-ID: <a161a11c-1794-ebc4-3ff0-7624c23cabdb@nvidia.com>
References: <1516699369-3513-1-git-send-email-pdeschrijver@nvidia.com>
 <1516699369-3513-4-git-send-email-pdeschrijver@nvidia.com>
 <637b3bb4-1ac0-5612-ec2e-5740e611b11a@nvidia.com>
 <20180125090255.GK7031@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20180125090255.GK7031-Rysk9IDjsxmJz7etNGeUX8VPkgjIgRvpAL8bYrjMMd8@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 25/01/18 09:02, Peter De Schrijver wrote:
> On Wed, Jan 24, 2018 at 09:59:56PM +0000, Jon Hunter wrote:

...

>>> +void tegra210_clk_handle_mbist_war(unsigned int id)
>>> +{
>>> +	int err;
>>> +	struct tegra210_domain_mbist_war *mbist_war;
>>> +
>>> +	if (id >= ARRAY_SIZE(tegra210_pg_mbist_war)) {
>>> +		WARN(1, "unknown domain id in MBIST WAR handler\n");
>>> +		return;
>>> +	}
>>> +
>>> +	mbist_war = &tegra210_pg_mbist_war[id];
>>> +	if (!mbist_war->handle_lvl2_ovr)
>>> +		return;
>>> +
>>> +	err = mbist_war->handle_lvl2_ovr(mbist_war);
>>
>> Why not move the clk_bulk_prepare_enable/disable_unprepare and
>> mutex_lock/unlock functions into this function around the call to
>> ->handle_lvl2_ovr to save the duplication of that code in each of the
>> war functions?
>>
> 
> This could be done yes.
> 
>>> +	WARN(err < 0, "error handling MBIST WAR for domain: %d\n", id);
>>> +}
>>
>> I think that the above function should return an error and we should let
>> the power-domain power-on fail.
>>
> 
> This would only be useful if the user (tegra_powergate_power_up) would do
> rollback. I don't think that's done correctly today.

It does and so I think that we should return an error.

>>> +
>>> +
>>>  void tegra210_put_utmipll_in_iddq(void)
>>>  {
>>>  	u32 reg;
>>> @@ -3163,6 +3500,40 @@ static int tegra210_reset_deassert(unsigned long id)
>>>  	return 0;
>>>  }
>>>  
>>> +static void tegra210_mbist_clk_init(void)
>>> +{
>>> +	int i, j;
>>> +
>>> +	for (i = 0; i < ARRAY_SIZE(tegra210_pg_mbist_war); i++) {
>>> +		int num_clks = tegra210_pg_mbist_war[i].num_clks;
>>> +		struct clk_bulk_data *clk_data;
>>> +
>>> +		if (!num_clks)
>>> +			continue;
>>> +
>>> +		clk_data = kmalloc_array(num_clks, sizeof(*clk_data),
>>> +					 GFP_KERNEL);
>>> +		if (WARN(!clk_data,
>>> +			"no space for MBIST WAR clk array for %d\n", i)) {
>>> +			tegra210_pg_mbist_war[i].handle_lvl2_ovr = NULL;
>>> +			continue;
>>> +		}
>>
>> Printing error messages on memory allocation failures are not needed and
>> have been removed from various drivers. So lets no add any error
>> messages or warnings here.
>>
>> Also I think that we should just return an error here and not bother
>> continuing as there is no point.

So maybe here just ...

		if (WARN_ON(!clk_data))
			return -ENOMEM;

>>> +
>>> +		tegra210_pg_mbist_war[i].clks = clk_data;
>>
>> I think that you should only populate this when all the clocks have been
>> initialised correctly. You could then use this to check the clocks have
>> been setup correctly when executing the war.
>>
> 
> For some domains no extra clocks are needed (ie the clocks enabled by the
> power domain driver are enough). So an extra flag would be needed then.

Yes but you have num_clks to detect if a domain has extra clocks. So you
can use both of these to detect if the clocks are setup correctly. Right?

>>> +		for (j = 0; j < num_clks; j++) {
>>> +			int clk_id = tegra210_pg_mbist_war[i].clk_init_data[j];
>>> +			struct clk *clk = clks[clk_id];
>>> +
>>> +			if (IS_ERR(clk)) {
>>> +				clk_data[j].clk = NULL;
>>> +				WARN(1, "clk_id: %d\n", clk_id);
>>
>> I think that we should return an error here.
>>
> 
> I don't think letting clock init fail because of this, is a good idea. Too
> many things rely on working clocks.

It should never fail and if it does something is badly broken.

Maybe what we could do ...

			if (WARN_ON(IS_ERR(clk))) {
				tegra210_pg_mbist_war[i].clks = NULL;
				break;
			}

			clk_data[j].clk = clk;

Then we can check in tegra210_clk_handle_mbist_war() ...

	if (mbist_war->num_clks && !mbist_war.clks)
		return -ENODEV;

Does that work?

>>> +			} else {
>>> +				clk_data[j].clk = clk;
>>> +			}
>>> +		}
>>> +	}
>>> +}
>>> +
>>>  /**
>>>   * tegra210_clock_init - Tegra210-specific clock initialization
>>>   * @np: struct device_node * of the DT node for the SoC CAR IP block
>>> @@ -3197,6 +3568,24 @@ static void __init tegra210_clock_init(struct device_node *np)
>>>  		return;
>>>  	}
>>>  
>>> +	ape_base = ioremap(TEGRA210_APE_BASE, 256*1024);
>>> +	if (!ape_base) {
>>> +		pr_err("ioremap tegra210 APE failed\n");
>>> +		return;
>>> +	}
>>> +
>>> +	dispa_base = ioremap(TEGRA210_DISPA_BASE, 256*1024);
>>> +	if (!dispa_base) {
>>> +		pr_err("ioremap tegra210 DISPA failed\n");
>>> +		return;
>>> +	}
>>> +
>>> +	vic_base = ioremap(TEGRA210_VIC_BASE, 256*1024);
>>> +	if (!vic_base) {
>>> +		pr_err("ioremap tegra210 VIC failed\n");
>>> +		return;
>>> +	}
>>> +
>>>  	clks = tegra_clk_init(clk_base, TEGRA210_CLK_CLK_MAX,
>>>  			      TEGRA210_CAR_BANK_COUNT);
>>>  	if (!clks)
>>> @@ -3233,6 +3622,8 @@ static void __init tegra210_clock_init(struct device_node *np)
>>>  	tegra_add_of_provider(np);
>>>  	tegra_register_devclks(devclks, ARRAY_SIZE(devclks));
>>>  
>>> +	tegra210_mbist_clk_init();
>>> +
>>
>> Maybe add a print here if the mbist init fails and return. I understand
>> it may not be a critical failure but it should never fail.
>>
> 
> You mean have the entire clock init fail and undo all the clock registrations?
> That seems overkill to me. Returning early would only prevent some sleep states
> from working because tegra_cpu_car_ops will not be initialized then. So I would
> do a warning then.

I don't think it is necessary to undo it. Ok, don't worry about
returning an error here, the warnings should be sufficient.

Cheers
Jon

-- 
nvpublic
