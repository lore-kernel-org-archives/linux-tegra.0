From: Ben Dooks <ben-i2c-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>
Subject: Re: [PATCH V2 1/4] i2c: tegra: Add __devinit/exit to probe/remove
Date: Fri, 6 Jan 2012 16:22:39 +0000
Message-ID: <20120106162239.GR19115@trinity.fluff.org>
References: <1324189772-26914-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1324189772-26914-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Sat, Dec 17, 2011 at 11:29:29PM -0700, Stephen Warren wrote:
> This fixes some section mismatch build warnings.
> 
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> v2: New patch.
> 
>  drivers/i2c/busses/i2c-tegra.c |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index 46b6500..e8560ed 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -558,7 +558,7 @@ static const struct i2c_algorithm tegra_i2c_algo = {
>  	.functionality	= tegra_i2c_func,
>  };
>  
> -static int tegra_i2c_probe(struct platform_device *pdev)
> +static int __devinit tegra_i2c_probe(struct platform_device *pdev)
>  {
>  	struct tegra_i2c_dev *i2c_dev;
>  	struct tegra_i2c_platform_data *pdata = pdev->dev.platform_data;
> @@ -690,7 +690,7 @@ err_iounmap:
>  	return ret;
>  }
>  
> -static int tegra_i2c_remove(struct platform_device *pdev)
> +static int __devexit tegra_i2c_remove(struct platform_device *pdev)
>  {
>  	struct tegra_i2c_dev *i2c_dev = platform_get_drvdata(pdev);
>  	i2c_del_adapter(&i2c_dev->adapter);

You need t oupdate the platform driver's .remove method with __devexit_p
to ensure that it nulls it out.

-- 
Ben Dooks, ben-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org, http://www.fluff.org/ben/

Large Hadron Colada: A large Pina Colada that makes the universe disappear.
