From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regulator: tps65910: Sleep control through external
 inputs
Date: Tue, 24 Jan 2012 11:58:55 +0000
Message-ID: <20120124115855.GC14888@opensource.wolfsonmicro.com>
References: <1327395919-32378-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1327395919-32378-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: lrg-l0cyMroinI0@public.gmane.org, jedu-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org, gg-kDsPt+C1G03kYMGBc/C6ZA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 24, 2012 at 02:35:19PM +0530, Laxman Dewangan wrote:

> +	/*
> +	 * Rail can not be control from all external input EN1, EN2 and EN3
> +	 * together.
> +	 */
> +	if ((ext_sleep_config & EXT_SLEEP_CONTROL) == EXT_SLEEP_CONTROL) {
> +		dev_err(mfd->dev, "External sleep control flag is not "
> +					" not proper\n");
> +		return -EINVAL;
> +	}

Don't split log messages over multiple lines, it makes grepping the logs
harder.  Also, are combinations of two external enables valid?

> +static void tps65910_shutdown(struct platform_device *pdev)
> +{
> +	struct tps65910_reg *pmic = platform_get_drvdata(pdev);
> +	int i;
> +	int err;
> +	dev_err(&pdev->dev, "%s() is called\n", __func__);
> +
> +	/* Remove all external control before shutting down the device */
> +	for (i = 0; i < pmic->num_regulators; i++) {
> +		if (!pmic->rdev[i])
> +			continue;
> +
> +		err = tps65910_set_ext_sleep_config(pmic, i, 0);
> +		if (err < 0)
> +			dev_err(&pdev->dev, "Error in clearing external "
> +				"control\n");
> +	}

Why?

> +/*
> + * Regulator mode when rail is in sleep state which controlled by external
> + * input. The regultor will be OFF if it is in sleep state by default but
> + * can be set in LOW power mode by ORing following macro with any of
> + * above exterenl input option.
> + */
> +#define TPS65910_SLEEP_CONTROL_REG_LOW_POWER		0x10

There's the suspend mode API for configuring suspend modes.

> +
>  /**
>   * struct tps65910_board
>   * Board platform data may be used to initialize regulators.
> @@ -779,6 +792,7 @@ struct tps65910_board {
>  	int irq_base;
>  	int vmbch_threshold;
>  	int vmbch2_threshold;
> +	unsigned long regulator_ext_sleep_control[TPS65910_NUM_REGS];

I can't see anything in this code which will manage the enable signals?
