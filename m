From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 21/24] PM / devfreq: tegra30: Synchronize average
 count on target's update
Date: Thu, 18 Jul 2019 19:15:54 +0900
Message-ID: <f83fb873-9214-9649-9435-9f211c4cba9e@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223619epcas4p3dea48e3e09983cd2a76af39fbf7bf99b@epcas4p3.samsung.com>
        <20190707223303.6755-22-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-22-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:33, Dmitry Osipenko wrote:
> The average count may get out of sync if interrupt was disabled / avoided
> for a long time due to upper watermark optimization, hence it should be
> re-synced on each target's update to ensure that watermarks are set up
> correctly on EMC rate-change notification and that a correct frequency
> is selected for device.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 4d582809acb6..8a674fad26be 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -466,11 +466,41 @@ static void actmon_isr_device(struct tegra_devfreq *tegra,
>  			      dev->boost_freq, cpufreq_get(0));
>  }
>  
> +static void tegra_devfreq_sync_avg_count(struct tegra_devfreq *tegra,
> +					 struct tegra_devfreq_device *dev)
> +{
> +	u32 avg_count, avg_freq, old_upper, new_upper;
> +
> +	avg_count = device_readl(dev, ACTMON_DEV_AVG_COUNT);
> +	avg_freq = avg_count / ACTMON_SAMPLING_PERIOD;
> +
> +	old_upper = tegra_actmon_upper_freq(tegra, dev->avg_freq);
> +	new_upper = tegra_actmon_upper_freq(tegra, avg_freq);
> +
> +	/* similar to ISR, see comments in actmon_isr_device() */
> +	if (old_upper != new_upper) {
> +		dev->avg_freq = avg_freq;
> +		dev->boost_freq = 0;
> +	}
> +}
> +
>  static unsigned long actmon_update_target(struct tegra_devfreq *tegra,
>  					  struct tegra_devfreq_device *dev)
>  {
>  	unsigned long target_freq;
>  
> +	/*
> +	 * The avg_count / avg_freq is getting snapshoted on device's
> +	 * interrupt, but there are cases where actual value need to
> +	 * be utilized on target's update, like CPUFreq boosting and
> +	 * overriding the min freq via /sys/class/devfreq/devfreq0/min_freq
> +	 * because we're optimizing the upper watermark based on the
> +	 * actual EMC frequency. This means that interrupt may be
> +	 * inactive for a long time and thus making snapshoted value
> +	 * outdated.
> +	 */
> +	tegra_devfreq_sync_avg_count(tegra, dev);

I think that you don't need to add the separate function to calculate
the 'dev->avg_freq'. It is enough with your detailed comment to add
this code in this function.

> +
>  	target_freq = min(dev->avg_freq + dev->boost_freq, KHZ_MAX);
>  	target_freq = tegra_actmon_account_cpu_freq(tegra, dev, target_freq);
>  
> 

And also, is it impossible to squash this patch with patch19/patch20?

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
