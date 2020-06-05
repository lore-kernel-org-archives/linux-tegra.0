From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] spi: tegra114: missing put on pm_runtime_get_sync failure
Date: Fri, 5 Jun 2020 07:09:03 +0100
Message-ID: <f928fb02-47d7-b6f9-6198-bd549d6ac6b5@nvidia.com>
References: <20200602045506.40574-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200602045506.40574-1-navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: emamd001-OJFnDUYgAso@public.gmane.org, wu000273-OJFnDUYgAso@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org, mccamant-k0Ej6N9cQa43uPMLIKxrzw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/06/2020 05:55, Navid Emamdoost wrote:
> the call to pm_runtime_get_sync increments the counter even 
> in case of failure leading to incorrect ref count.
> Call pm_runtime_put if pm_runtime_get_sync fails.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/spi/spi-tegra114.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/spi/spi-tegra114.c b/drivers/spi/spi-tegra114.c
> index 83edabdb41ad..dccd2ac1a975 100644
> --- a/drivers/spi/spi-tegra114.c
> +++ b/drivers/spi/spi-tegra114.c
> @@ -974,6 +974,7 @@ static int tegra_spi_setup(struct spi_device *spi)
>  		dev_err(tspi->dev, "pm runtime failed, e = %d\n", ret);
>  		if (cdata)
>  			tegra_spi_cleanup(spi);
> +		pm_runtime_put(tspi->dev);
>  		return ret;
>  	}
>  
> @@ -1398,6 +1399,7 @@ static int tegra_spi_probe(struct platform_device *pdev)
>  	ret = pm_runtime_get_sync(&pdev->dev);
>  	if (ret < 0) {
>  		dev_err(&pdev->dev, "pm runtime get failed, e = %d\n", ret);
> +		pm_runtime_put(&pdev->dev);
>  		goto exit_pm_disable;
>  	}

I am wondering if it is better we use put_sync() here to ensure that
this happens before we exit the probe.

Jon

-- 
nvpublic
