From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 11/19] PM / devfreq: tegra30: Use CPUFreq notifier
Date: Wed, 2 Oct 2019 09:02:30 +0900
Message-ID: <2f7a0283-7433-b786-a8c3-7d711aafd721@samsung.com>
References: <20190811212315.12689-1-digetx@gmail.com>
        <CGME20190811212534epcas4p415e9206019385d2bfb3be2c7a328a8df@epcas4p4.samsung.com>
        <20190811212315.12689-12-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-12-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On 19. 8. 12. 오전 6:23, Dmitry Osipenko wrote:
> The CPU's client need to take into account that CPUFreq may change
> while memory activity not, staying high. Thus an appropriate frequency
> notifier should be used in addition to the clk-notifier.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 173 ++++++++++++++++++++++++++----
>  1 file changed, 153 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index a2623de56d20..a260812f7744 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -17,6 +17,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_opp.h>
>  #include <linux/reset.h>
> +#include <linux/workqueue.h>
>  
>  #include "governor.h"
>  
> @@ -34,6 +35,8 @@
>  #define ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN		BIT(30)
>  #define ACTMON_DEV_CTRL_ENB					BIT(31)
>  
> +#define ACTMON_DEV_CTRL_STOP					0x00000000
> +
>  #define ACTMON_DEV_UPPER_WMARK					0x4
>  #define ACTMON_DEV_LOWER_WMARK					0x8
>  #define ACTMON_DEV_INIT_AVG					0xc
> @@ -159,7 +162,10 @@ struct tegra_devfreq {
>  
>  	struct clk		*emc_clock;
>  	unsigned long		max_freq;
> -	struct notifier_block	rate_change_nb;
> +	struct notifier_block	clk_rate_change_nb;
> +
> +	struct delayed_work	cpufreq_update_work;
> +	struct notifier_block	cpu_rate_change_nb;
>  
>  	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
>  
> @@ -207,10 +213,10 @@ static unsigned long do_percent(unsigned long val, unsigned int pct)
>  	return val * pct / 100;
>  }
>  
> -static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra)
> +static unsigned long actmon_cpu_to_emc_rate(struct tegra_devfreq *tegra,
> +					    unsigned int cpu_freq)
>  {
>  	struct tegra_actmon_emc_ratio *ratio = actmon_emc_ratios;
> -	unsigned int cpu_freq = cpufreq_quick_get(0);
>  	unsigned int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(actmon_emc_ratios); i++, ratio++) {
> @@ -244,7 +250,8 @@ tegra_actmon_account_cpu_freq(struct tegra_devfreq *tegra,
>  		return target_freq;
>  
>  	if (dev->avg_freq > tegra_actmon_dev_avg_dependency_freq(tegra, dev))
> -		static_cpu_emc_freq = actmon_cpu_to_emc_rate(tegra);
> +		static_cpu_emc_freq = actmon_cpu_to_emc_rate(
> +						tegra, cpufreq_quick_get(0));
>  	else
>  		static_cpu_emc_freq = 0;
>  
> @@ -543,8 +550,8 @@ static irqreturn_t actmon_thread_isr(int irq, void *data)
>  	return handled ? IRQ_HANDLED : IRQ_NONE;
>  }
>  
> -static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
> -				       unsigned long action, void *ptr)
> +static int tegra_actmon_clk_notify_cb(struct notifier_block *nb,
> +				      unsigned long action, void *ptr)
>  {
>  	struct clk_notifier_data *data = ptr;
>  	struct tegra_devfreq_device *dev;
> @@ -555,7 +562,7 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  	if (action != POST_RATE_CHANGE)
>  		return NOTIFY_OK;
>  
> -	tegra = container_of(nb, struct tegra_devfreq, rate_change_nb);
> +	tegra = container_of(nb, struct tegra_devfreq, clk_rate_change_nb);
>  
>  	freq = data->new_rate / KHZ;
>  
> @@ -586,6 +593,94 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>  
> +static void tegra_actmon_delayed_update(struct work_struct *work)
> +{
> +	struct tegra_devfreq *tegra = container_of(work, struct tegra_devfreq,
> +						   cpufreq_update_work.work);
> +
> +	mutex_lock(&tegra->devfreq->lock);
> +	update_devfreq(tegra->devfreq);
> +	mutex_unlock(&tegra->devfreq->lock);
> +}
> +
> +static unsigned long
> +tegra_actmon_cpufreq_contribution(struct tegra_devfreq *tegra,
> +				  unsigned int cpu_freq)
> +{
> +	unsigned long freq, static_cpu_emc_freq;
> +
> +	/* check whether CPU's freq is taken into account at all */
> +	freq = tegra_actmon_dev_avg_dependency_freq(tegra,
> +						    &tegra->devices[MCCPU]);
> +	if (tegra->devices[MCCPU].avg_freq <= freq)
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
> +static int tegra_actmon_cpu_notify_cb(struct notifier_block *nb,
> +				      unsigned long action, void *ptr)
> +{
> +	struct cpufreq_freqs *freqs = ptr;
> +	struct tegra_devfreq *tegra;
> +	unsigned long old, new, delay;
> +
> +	if (action != CPUFREQ_POSTCHANGE)
> +		return NOTIFY_OK;
> +
> +	tegra = container_of(nb, struct tegra_devfreq, cpu_rate_change_nb);
> +
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
> +	/*
> +	 * CPUFreq driver should support CPUFREQ_ASYNC_NOTIFICATION in order
> +	 * to allow asynchronous notifications. This means we can't block
> +	 * here for too long, otherwise CPUFreq's core will complain with a
> +	 * warning splat.
> +	 */
> +	delay = msecs_to_jiffies(ACTMON_SAMPLING_PERIOD);
> +	schedule_delayed_work(&tegra->cpufreq_update_work, delay);
> +
> +	return NOTIFY_OK;
> +}
> +
>  static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  					  struct tegra_devfreq_device *dev)
>  {
> @@ -617,9 +712,16 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  	device_writel(dev, val, ACTMON_DEV_CTRL);
>  }
>  
> -static void tegra_actmon_start(struct tegra_devfreq *tegra)
> +static void tegra_actmon_stop_device(struct tegra_devfreq_device *dev)
> +{
> +	device_writel(dev, ACTMON_DEV_CTRL_STOP, ACTMON_DEV_CTRL);
> +	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
> +}
> +
> +static int tegra_actmon_start(struct tegra_devfreq *tegra)
>  {
>  	unsigned int i;
> +	int err;
>  
>  	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
>  		      ACTMON_GLB_PERIOD_CTRL);
> @@ -627,7 +729,30 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
>  	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
>  		tegra_actmon_configure_device(tegra, &tegra->devices[i]);
>  
> +	/*
> +	 * We are estimating CPU's memory bandwidth requirement based on
> +	 * amount of memory accesses and system's load, judging by CPU's
> +	 * frequency. We also don't want to receive events about CPU's
> +	 * frequency transaction when governor is stopped, hence notifier
> +	 * is registered dynamically.
> +	 */
> +	err = cpufreq_register_notifier(&tegra->cpu_rate_change_nb,
> +					CPUFREQ_TRANSITION_NOTIFIER);
> +	if (err) {
> +		dev_err(tegra->devfreq->dev.parent,
> +			"Failed to register rate change notifier: %d\n", err);
> +		goto err_stop;
> +	}
> +
>  	enable_irq(tegra->irq);
> +
> +	return 0;
> +
> +err_stop:
> +	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
> +		tegra_actmon_stop_device(&tegra->devices[i]);

nitpick:
Why don't you contain this for loop statement in the tegra_actmon_stop_device()?
I think that you can make it as following:

	tegra_actmon_stop_device(struct tegra_devfreq *target);
		for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)> +				
			device_writel(dev, ACTMON_DEV_CTRL_STOP, ACTMON_DEV_CTRL);              
			device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS); 

Except for this, looks good to me. 
Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

(snip)


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
