From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 09/19] PM / devfreq: tegra30: Use kHz units uniformly
 in the code
Date: Wed, 2 Oct 2019 08:29:55 +0900
Message-ID: <2b65c78a-4b8f-661b-dd9c-29b3cbf0844f@samsung.com>
References: <20190811212315.12689-1-digetx@gmail.com>
        <CGME20190811212545epcas4p4132cb98ef69ef04136fda4030bd64f92@epcas4p4.samsung.com>
        <20190811212315.12689-10-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-10-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 8. 12. 오전 6:23, Dmitry Osipenko wrote:
> Now that all kHz-conversion related bugs are fixed, we can use the kHz
> uniformly. This makes code cleaner and avoids integer divisions in the
> code, which is useful in a case of Tegra30 that has Cortex A9 CPU that
> doesn't support integer division instructions, hence all divisions are
> actually made in software mode. Another small benefit from this change
> is that now powertop utility correctly displays devfreq's stats, for
> some reason it expects them to be in kHz.

If possible, please specify the benefit result on patch description.

And I have a question. Why do you fix the KHz-conversion issue on one patch?
Actually, in my case, it is difficult to understand that multiple patches
try to fix the KHz-conversion issue. I think that it is possible to
make one patch.

And, 
On these series, some codes wad added and then these codes are deleted
on later patch. It looks like that you made the issue and then you fix
the issue by yourself. I think that it is not proper.
Even if you developed the patches on your local environment sequentially
according to the sequence of your issue detection, you better to do
refactoring the patches.

Frankly, I cannot agree that some codes wad added on front patch
and then added codes are deleted on later patch in the same patchset.


> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 81 +++++++++++++++++++------------
>  1 file changed, 49 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index ca499368ee81..43d50b4366dd 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -137,8 +137,11 @@ struct tegra_devfreq_device {
>  	const struct tegra_devfreq_device_config *config;
>  	void __iomem *regs;
>  
> -	/* Average event count sampled in the last interrupt */
> -	u32 avg_count;
> +	/*
> +	 * Average event count sampled in the last interrupt and converted
> +	 * to frequency value.
> +	 */
> +	u32 avg_freq;
>  
>  	/*
>  	 * Extra frequency to increase the target by due to consecutive
> @@ -222,6 +225,14 @@ static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra)
>  	return 0;
>  }
>  
> +static unsigned long
> +tegra_actmon_dev_avg_dependency_freq(struct tegra_devfreq *tegra,
> +				     struct tegra_devfreq_device *dev)
> +{
> +	return dev->config->avg_dependency_threshold /
> +		ACTMON_SAMPLING_PERIOD;
> +}
> +
>  static unsigned long
>  tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
>  			      struct tegra_devfreq_device *dev,
> @@ -229,13 +240,15 @@ tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
>  {
>  	unsigned long static_cpu_emc_freq;
>  
> -	if (dev->config->avg_dependency_threshold &&
> -	    dev->config->avg_dependency_threshold < dev->avg_count) {
> +	if (!dev->config->avg_dependency_threshold)
> +		return target_freq;
> +
> +	if (dev->avg_freq > tegra_actmon_dev_avg_dependency_freq(tegra, dev))
>  		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra);
> -		target_freq = max(target_freq, static_cpu_emc_freq);
> -	}
> +	else
> +		static_cpu_emc_freq = 0;
>  
> -	return target_freq;
> +	return max(target_freq, static_cpu_emc_freq);
>  }
>  
>  static unsigned long tegra_actmon_lower_freq(struct tegra_devfreq *tegra,
> @@ -261,7 +274,7 @@ static unsigned long tegra_actmon_upper_freq(struct tegra_devfreq *tegra,
>  
>  	opp = dev_pm_opp_find_freq_ceil(tegra->devfreq->dev.parent, &upper);
>  	if (IS_ERR(opp))
> -		upper = ULONG_MAX;
> +		upper = KHZ_MAX;
>  	else
>  		dev_pm_opp_put(opp);
>  
> @@ -280,15 +293,12 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
>  	 * range in a case where target_freq falls into a range of
>  	 * next_possible_opp_freq - 1MHz.
>  	 */
> -	target_freq = round_down(target_freq, 1000000);

This line was added on patch5. I think that you could fix the KHz-conversion
on patch5 instead of this patch. It is not good way to make the patches.
Because some codes wad added and then these codes are deleted on later patch.

It looks like that you made the issue and then you fix the issue by yourself.
It is difficult to make me to decide this patch is either proper or not.

> +	target_freq = round_down(target_freq, 1000);
>  
>  	/* watermarks are set at the borders of the corresponding OPPs */
>  	*lower = tegra_actmon_lower_freq(tegra, target_freq);
>  	*upper = tegra_actmon_upper_freq(tegra, target_freq);
>  
> -	*lower /= KHZ;
> -	*upper /= KHZ;
> -
>  	/*
>  	 * The upper watermark should take into account CPU's frequency
>  	 * because cpu_to_emc_rate() may override the target_freq with
> @@ -304,10 +314,11 @@ static void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra,
>  static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>  					   struct tegra_devfreq_device *dev)
>  {
> -	unsigned long lower, upper, freq;
> +	unsigned long avg_dependency_freq, lower, upper;
> +
> +	tegra_actmon_get_lower_upper(tegra, dev, dev->avg_freq, &lower, &upper);
>  
> -	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
> -	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
> +	avg_dependency_freq = tegra_actmon_dev_avg_dependency_freq(tegra, dev);
>  
>  	/*
>  	 * We want to get interrupts when MCCPU client crosses the
> @@ -316,7 +327,7 @@ static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
>  	 */
>  	if (lower < dev->config->avg_dependency_threshold &&
>  	    upper > dev->config->avg_dependency_threshold) {
> -		if (dev->avg_count < dev->config->avg_dependency_threshold)
> +		if (dev->avg_freq < avg_dependency_freq)
>  			upper = dev->config->avg_dependency_threshold;
>  		else
>  			lower = dev->config->avg_dependency_threshold;
> @@ -358,8 +369,7 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>  	 * device. Once that mark is hit and boosting is stopped, the
>  	 * interrupt is disabled by ISR.
>  	 */
> -	freq = dev->avg_count / ACTMON_SAMPLING_PERIOD * KHZ;
> -	tegra_actmon_get_lower_upper(tegra, dev, freq, &lower, &upper);
> +	tegra_actmon_get_lower_upper(tegra, dev, dev->avg_freq, &lower, &upper);

Also, patch5 newly defined this function and then you edit the function prototype
of this function. It is not proper way.

>  
>  	delta = do_percent(upper - lower, dev->config->boost_down_threshold);
>  	device_writel(dev, lower + delta, ACTMON_DEV_LOWER_WMARK);
> @@ -368,12 +378,14 @@ static void tegra_devfreq_update_wmark(struct tegra_devfreq *tegra,
>  static void actmon_isr_device(struct tegra_devfreq *tegra,
>  			      struct tegra_devfreq_device *dev)
>  {
> -	u32 intr_status, dev_ctrl, avg_intr_mask;
> +	u32 intr_status, dev_ctrl, avg_intr_mask, avg_count;
>  
> -	dev->avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
>  	intr_status = device_readl(dev, ACTMON_DEV_INTR_STATUS);
> +	avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
>  	dev_ctrl = device_readl(dev, ACTMON_DEV_CTRL);
>  
> +	dev->avg_freq = avg_count / ACTMON_SAMPLING_PERIOD;
> +
>  	avg_intr_mask = ACTMON_DEV_INTR_AVG_BELOW_WMARK |
>  			ACTMON_DEV_INTR_AVG_ABOVE_WMARK;
>  
> @@ -427,7 +439,7 @@ static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
>  {
>  	unsigned long target_freq;
>  
> -	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD + dev->boost_freq;
> +	target_freq = dev->avg_freq + dev->boost_freq;
>  	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
>  
>  	return min(target_freq, tegra->max_freq);
> @@ -464,6 +476,7 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  	struct clk_notifier_data *data = ptr;
>  	struct tegra_devfreq_device *dev;
>  	struct tegra_devfreq *tegra;
> +	unsigned long freq;
>  	unsigned int i;
>  
>  	if (action != POST_RATE_CHANGE)
> @@ -471,6 +484,8 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  
>  	tegra = container_of(nb, struct tegra_devfreq, rate_change_nb);
>  
> +	freq = data->new_rate / KHZ;
> +
>  	/*
>  	 * EMC rate could change due to three reasons:
>  	 *
> @@ -492,7 +507,7 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  		dev = &tegra->devices[i];
>  
>  		tegra_devfreq_update_avg_wmark(tegra, dev);
> -		tegra_devfreq_update_wmark(tegra, dev, data->new_rate);
> +		tegra_devfreq_update_wmark(tegra, dev, freq);
>  	}
>  
>  	return NOTIFY_OK;
> @@ -501,14 +516,14 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  					  struct tegra_devfreq_device *dev)
>  {
> -	u32 val = 0, target_freq;
> +	u32 val = 0;
>  
> -	target_freq = clk_get_rate(tegra->emc_clock) / KHZ;
> -	dev->avg_count = target_freq * ACTMON_SAMPLING_PERIOD;
> -	device_writel(dev, dev->avg_count, ACTMON_DEV_INIT_AVG);
> +	dev->avg_freq = clk_get_rate(tegra->emc_clock) / KHZ;
> +	device_writel(dev, dev->avg_freq * ACTMON_SAMPLING_PERIOD,
> +		      ACTMON_DEV_INIT_AVG);
>  
>  	tegra_devfreq_update_avg_wmark(tegra, dev);
> -	tegra_devfreq_update_wmark(tegra, dev, target_freq);
> +	tegra_devfreq_update_wmark(tegra, dev, dev->avg_freq);
>  
>  	device_writel(dev, ACTMON_COUNT_WEIGHT, ACTMON_DEV_COUNT_WEIGHT);
>  	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
> @@ -572,7 +587,7 @@ static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
>  	rate = dev_pm_opp_get_freq(opp);
>  	dev_pm_opp_put(opp);
>  
> -	err = clk_set_min_rate(tegra->emc_clock, rate);
> +	err = clk_set_min_rate(tegra->emc_clock, rate * KHZ);
>  	if (err)
>  		return err;
>  
> @@ -595,7 +610,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  	struct tegra_devfreq_device *actmon_dev;
>  	unsigned long cur_freq;
>  
> -	cur_freq = clk_get_rate(tegra->emc_clock);
> +	cur_freq = clk_get_rate(tegra->emc_clock) / KHZ;
>  
>  	/* To be used by the tegra governor */
>  	stat->private_data = tegra;
> @@ -612,7 +627,7 @@ static int tegra_devfreq_get_dev_status(struct device *dev,
>  	stat->busy_time *= 100 / BUS_SATURATION_RATIO;
>  
>  	/* Number of cycles in a sampling period */
> -	stat->total_time = cur_freq / KHZ * ACTMON_SAMPLING_PERIOD;
> +	stat->total_time = cur_freq * ACTMON_SAMPLING_PERIOD;
>  
>  	stat->busy_time = min(stat->busy_time, stat->total_time);
>  
> @@ -652,7 +667,7 @@ static int tegra_governor_get_target(struct devfreq *devfreq,
>  		target_freq = max(target_freq, dev_target_freq);
>  	}
>  
> -	*freq = target_freq * KHZ;
> +	*freq = target_freq;
>  
>  	return 0;
>  }
> @@ -787,7 +802,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  			goto remove_opps;
>  		}
>  
> -		err = dev_pm_opp_add(&pdev->dev, rate, 0);
> +		err = dev_pm_opp_add(&pdev->dev, rate / KHZ, 0);
>  		if (err) {
>  			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
>  			goto remove_opps;
> @@ -812,6 +827,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
> +	tegra_devfreq_profile.initial_freq /= KHZ;
> +
>  	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
>  				     "tegra_actmon", NULL);
>  	if (IS_ERR(devfreq)) {
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
