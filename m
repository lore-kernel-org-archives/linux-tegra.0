From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 13/16] PM / devfreq: tegra: Support Tegra30
Date: Mon, 24 Jun 2019 13:42:20 +0300
Message-ID: <37db00bc-3a22-d1c2-7bdc-e27af42cd5c7@gmail.com>
References: <20190624065919epcms1p1a366de5f455f5138c438d1da8151c12f@epcms1p1>
 <CGME20190624065919epcms1p1a366de5f455f5138c438d1da8151c12f@epcms1p8>
 <20190624073414epcms1p87b6dc13758b6bd401d275cfba583314a@epcms1p8>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190624073414epcms1p87b6dc13758b6bd401d275cfba583314a@epcms1p8>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: myungjoo.ham@samsung.com
Cc: Chanwoo Choi <cw00.choi@samsung.com>, "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "jonathanh@nvidia.com" <jonathanh@nvidia.com>, "thierry.reding@gmail.com" <thierry.reding@gmail.com>
List-Id: linux-tegra@vger.kernel.org

24.06.2019 10:34, MyungJoo Ham пишет:
>>
>> A question:
>>
>> Does this driver support Tegra20 as well?
>> I'm asking this because ARCH_TEGRA includes ARCH_TEGRA_2x_SOC
>> according to /drivers/soc/tegra/Kconfig.
>>
> 
> For this matter, how about updating your 13/16 patch as follows?
> 
> ---
>  drivers/devfreq/Kconfig         | 4 ++--
>  drivers/devfreq/tegra-devfreq.c | 1 +
>  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 7dd46d44579d..78c4b436aad8 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -93,8 +93,8 @@ config ARM_EXYNOS_BUS_DEVFREQ
>  	  This does not yet operate with optimal voltages.
>  
>  config ARM_TEGRA_DEVFREQ
> -	tristate "Tegra DEVFREQ Driver"
> -	depends on ARCH_TEGRA_124_SOC
> +	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> +	depends on ARCH_TEGRA_3x_SOC || ARCH_TEGRA_114_SOC || ARCH_TEGRA_124_SOC || ARCH_TEGRA_210_SOC
>  	select PM_OPP
>  	help
>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.
> diff --git a/drivers/devfreq/tegra-devfreq.c b/drivers/devfreq/tegra-devfreq.c
> index 5cddf2199c4e..a6ba75f4106d 100644
> --- a/drivers/devfreq/tegra-devfreq.c
> +++ b/drivers/devfreq/tegra-devfreq.c
> @@ -726,6 +726,7 @@ static int tegra_devfreq_remove(struct platform_device *pdev)
>  }
>  
>  static const struct of_device_id tegra_devfreq_of_match[] = {
> +	{ .compatible = "nvidia,tegra30-actmon" },
>  	{ .compatible = "nvidia,tegra124-actmon" },
>  	{ },
>  };
> 

Good call! I'll update this patch following yours suggestion, thanks.
