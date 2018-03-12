From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 09/11] cpufreq: tegra124-cpufreq: extend to support
 Tegra210
Date: Mon, 12 Mar 2018 10:14:17 +0000
Message-ID: <50b05dda-4577-0c86-a8e5-eb7095ee1f59@nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-10-git-send-email-pdeschrijver@nvidia.com>
 <b7a25613-44b4-5e63-e8c7-91ce2b7cb56e@nvidia.com>
 <20180309081438.GO6190@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180309081438.GO6190@tbergstrom-lnx.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 09/03/18 08:14, Peter De Schrijver wrote:
> On Thu, Mar 08, 2018 at 11:25:04PM +0000, Jon Hunter wrote:
>>
>> On 06/02/18 16:34, Peter De Schrijver wrote:
>>> Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
>>> support in this driver. Also allow for the case where the CPU voltage is
>>> controlled directly by the DFLL rather than by a separate regulator object.
>>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> ---
>>>  drivers/cpufreq/tegra124-cpufreq.c | 15 ++++++++-------
>>>  1 file changed, 8 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
>>> index 4353025..f8e01a8 100644
>>> --- a/drivers/cpufreq/tegra124-cpufreq.c
>>> +++ b/drivers/cpufreq/tegra124-cpufreq.c
>>> @@ -64,7 +64,8 @@ static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
>>>  {
>>>  	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
>>>  	clk_disable_unprepare(priv->dfll_clk);
>>> -	regulator_sync_voltage(priv->vdd_cpu_reg);
>>> +	if (priv->vdd_cpu_reg)
>>> +		regulator_sync_voltage(priv->vdd_cpu_reg);
>>>  	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
>>>  }
>>>  
>>> @@ -89,10 +90,10 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>>  		return -ENODEV;
>>>  
>>>  	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
>>> -	if (IS_ERR(priv->vdd_cpu_reg)) {
>>> -		ret = PTR_ERR(priv->vdd_cpu_reg);
>>> -		goto out_put_np;
>>> -	}
>>> +	if (IS_ERR(priv->vdd_cpu_reg) != -EPROBE_DEFER)
>>> +		priv->vdd_cpu_reg = NULL;
>>> +	else
>>> +		return -EPROBE_DEFER;
>>
>> I am still not sure that we should rely on the fact that the regulator
>> is not present in DT to imply that we do not need it. I think that we
>> should be checking if we are using I2C mode here.
>>
> 
> The cpufreq driver doesn't know this however. Also the current approach of
> setting the same voltage when switching to pll_x is incorrect. The CVB
> tables when using pll_x include more margin than when using the DFLL.

Ah yes I see now. However, we are going to need to update the DT doc,
because 'vdd-cpu-supply' is listed as required.

Cheers
Jon

-- 
nvpublic
