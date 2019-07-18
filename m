From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 18/24] PM / devfreq: tegra30: Optimize CPUFreq
 notifier
Date: Thu, 18 Jul 2019 18:48:42 +0900
Message-ID: <ce18694a-4281-a245-7bdf-299fedc3c724@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223618epcas4p48e1e2ae7af04775ac50c68b7636f1a56@epcas4p4.samsung.com>
        <20190707223303.6755-19-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-19-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> When CPU's memory activity is low or memory activity is high such that
> CPU's frequency contribution to the boosting is not taken into account,
> then there is no need to schedule devfreq's update. This eliminates
> unnecessary CPU activity during of idling caused by the scheduled work.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 73 +++++++++++++++++++++++++++----
>  1 file changed, 64 insertions(+), 9 deletions(-)

Patch4 add the 'cpufreq notifier' and this patch optimize the cpufreq notifier.
I think t hat you can combine two patches.

> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 43c9c5fbfe91..8d6bf6e9f1ae 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -216,10 +216,10 @@ static inline unsigned long do_percent(unsigned long val, unsigned int pct)
>  	return val * pct / 100;
>  }
>  
> -static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra)
> +static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
> +					    unsigned int cpu_freq)
>  {
>  	const struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
> -	unsigned int cpu_freq = cpufreq_get(0);
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
> @@ -239,15 +239,15 @@ tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
>  			      struct tegra_devfreq_device *dev,
>  			      unsigned long target_freq)
>  {
> -	unsigned long static_cpu_emc_freq;
> +	unsigned long cpu_emc_freq = 0;
>  
> -	if (dev->config->avg_dependency_threshold &&
> -	    dev->config->avg_dependency_threshold < dev->avg_freq) {
> -		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra);
> -		target_freq = max(target_freq, static_cpu_emc_freq);
> -	}
> +	if (!dev->config->avg_dependency_threshold)
> +		return target_freq;
>  
> -	return target_freq;
> +	if (dev->avg_freq > dev->config->avg_dependency_threshold)
> +		cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpufreq_get(0));
> +
> +	return max(target_freq, cpu_emc_freq);
>  }
>  
>  static unsigned long tegra_actmon_lower_freq(struct tegra_devfreq *tegra,
> @@ -531,16 +531,71 @@ static void tegra_actmon_delayed_update(struct work_struct *work)
>  	mutex_unlock(&tegra->devfreq->lock);
>  }
>  
> +static unsigned long
> +tegra_actmon_cpufreq_contribution(struct tegra_devfreq *tegra,
> +				  unsigned int cpu_freq)
> +{
> +	unsigned long freq, static_cpu_emc_freq;
> +
> +	/* check whether CPU's freq is taken into account at all */
> +	if (tegra->devices[MCCPU].avg_freq <=
> +	    tegra->devices[MCCPU].config->avg_dependency_threshold)
> +		return 0;
> +
> +	static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra, cpu_freq);
> +
> +	/* compare static CPU-EMC freq with MCALL */
> +	freq = tegra->devices[MCALL].avg_freq +
> +	       tegra->devices[MCALL].boost_freq;
> +
> +	freq = tegra_actmon_upper_freq(tegra, freq);
> +
> +	if (freq == tegra->max_freq || freq >= static_cpu_emc_freq)
> +		return 0;
> +
> +	/* compare static CPU-EMC freq with MCCPU */
> +	freq = tegra->devices[MCCPU].avg_freq +
> +	       tegra->devices[MCCPU].boost_freq;
> +
> +	freq = tegra_actmon_upper_freq(tegra, freq);
> +
> +	if (freq == tegra->max_freq || freq >= static_cpu_emc_freq)
> +		return 0;
> +
> +	return static_cpu_emc_freq;
> +}
> +
>  static int tegra_actmon_cpu_notify_cb(struct notifier_block *nb,
>  				      unsigned long action, void *ptr)
>  {
> +	struct cpufreq_freqs *freqs = ptr;
>  	struct tegra_devfreq *tegra;
> +	unsigned long old, new;
>  
>  	if (action != CPUFREQ_POSTCHANGE)
>  		return NOTIFY_OK;
>  
>  	tegra = container_of(nb, struct tegra_devfreq, cpu_rate_change_nb);
>  
> +	/*
> +	 * Quickly check whether CPU frequency should be taken into account
> +	 * at all, without blocking CPUFreq's core.
> +	 */
> +	if (mutex_trylock(&tegra->devfreq->lock)) {
> +		old = tegra_actmon_cpufreq_contribution(tegra, freqs->old);
> +		new = tegra_actmon_cpufreq_contribution(tegra, freqs->new);
> +		mutex_unlock(&tegra->devfreq->lock);
> +
> +		/*
> +		 * If CPU's frequency shouldn't be taken into account at
> +		 * the moment, then there is no need to update the devfreq's
> +		 * state because ISR will re-check CPU's frequency on the
> +		 * next interrupt.
> +		 */
> +		if (old == new)
> +			return NOTIFY_OK;
> +	}
> +
>  	/*
>  	 * CPUFreq driver should support CPUFREQ_ASYNC_NOTIFICATION in order
>  	 * to allow asynchronous notifications. This means we can't block
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
