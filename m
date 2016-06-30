From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC PATCH 1/3] soc/tegra: pmc: Initialise power partitions early
Date: Thu, 30 Jun 2016 11:20:29 +0100
Message-ID: <5774F26D.5050008@nvidia.com>
References: <1467112844-26927-1-git-send-email-jonathanh@nvidia.com>
 <1467112844-26927-2-git-send-email-jonathanh@nvidia.com>
 <20160630101732.GG1776@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160630101732.GG1776-EkSeR96xj6Pcmrwk2tT4+A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 30/06/16 11:17, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
> On Tue, Jun 28, 2016 at 12:20:42PM +0100, Jon Hunter wrote:
>> If CONFIG_PM_GENERIC_DOMAINS is not enabled, then power partitions
>> associated with a device will not be enabled automatically by the PM
>> core when the device is in use. To avoid situations where a device in
>> a power partition is to be used but the partition is not enabled,
>> initialise the power partitions for Tegra early in the boot process and
>> if CONFIG_PM_GENERIC_DOMAINS is not enabled, then power on all
>> partitions defined in the device-tree blob.
>>
>> Note that if CONFIG_PM_GENERIC_DOMAINS is not enabled, after the
>> partitions are turned on, the clocks and resets used as part of the
>> sequence for turning on the partition are released again as they are no
>> longer needed by the PMC driver. Another benefit of this is that this
>> avoids any issues of sharing resets between the PMC driver and other
>> device drivers that may wish to independently control a particular
>> reset.
>>
>> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>  drivers/soc/tegra/pmc.c | 33 ++++++++++++++++++++++-----------
>>  1 file changed, 22 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
>> index 1f702538f8ec..64678ff2173e 100644
>> --- a/drivers/soc/tegra/pmc.c
>> +++ b/drivers/soc/tegra/pmc.c
>> @@ -788,7 +788,7 @@ error:
>>  static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
>>  {
>>  	struct tegra_powergate *pg;
>> -	bool off;
>> +	bool off, err = true;
>>  	int id;
>>  
>>  	pg = kzalloc(sizeof(*pg), GFP_KERNEL);
>> @@ -819,6 +819,9 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
>>  	if (tegra_powergate_of_get_resets(pg, np, off))
>>  		goto remove_clks;
>>  
>> +	if (!IS_ENABLED(CONFIG_PM_GENERIC_DOMAINS))
>> +		goto power_on_cleanup;
>> +
>>  	pm_genpd_init(&pg->genpd, NULL, off);
>>  
>>  	if (of_genpd_add_provider_simple(np, &pg->genpd))
>> @@ -828,6 +831,11 @@ static void tegra_powergate_add(struct tegra_pmc *pmc, struct device_node *np)
>>  
>>  	return;
>>  
>> +power_on_cleanup:
>> +	if (off)
>> +		WARN_ON(tegra_powergate_power_up(pg, true));
>> +	err = false;
>> +
>>  remove_resets:
>>  	while (pg->num_resets--)
>>  		reset_control_put(pg->resets[pg->num_resets]);
>> @@ -845,14 +853,23 @@ free_mem:
>>  	kfree(pg);
>>  
>>  error:
>> -	dev_err(pmc->dev, "failed to create power domain for %s\n", np->name);
>> +	if (err)
>> +		dev_err(pmc->dev, "failed to configure partition %s\n",
>> +			np->name);
> 
> This is beginning to look very spaghetti-like. Do we really need the
> error message here? Could we instead add more explicit error messages
> before the gotos above?

Yes I can't say I loved it either. Ok, yes will add more specific error
messages above gotos instead.

Cheers
Jon

-- 
nvpublic
