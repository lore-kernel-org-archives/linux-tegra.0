From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: [PATCH 21/31] staging: nvec: use reset framework
Date: Sat, 16 Nov 2013 23:33:29 +0100
Message-ID: <6324985.OW3IJOJeSb@ax5200p>
References: <1384548866-13141-1-git-send-email-swarren@wwwdotorg.org> <1384548866-13141-22-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1384548866-13141-22-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 15 November 2013 13:54:16 Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Tegra's clock driver now provides an implementation of the common
> reset API (include/linux/reset.h). Use this instead of the old Tegra-
> specific API; that will soon be removed.
> 
> Cc: treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
> Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
> Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>
> Cc: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
> Cc: ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org
> Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
> Cc: devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
> This patch is part of a series with strong internal depdendencies. I'm
> looking for an ack so that I can take the entire series through the Tegra
> and arm-soc trees. The series will be part of a stable branch that can be
> merged into other subsystems if needed to avoid/resolve dependencies.
> ---
>  drivers/staging/nvec/nvec.c | 11 ++++++++---
>  drivers/staging/nvec/nvec.h |  5 ++++-
>  2 files changed, 12 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 3066ee2e753b..9de4cd13d9ab 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -36,7 +36,6 @@
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> -#include <linux/clk/tegra.h>
> 
>  #include "nvec.h"
> 
> @@ -733,9 +732,9 @@ static void tegra_init_i2c_slave(struct nvec_chip *nvec)
> 
>  	clk_prepare_enable(nvec->i2c_clk);
> 
> -	tegra_periph_reset_assert(nvec->i2c_clk);
> +	reset_control_assert(nvec->rst);
>  	udelay(2);
> -	tegra_periph_reset_deassert(nvec->i2c_clk);
> +	reset_control_deassert(nvec->rst);
> 
>  	val = I2C_CNFG_NEW_MASTER_SFM | I2C_CNFG_PACKET_MODE_EN |
>  	    (0x2 << I2C_CNFG_DEBOUNCE_CNT_SHIFT);
> @@ -836,6 +835,12 @@ static int tegra_nvec_probe(struct platform_device
> *pdev) return -ENODEV;
>  	}
> 
> +	nvec->rst = devm_reset_control_get(&pdev->dev, "i2c");
> +	if (IS_ERR(nvec->rst)) {
> +		dev_err(nvec->dev, "failed to get controller reset\n");
> +		return PTR_ERR(nvec->rst);
> +	}
> +
>  	nvec->base = base;
>  	nvec->irq = res->start;
>  	nvec->i2c_clk = i2c_clk;
> diff --git a/drivers/staging/nvec/nvec.h b/drivers/staging/nvec/nvec.h
> index e880518935fb..e271375053fa 100644
> --- a/drivers/staging/nvec/nvec.h
> +++ b/drivers/staging/nvec/nvec.h
> @@ -23,6 +23,7 @@
>  #include <linux/list.h>
>  #include <linux/mutex.h>
>  #include <linux/notifier.h>
> +#include <linux/reset.h>
>  #include <linux/spinlock.h>
>  #include <linux/workqueue.h>
> 
> @@ -109,7 +110,8 @@ struct nvec_msg {
>   * @irq: The IRQ of the I2C device
>   * @i2c_addr: The address of the I2C slave
>   * @base: The base of the memory mapped region of the I2C device
> - * @clk: The clock of the I2C device
> + * @i2c_clk: The clock of the I2C device
> + * @rst: The reset of the I2C device
>   * @notifier_list: Notifiers to be called on received messages, see
>   *                 nvec_register_notifier()
>   * @rx_data: Received messages that have to be processed
> @@ -139,6 +141,7 @@ struct nvec_chip {
>  	int i2c_addr;
>  	void __iomem *base;
>  	struct clk *i2c_clk;
> +	struct reset_control *rst;
>  	struct atomic_notifier_head notifier_list;
>  	struct list_head rx_data, tx_data;
>  	struct notifier_block nvec_status_notifier;
