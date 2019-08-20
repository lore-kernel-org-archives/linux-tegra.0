From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v6 03/19] PM / devfreq: tegra30: Handle possible
 round-rate error
Date: Tue, 20 Aug 2019 09:06:01 +0900
Message-ID: <b57acb3f-ef28-b945-0b8f-38892dc131bb@samsung.com>
References: <20190811212315.12689-1-digetx@gmail.com>
        <CGME20190811212443epcas3p3294b8ac39ea075000fbffee6078cf068@epcas3p3.samsung.com>
        <20190811212315.12689-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190811212315.12689-4-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Hi,

On 19. 8. 12. 오전 6:22, Dmitry Osipenko wrote:
> The EMC clock rate rounding technically could fail, hence let's handle
> the error cases properly.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 17 +++++++++++++++--
>  1 file changed, 15 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 8be6a33beb9c..bfee9d43de1e 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -592,8 +592,8 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	struct tegra_devfreq_device *dev;
>  	struct tegra_devfreq *tegra;
>  	struct devfreq *devfreq;
> -	unsigned long rate;
>  	unsigned int i;
> +	long rate;
>  	int err;
>  
>  	tegra = devm_kzalloc(&pdev->dev, sizeof(*tegra), GFP_KERNEL);
> @@ -650,8 +650,14 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  
>  	reset_control_deassert(tegra->reset);
>  
> -	tegra->max_freq = clk_round_rate(tegra->emc_clock, ULONG_MAX) / KHZ;
> +	rate = clk_round_rate(tegra->emc_clock, ULONG_MAX);
> +	if (rate < 0) {
> +		dev_err(&pdev->dev, "Failed to round clock rate: %ld\n", rate);
> +		return rate;
> +	}
> +
>  	tegra->cur_freq = clk_get_rate(tegra->emc_clock) / KHZ;
> +	tegra->max_freq = rate / KHZ;
>  
>  	for (i = 0; i < ARRAY_SIZE(actmon_device_configs); i++) {
>  		dev = tegra->devices + i;
> @@ -662,6 +668,13 @@ static int tegra_devfreq_probe(struct platform_device *pdev)
>  	for (rate = 0; rate <= tegra->max_freq * KHZ; rate++) {
>  		rate = clk_round_rate(tegra->emc_clock, rate);
>  
> +		if (rate < 0) {
> +			dev_err(&pdev->dev,
> +				"Failed to round clock rate: %ld\n", rate);
> +			err = rate;
> +			goto remove_opps;
> +		}
> +
>  		err = dev_pm_opp_add(&pdev->dev, rate, 0);
>  		if (err) {
>  			dev_err(&pdev->dev, "Failed to add OPP: %d\n", err);
> 

It supports the exception handling. Looks good to me.

Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
