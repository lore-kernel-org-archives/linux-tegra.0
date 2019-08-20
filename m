From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 02/19] PM / devfreq: tegra30: Keep interrupt disabled
 while governor is stopped
Date: Tue, 20 Aug 2019 09:02:10 +0900
Message-ID: <f02267cb-7299-fcdb-dfff-97ea36ccf2e5@samsung.com>
References: <20190811212315.12689-1-digetx@gmail.com>
        <CGME20190811212557epcas3p1d5dd6c484e6fc1ed9feb619a24c1b745@epcas3p1.samsung.com>
        <20190811212315.12689-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-3-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, "cpgs (cpgs@samsung.com)" <cpgs@samsung.com>
List-Id: linux-tegra@vger.kernel.org

Hi,

On 19. 8. 12. 오전 6:22, Dmitry Osipenko wrote:
> There is no real need to keep interrupt always-enabled, will be nicer
> to keep it disabled while governor is inactive.
> 
> Suggested-by: Thierry Reding <thierry.reding@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 47 ++++++++++++++++---------------
>  1 file changed, 24 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index a27300f40b0b..8be6a33beb9c 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -11,6 +11,7 @@
>  #include <linux/devfreq.h>
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
> +#include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/mod_devicetable.h>
>  #include <linux/platform_device.h>
> @@ -416,8 +417,6 @@ static void tegra_actmon_start(struct tegra_devfreq *tegra)
>  {
>  	unsigned int i;
>  
> -	disable_irq(tegra->irq);
> -
>  	actmon_writel(tegra, ACTMON_SAMPLING_PERIOD - 1,
>  		      ACTMON_GLB_PERIOD_CTRL);
>  
> @@ -442,8 +441,6 @@ static void tegra_actmon_stop(struct tegra_devfreq *tegra)
>  	}
>  
>  	actmon_write_barrier(tegra);
> -
> -	enable_irq(tegra->irq);
>  }
>  
>  static int tegra_devfreq_target(struct device *dev, unsigned long *freq,
> @@ -552,6 +549,12 @@ static int tegra_governor_event_handler(struct devfreq *devfreq,
>  {
>  	struct tegra_devfreq *tegra = dev_get_drvdata(devfreq->dev.parent);
>  
> +	/*
> +	 * Couple device with the governor early as it is needed at
> +	 * the moment of governor's start (used by ISR).
> +	 */
> +	tegra->devfreq = devfreq;
> +
>  	switch (event) {
>  	case DEVFREQ_GOV_START:
>  		devfreq_monitor_start(devfreq);
> @@ -586,10 +589,11 @@ static struct devfreq_governor tegra_devfreq_governor = {
>  
>  static int tegra_devfreq_probe(struct platform_device *pdev)
>  {
> -	struct tegra_devfreq *tegra;
>  	struct tegra_devfreq_device *dev;
> -	unsigned int i;
> +	struct tegra_devfreq *tegra;
> +	struct devfreq *devfreq;
>  	unsigned long rate;
> +	unsigned int i;
>  	int err;
>  
>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
> @@ -625,6 +629,16 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  	tegra->irq = err;
>  
> +	irq_set_status_flags(tegra->irq, IRQ_NOAUTOEN);
> +
> +	err = devm_request_threaded_irq(&pdev->dev, tegra->irq, NULL,
> +					actmon_thread_isr, IRQF_ONESHOT,
> +					"tegra-devfreq", tegra);
> +	if (err) {
> +		dev_err(&pdev->dev, "Interrupt request failed: %d\n", err);
> +		return err;
> +	}
> +
>  	reset_control_assert(tegra->reset);
>  
>  	err = clk_prepare_enable(tegra->clock);
> @@ -672,28 +686,15 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	}
>  
>  	tegra_devfreq_profile.initial_freq = clk_get_rate(tegra->emc_clock);
> -	tegra->devfreq = devfreq_add_device(&pdev->dev,
> -					    &tegra_devfreq_profile,
> -					    "tegra_actmon",
> -					    NULL);
> -	if (IS_ERR(tegra->devfreq)) {
> -		err = PTR_ERR(tegra->devfreq);
> +	devfreq = devfreq_add_device(&pdev->dev, &tegra_devfreq_profile,
> +				     "tegra_actmon", NULL);
> +	if (IS_ERR(devfreq)) {
> +		err = PTR_ERR(devfreq);
>  		goto remove_governor;
>  	}
>  
> -	err = devm_request_threaded_irq(&pdev->dev, tegra->irq, NULL,
> -					actmon_thread_isr, IRQF_ONESHOT,
> -					"tegra-devfreq", tegra);
> -	if (err) {
> -		dev_err(&pdev->dev, "Interrupt request failed: %d\n", err);
> -		goto remove_devfreq;
> -	}
> -
>  	return 0;
>  
> -remove_devfreq:
> -	devfreq_remove_device(tegra->devfreq);
> -
>  remove_governor:
>  	devfreq_remove_governor(&tegra_devfreq_governor);
>  
> 

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
