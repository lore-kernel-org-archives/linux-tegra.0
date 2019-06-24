From: MyungJoo Ham <myungjoo.ham@samsung.com>
Subject: Re: [PATCH v4 13/16] PM / devfreq: tegra: Support Tegra30
Date: Mon, 24 Jun 2019 15:59:19 +0900
Message-ID: <20190624065919epcms1p1a366de5f455f5138c438d1da8151c12f@epcms1p1>
References: <CGME20190624065919epcms1p1a366de5f455f5138c438d1da8151c12f@epcms1p1>
Reply-To: myungjoo.ham@samsung.com
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: "digetx@gmail.com" <digetx@gmail.com>, "janathanh@nvidia.com" <janathanh@nvidia.com>, Chanwoo Choi <cw00.choi@samsung.com>
Cc: "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

> On Thu, May 02, 2019 at 02:38:12AM +0300, Dmitry Osipenko wrote:
> > The devfreq driver can be used on Tegra30 without any code change and
> > it works perfectly fine, the default Tegra124 parameters are good enough
> > for Tegra30.
> > 
> > Reviewed-by: Chanwoo Choi 
> > Signed-off-by: Dmitry Osipenko 
> > ---
> >  drivers/devfreq/Kconfig         | 4 ++--
> >  drivers/devfreq/tegra-devfreq.c | 1 +
> >  2 files changed, 3 insertions(+), 2 deletions(-)
> 
> Acked-by: Thierry Reding 
> 
> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
> index 7dd46d4..b291803 100644
> --- a/drivers/devfreq/Kconfig
> +++ b/drivers/devfreq/Kconfig
> @@ -93,8 +93,8 @@ config ARM_EXYNOS_BUS_DEVFREQ
>  	  This does not yet operate with optimal voltages.
>  
>  config ARM_TEGRA_DEVFREQ
> -	tristate "Tegra DEVFREQ Driver"
> -	depends on ARCH_TEGRA_124_SOC
> +	tristate "NVIDIA Tegra30/114/124/210 DEVFREQ Driver"
> +	depends on ARCH_TEGRA
>  	select PM_OPP
>  	help
>  	  This adds the DEVFREQ driver for the Tegra family of SoCs.

A question:

Does this driver support Tegra20 as well?
I'm asking this because ARCH_TEGRA includes ARCH_TEGRA_2x_SOC
according to /drivers/soc/tegra/Kconfig.

Cheers,
MyungJoo.
