From: Marc Dietrich <Marc.Dietrich-wkdnK3oF/XPYtB+G+YtuwQgYPMzSbZxj@public.gmane.org>
Subject: Re: [PATCH 1/2] staging/nvec: Do not pass resource to mfd_add_devices()
Date: Tue, 29 Jul 2014 22:23:17 +0200
Message-ID: <21317349.CjmK2Kpl80@ax5200p>
References: <1406632575-26075-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1406632575-26075-1-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Julian Andres Klode <jak-4HMq4SXA452hPH1hqNUYSQ@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, ac100-oU9gvf+ajcQ97yFScArB1dHuzzzSOjJt@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Dienstag 29 Juli 2014, 13:16:14 schrieb Thierry Reding:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The mfd_add_devices() function takes a struct resource * as fifth
> argument, but the nvec driver passes in a void __iomem *. The driver
> gets away with it because none of the subdevices ever directly access
> the registers.
> 
> Since subdevices never need to access the registers we can simply pass
> NULL instead.
> 
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Acked-by: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>

> ---
>  drivers/staging/nvec/nvec.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index 0a5c84ad3f41..815065837ce7 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -893,7 +893,7 @@ static int tegra_nvec_probe(struct platform_device
> *pdev) }
> 
>  	ret = mfd_add_devices(nvec->dev, -1, nvec_devices,
> -			      ARRAY_SIZE(nvec_devices), base, 0, NULL);
> +			      ARRAY_SIZE(nvec_devices), NULL, 0, NULL);
>  	if (ret)
>  		dev_err(nvec->dev, "error adding subdevices\n");
