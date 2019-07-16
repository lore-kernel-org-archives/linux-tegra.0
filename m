From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v4 07/24] PM / devfreq: tegra30: Use CPUFreq notifier
Date: Tue, 16 Jul 2019 21:08:06 +0900
Message-ID: <c94da786-05b4-1604-d208-f73f32ea937d@samsung.com>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223538epcas5p47ff4d1a90c3cfe7a5fb96108b1bd344a@epcas5p4.samsung.com>
        <20190707223303.6755-8-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707223303.6755-8-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
> The CPU's client need to take into account that CPUFreq may change
> while memory activity not, staying high. Thus an appropriate frequency
> notifier should be used in addition to the clk-notifier.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 105 +++++++++++++++++++++++++-----
>  1 file changed, 88 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 2bf65409ddd8..48a799fa5f63 100644
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
> @@ -154,7 +155,10 @@ struct tegra_devfreq {
>  
>  	struct clk		*emc_clock;
>  	unsigned long		max_freq;
> -	struct notifier_block	rate_change_nb;
> +	struct notifier_block	clk_rate_change_nb;
> +
> +	struct work_struct	update_work;

nitpick.
I think 'update_work' is not clear to indicate the work
for changing the clock according to the cpu clock change.
You better to change the name for more clearly.

> +	struct notifier_block	cpu_rate_change_nb;
>  
>  	struct tegra_devfreq_device devices[ARRAY_SIZE(actmon_device_configs)];
>  
> @@ -456,8 +460,8 @@ static irqreturn_t actmon_thread_isr(int irq, void *data)
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
> @@ -467,7 +471,7 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  	if (action != POST_RATE_CHANGE)
>  		return NOTIFY_OK;
>  
> -	tegra = container_of(nb, struct tegra_devfreq, rate_change_nb);
> +	tegra = container_of(nb, struct tegra_devfreq, clk_rate_change_nb);
>  
>  	/*
>  	 * EMC rate could change due to three reasons:
> @@ -496,6 +500,37 @@ static int tegra_actmon_rate_notify_cb(struct notifier_block *nb,
>  	return NOTIFY_OK;
>  }
>  
> +static void tegra_actmon_delayed_update(struct work_struct *work)
> +{
> +	struct tegra_devfreq *tegra = container_of(work, struct tegra_devfreq,
> +						   update_work);
> +
> +	mutex_lock(&tegra->devfreq->lock);
> +	update_devfreq(tegra->devfreq);
> +	mutex_unlock(&tegra->devfreq->lock);
> +}
> +
> +static int tegra_actmon_cpu_notify_cb(struct notifier_block *nb,
> +				      unsigned long action, void *ptr)
> +{
> +	struct tegra_devfreq *tegra;
> +
> +	if (action != CPUFREQ_POSTCHANGE)
> +		return NOTIFY_OK;
> +
> +	tegra = container_of(nb, struct tegra_devfreq, cpu_rate_change_nb);

nitpick. Better to check whether 'tegra' is NULL or not.

> +
> +	/*
> +	 * CPUFreq driver should support CPUFREQ_ASYNC_NOTIFICATION in order
> +	 * to allow asynchronous notifications. This means we can't block
> +	 * here for too long, otherwise CPUFreq's core will complain with a
> +	 * warning splat.
> +	 */
> +	schedule_work(&tegra->update_work);
> +
> +	return NOTIFY_OK;
> +}
> +
>  static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  					  struct tegra_devfreq_device *dev)
>  {
> @@ -527,9 +562,16 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  	device_writel(dev, val, ACTMON_DEV_CTRL);
>  }
>  
> -static void tegra_actmon_start(struct tegra_devfreq *tegra)
> +static void tegra_actmon_stop_device(struct tegra_devfreq_device *dev)
> +{
> +	device_writel(dev, 0x00000000, ACTMON_DEV_CTRL);

Better to define the constant definition of 0x00000000
in order to explain the correct meaning.

For example,
#define ACTMON_DEV_RESET	0x00000000

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
> @@ -537,7 +579,30 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
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
> +	}> +
>  	enable_irq(tegra->irq);
> +
> +	return 0;
> +
> +err_stop:
> +	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
> +		tegra_actmon_stop_device(&tegra->devices[i]);
> +
> +	return err;
>  }
>  
>  static void tegra_actmon_stop(struct tegra_devfreq *tegra)
> @@ -546,11 +611,13 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>  
>  	disable_irq(tegra->irq);
>  
> -	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++) {
> -		device_writel(&tegra->devices[i], 0x00000000, ACTMON_DEV_CTRL);
> -		device_writel(&tegra->devices[i], ACTMON_INTR_STATUS_CLEAR,
> -			      ACTMON_DEV_INTR_STATUS);
> -	}
> +	cpufreq_unregister_notifier(&tegra->cpu_rate_change_nb,
> +				    CPUFREQ_TRANSITION_NOTIFIER);
> +
> +	cancel_work_sync(&tegra->update_work);
> +
> +	for (i = 0; i < ARRAY_SIZE(tegra->devices); i++)
> +		tegra_actmon_stop_device(&tegra->devices[i]);
>  }
>  
>  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
> @@ -659,6 +726,7 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  					unsigned int event, void *data)
>  {
>  	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
> +	int ret = 0;
>  
>  	/*
>  	 * Couple device with the governor early as it is needed at
> @@ -669,7 +737,7 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  	switch (event) {
>  	case DEVFREQ_GOV_START:
>  		devfreq_monitor_start(devfreq);
> -		tegra_actmon_start(tegra);
> +		ret = tegra_actmon_start(tegra);
>  		break;
>  
>  	case DEVFREQ_GOV_STOP:
> @@ -684,11 +752,11 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  
>  	case DEVFREQ_GOV_RESUME:
>  		devfreq_monitor_resume(devfreq);
> -		tegra_actmon_start(tegra);
> +		ret = tegra_actmon_start(tegra);
>  		break;
>  	}
>  
> -	return 0;
> +	return ret;
>  }
>  
>  static struct devfreq_governor tegra_devfreq_governor = {
> @@ -794,9 +862,12 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	platform_set_drvdata(pdev, tegra);
>  
> -	tegra->	.notifier_call = tegra_actmon_rate_notify_cb;
> +	tegra->cpu_rate_change_nb.notifier_call = tegra_actmon_cpu_notify_cb;
> +	INIT_WORK(&tegra->update_work, tegra_actmon_delayed_update);
> +
> +	tegra->clk_rate_change_nb.notifier_call = tegra_actmon_clk_notify_cb;
>  	err = clk_notifier_register(tegra->emc_clock,
> -				    &tegra->rate_change_nb);
> +				    &tegra->clk_rate_change_nb);
>  	if (err) {
>  		dev_err(&pdev->dev,
>  			"Failed to register rate change notifier\n");
> @@ -823,7 +894,7 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	devfreq_remove_governor(&tegra_devfreq_governor);
>  
>  unreg_notifier:
> -	clk_notifier_unregister(tegra->emc_clock, &tegra->rate_change_nb);
> +	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
>  
>  remove_opps:
>  	dev_pm_opp_remove_all_dynamic(&pdev->dev);
> @@ -841,7 +912,7 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
>  	devfreq_remove_device(tegra->devfreq);
>  	devfreq_remove_governor(&tegra_devfreq_governor);
>  
> -	clk_notifier_unregister(tegra->emc_clock, &tegra->rate_change_nb);
> +	clk_notifier_unregister(tegra->emc_clock, &tegra->clk_rate_change_nb);
>  	dev_pm_opp_remove_all_dynamic(&pdev->dev);
>  
>  	reset_control_reset(tegra->reset);
> 


-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
