From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1] i2c: tegra: Compile PM functions unconditionally
Date: Tue, 9 Jul 2019 11:12:12 +0100
Message-ID: <13be0f2e-2131-2e0d-d39f-9f1c964b8698@nvidia.com>
References: <20190707231234.11679-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707231234.11679-1-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Laxman Dewangan <ldewangan@nvidia.com>, Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 08/07/2019 00:12, Dmitry Osipenko wrote:
> The I2C driver fails to probe if CONFIG_PM_SLEEP=n because runtime PM
> doesn't depend on the PM sleep and in this case the runtime PM ops are
> not included in the driver, resulting in I2C clock not being enabled.
> It's much cleaner to simply allow compiler to remove the dead code
> instead of messing with the #ifdefs.
> 
> This patch fixes such errors when CONFIG_PM_SLEEP=n:
> 
>   tegra-i2c 7000c400.i2c: timeout waiting for fifo flush
>   tegra-i2c 7000c400.i2c: Failed to initialize i2c controller
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 16 +++++-----------
>  1 file changed, 5 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 9fcb13beeb8f..18f0ceed9f1b 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -636,7 +636,7 @@ static void tegra_dvc_init(struct tegra_i2c_dev *i2c_dev)
>  	dvc_writel(i2c_dev, val, DVC_CTRL_REG1);
>  }
>  
> -static int tegra_i2c_runtime_resume(struct device *dev)
> +static int __maybe_unused tegra_i2c_runtime_resume(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int ret;
> @@ -665,7 +665,7 @@ static int tegra_i2c_runtime_resume(struct device *dev)
>  	return 0;
>  }
>  
> -static int tegra_i2c_runtime_suspend(struct device *dev)
> +static int __maybe_unused tegra_i2c_runtime_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  
> @@ -1711,8 +1711,7 @@ static int tegra_i2c_remove(struct platform_device *pdev)
>  	return 0;
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
> -static int tegra_i2c_suspend(struct device *dev)
> +static int __maybe_unused tegra_i2c_suspend(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  
> @@ -1721,7 +1720,7 @@ static int tegra_i2c_suspend(struct device *dev)
>  	return 0;
>  }
>  
> -static int tegra_i2c_resume(struct device *dev)
> +static int __maybe_unused tegra_i2c_resume(struct device *dev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = dev_get_drvdata(dev);
>  	int err;
> @@ -1741,18 +1740,13 @@ static const struct dev_pm_ops tegra_i2c_pm = {
>  			   NULL)
>  };
>  
> -#define TEGRA_I2C_PM	(&tegra_i2c_pm)
> -#else
> -#define TEGRA_I2C_PM	NULL
> -#endif
> -
>  static struct platform_driver tegra_i2c_driver = {
>  	.probe   = tegra_i2c_probe,
>  	.remove  = tegra_i2c_remove,
>  	.driver  = {
>  		.name  = "tegra-i2c",
>  		.of_match_table = tegra_i2c_of_match,
> -		.pm    = TEGRA_I2C_PM,
> +		.pm    = &tegra_i2c_pm,
>  	},
>  };
>  

Looks good to me.

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
