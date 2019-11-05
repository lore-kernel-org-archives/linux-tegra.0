From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v9 15/19] PM / devfreq: tegra30: Use kHz units for
 dependency threshold
Date: Tue, 5 Nov 2019 13:02:48 +0900
Message-ID: <503e756b-4bed-2cd9-a167-2cabfd739fc3@samsung.com>
References: <20191104215617.25544-1-digetx@gmail.com>
        <CGME20191104221911epcas1p1ad970858ae85cddbb3961b1c7a727315@epcas1p1.samsung.com>
        <20191104215617.25544-16-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191104215617.25544-16-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 11. 5. 오전 6:56, Dmitry Osipenko wrote:
> The dependency threshold designates a memory activity level below which
> CPU's frequency isn't accounted. Currently the threshold is given in
> "memory cycle" units and that value depends on the polling interval which
> is fixed to 12ms in the driver. Later on we'd want to add support for a
> variable polling interval and thus the threshold value either needs to be
> scaled in accordance to the polling interval or it needs to be represented
> in a units that do not depend on the polling interval.
> 
> It is nicer to have threshold value being defined independently of the
> polling interval, thus this patch converts the dependency threshold units
> from "cycle" to "kHz". Having this change as a separate-preparatory patch
> will make easier to follow further patches.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 30 +++++++++++++++++-------------
>  1 file changed, 17 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 852bde6249c7..3bd920829bfd 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -96,9 +96,10 @@ struct tegra_devfreq_device_config {
>  	unsigned int	boost_down_threshold;
>  
>  	/*
> -	 * Threshold of activity (cycles) below which the CPU frequency isn't
> -	 * to be taken into account. This is to avoid increasing the EMC
> -	 * frequency when the CPU is very busy but not accessing the bus often.
> +	 * Threshold of activity (cycles translated to kHz) below which the
> +	 * CPU frequency isn't to be taken into account. This is to avoid
> +	 * increasing the EMC frequency when the CPU is very busy but not
> +	 * accessing the bus often.
>  	 */
>  	u32		avg_dependency_threshold;
>  };
> @@ -126,7 +127,7 @@ static const struct tegra_devfreq_device_config actmon_device_configs[] = {
>  		.boost_down_coeff = 90,
>  		.boost_up_threshold = 27,
>  		.boost_down_threshold = 10,
> -		.avg_dependency_threshold = 50000,
> +		.avg_dependency_threshold = 16000, /* 16MHz in kHz units */
>  	},
>  };
>  
> @@ -311,7 +312,6 @@ static unsigned long actmon_device_target_freq(struct tegra_devfreq *tegra,
>  	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD;
>  	avg_sustain_coef = 100 * 100 / dev->config->boost_up_threshold;
>  	target_freq = do_percent(target_freq, avg_sustain_coef);
> -	target_freq += dev->boost_freq;
>  
>  	return target_freq;
>  }
> @@ -322,15 +322,18 @@ static void actmon_update_target(struct tegra_devfreq *tegra,
>  	unsigned long cpu_freq = 0;
>  	unsigned long static_cpu_emc_freq = 0;
>  
> -	if (dev->config->avg_dependency_threshold) {
> +	dev->target_freq = actmon_device_target_freq(tegra, dev);
> +
> +	if (dev->config->avg_dependency_threshold &&
> +	    dev->config->avg_dependency_threshold <= dev->target_freq) {
>  		cpu_freq = cpufreq_quick_get(0);
>  		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
> -	}
>  
> -	dev->target_freq = actmon_device_target_freq(tegra, dev);
> -
> -	if (dev->avg_count >= dev->config->avg_dependency_threshold)
> +		dev->target_freq += dev->boost_freq;
>  		dev->target_freq = max(dev->target_freq, static_cpu_emc_freq);
> +	} else {
> +		dev->target_freq += dev->boost_freq;
> +	}
>  }
>  
>  static irqreturn_t actmon_thread_isr(int irq, void *data)
> @@ -396,15 +399,16 @@ static unsigned long
>  tegra_actmon_cpufreq_contribution(struct tegra_devfreq *tegra,
>  				  unsigned int cpu_freq)
>  {
> +	struct tegra_devfreq_device *actmon_dev = &tegra->devices[MCCPU];
>  	unsigned long static_cpu_emc_freq, dev_freq;
>  
> +	dev_freq = actmon_device_target_freq(tegra, actmon_dev);
> +
>  	/* check whether CPU's freq is taken into account at all */
> -	if (tegra->devices[MCCPU].avg_count <
> -	    tegra->devices[MCCPU].config->avg_dependency_threshold)
> +	if (dev_freq < actmon_dev->config->avg_dependency_threshold)
>  		return 0;
>  
>  	static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
> -	dev_freq = actmon_device_target_freq(tegra, &tegra->devices[MCCPU]);
>  
>  	if (dev_freq >= static_cpu_emc_freq)
>  		return 0;
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
