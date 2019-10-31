From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 06/19] PM / devfreq: tegra30: Use kHz units uniformly
 in the code
Date: Fri, 1 Nov 2019 02:08:38 +0300
Message-ID: <f0f64310-e2b0-9b02-fc6e-ccc23054d3de@gmail.com>
References: <20191029220019.26773-1-digetx@gmail.com>
 <CGME20191029220734epcas1p42b635ee1c85a9480cecbaf7a1a41db25@epcas1p4.samsung.com>
 <20191029220019.26773-7-digetx@gmail.com>
 <a8ce6d98-26aa-b6eb-56ea-4bf960fc533d@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a8ce6d98-26aa-b6eb-56ea-4bf960fc533d@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

31.10.2019 07:44, Chanwoo Choi пишет:
> On 19. 10. 30. 오전 7:00, Dmitry Osipenko wrote:
>> Part of the code uses Hz units and the other kHz, let's switch to kHz
>> everywhere for consistency. A small benefit from this change (besides
>> code's cleanup) is that now powertop utility correctly displays devfreq's
>> stats, for some reason it expects them to be in kHz.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index 1d22f5239cd5..06c5376a7201 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -448,7 +448,7 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>>  	rate = dev_pm_opp_get_freq(opp);
>>  	dev_pm_opp_put(opp);
>>  
>> -	err = clk_set_min_rate(tegra->emc_clock, rate);
>> +	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
>>  	if (err)
>>  		return err;
>>  
>> @@ -477,7 +477,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>>  	stat->private_data = tegra;
>>  
>>  	/* The below are to be used by the other governors */
>> -	stat->current_frequency = cur_freq * KHZ;
>> +	stat->current_frequency = cur_freq;
>>  
>>  	actmon_dev = &tegra->devices[MCALL];
>>  
>> @@ -527,7 +527,7 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
>>  		target_freq = max(target_freq, dev->target_freq);
>>  	}
>>  
>> -	*freq = target_freq * KHZ;
>> +	*freq = target_freq;
>>  
>>  	return 0;
>>  }
>> @@ -663,7 +663,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  			goto remove_opps;
>>  		}
>>  
>> -		err = dev_pm_opp_add(&pdev->dev, rate, 0);
>> +		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
>>  		if (err) {
>>  			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
>>  			goto remove_opps;
>> @@ -686,7 +686,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>>  		goto unreg_notifier;
>>  	}
>>  
>> -	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
>> +	tegra_devfreq_profile.initial_freq = tegra->cur_freq;
>> +
>>  	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
>>  				     "tegra_actmon", NULL);
>>  	if (IS_ERR(devfreq)) {
>>
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> 

Thank you, looking forward to the comments to the rest of the patches.
Will be nice if this series could get ready for 5.5.
