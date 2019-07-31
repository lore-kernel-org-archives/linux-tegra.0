From: Chanwoo Choi <cw00.choi@samsung.com>
Subject: Re: [PATCH v5 18/20] PM / devfreq: tegra30: Define
 ACTMON_DEV_CTRL_STOP
Date: Wed, 31 Jul 2019 09:37:15 +0900
Message-ID: <033a342c-ffd6-fa51-a9a2-daac36b195f9@samsung.com>
References: <20190730162236.6063-1-digetx@gmail.com>
        <CGME20190730163331epcas4p2fabd7ccf1b24c0cb95bf3994a289e13b@epcas4p2.samsung.com>
        <20190730162236.6063-19-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190730162236.6063-19-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 19. 7. 31. 오전 1:22, Dmitry Osipenko wrote:
> Add verbose definition for the client's device control register value that
> makes ACTMON to stop monitoring of the device.
> 
> Suggested-by: Chanwoo Choi <cw00.choi@samsung.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/devfreq/tegra30-devfreq.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
> index 3543fba74b52..8adc0ff48b45 100644
> --- a/drivers/devfreq/tegra30-devfreq.c
> +++ b/drivers/devfreq/tegra30-devfreq.c
> @@ -35,6 +35,8 @@
>  #define ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN		BIT(30)
>  #define ACTMON_DEV_CTRL_ENB					BIT(31)
>  
> +#define ACTMON_DEV_CTRL_STOP					0x00000000
> +
>  #define ACTMON_DEV_UPPER_WMARK					0x4
>  #define ACTMON_DEV_LOWER_WMARK					0x8
>  #define ACTMON_DEV_INIT_AVG					0xc
> @@ -714,7 +716,7 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>  
>  static void tegra_actmon_stop_device(struct tegra_devfreq_device *dev)
>  {
> -	device_writel(dev, 0x00000000, ACTMON_DEV_CTRL);
> +	device_writel(dev, ACTMON_DEV_CTRL_STOP, ACTMON_DEV_CTRL);
>  	device_writel(dev, ACTMON_INTR_STATUS_CLEAR, ACTMON_DEV_INTR_STATUS);
>  }
>  
> 

I think that you can combine it to patch11.
When combining it to patch11, don't need to add the suggested-by tag.
Thanks.

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
