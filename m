From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 6/6] cpufreq: tegra124-cpufreq: extend to support
 Tegra210
Date: Thu, 1 Feb 2018 09:53:43 +0000
Message-ID: <f91af7fd-6152-2f44-6e85-f1900356ab1f@nvidia.com>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
 <1516797938-32044-8-git-send-email-pdeschrijver@nvidia.com>
 <248eee6f-7f37-a5d1-8eff-116c3ef57751@nvidia.com>
 <20180201092520.GV7031@tbergstrom-lnx.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20180201092520.GV7031@tbergstrom-lnx.Nvidia.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org
List-Id: linux-tegra@vger.kernel.org


On 01/02/18 09:25, Peter De Schrijver wrote:
> On Wed, Jan 31, 2018 at 11:06:36AM +0000, Jon Hunter wrote:
>>
>> On 24/01/18 12:45, Peter De Schrijver wrote:
>>> Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
>>> support in this driver. Also allow for the case where the CPU voltage is
>>> controlled directly by the DFLL rather than by a separate regulator object.
>>>
>>> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
>>> ---
>>>  drivers/cpufreq/tegra124-cpufreq.c | 13 ++++++-------
>>>  1 file changed, 6 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
>>> index 4353025..d631dc4 100644
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
>>> @@ -89,10 +90,8 @@ static int tegra124_cpufreq_probe(struct platform_device *pdev)
>>>  		return -ENODEV;
>>>  
>>>  	priv->vdd_cpu_reg = regulator_get(cpu_dev, "vdd-cpu");
>>> -	if (IS_ERR(priv->vdd_cpu_reg)) {
>>> -		ret = PTR_ERR(priv->vdd_cpu_reg);
>>> -		goto out_put_np;
>>> -	}
>>> +	if (IS_ERR(priv->vdd_cpu_reg))
>>> +		priv->vdd_cpu_reg = NULL;
>>>  
>>
>> For Tegra124, don't we still want to return an error here?
> 
> Not necessarily. Also on Tegra124 the DFLL can use PWM and I think jetson TK1
> can be reworked to use this.

Seems to me that we should use DT or soc-data to specify which is being
used and then do the appropriate thing. I don't think that we should
assume that because the regulator is not present we are using PWM.

Cheers
Jon

-- 
nvpublic
