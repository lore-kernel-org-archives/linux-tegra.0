From: Marc Dietrich <Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Subject: Re: [PATCH 2/2] staging/nvec: Use platform_get_irq()
Date: Tue, 29 Jul 2014 22:24:03 +0200
Message-ID: <4292851.WR4mddmlu0@ax5200p>
References: <1406632575-26075-1-git-send-email-thierry.reding@gmail.com> <1406632575-26075-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406632575-26075-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag 29 Juli 2014, 13:16:15 schrieb Thierry Reding:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> As opposed to platform_get_resource(), the platform_get_irq() function
> has special code to handle driver probe deferral when booting using DT
> and where an interrupt provider hasn't been registered yet. While this
> is unlikely to become an issue for nvec, platform_get_irq() is the
> recommended way to get at interrupts.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Thanks again, Thierry!

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>



> ---
>  drivers/staging/nvec/nvec.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 815065837ce7..a93208adbfcf 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -821,8 +821,8 @@ static int tegra_nvec_probe(struct platform_device
> *pdev) if (IS_ERR(base))
>  		return PTR_ERR(base);
> 
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> +	nvec->irq = platform_get_irq(pdev, 0);
> +	if (nvec->irq < 0) {
>  		dev_err(&pdev->dev, "no irq resource?\n");
>  		return -ENODEV;
>  	}
> @@ -840,7 +840,6 @@ static int tegra_nvec_probe(struct platform_device
> *pdev) }
> 
>  	nvec->base = base;
> -	nvec->irq = res->start;
>  	nvec->i2c_clk = i2c_clk;
>  	nvec->rx = &nvec->msg_pool[0];
