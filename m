From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] spi: tegra20-sflash: call pm_runtime_put in case of
 pm_runtime_get failure
Date: Fri, 5 Jun 2020 07:10:13 +0100
Message-ID: <9fffd3eb-3e96-7abd-b5ff-9cf01f4f4ef7@nvidia.com>
References: <20200602044049.17378-1-navid.emamdoost@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200602044049.17378-1-navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-spi-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: emamd001-OJFnDUYgAso@public.gmane.org, wu000273-OJFnDUYgAso@public.gmane.org, kjlu-OJFnDUYgAso@public.gmane.org, smccaman-OJFnDUYgAso@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 02/06/2020 05:40, Navid Emamdoost wrote:
> The counter is incremented via pm_runtime_get even in failure case.
> To correct the counter call pm_runtime_put in case of failure, too.
> 
> Signed-off-by: Navid Emamdoost <navid.emamdoost-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  drivers/spi/spi-tegra20-sflash.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/spi/spi-tegra20-sflash.c b/drivers/spi/spi-tegra20-sflash.c
> index 514429379206..33c34f9c2021 100644
> --- a/drivers/spi/spi-tegra20-sflash.c
> +++ b/drivers/spi/spi-tegra20-sflash.c
> @@ -552,6 +552,7 @@ static int tegra_sflash_resume(struct device *dev)
>  
>  	ret = pm_runtime_get_sync(dev);
>  	if (ret < 0) {
> +		pm_runtime_put(dev);
>  		dev_err(dev, "pm runtime failed, e = %d\n", ret);
>  		return ret;
>  	}

There is another instance of this in this driver that needs fixing.

Jon

-- 
nvpublic
