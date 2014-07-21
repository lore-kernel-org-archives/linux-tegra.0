From: Marc Dietrich <marvin24@gmx.de>
Subject: Re: [PATCH] staging/nvec: Pass proper resource to mfd_add_devices()
Date: Mon, 21 Jul 2014 22:01:36 +0200
Message-ID: <20140721220136.5bd54deb52f7717d8880b11c@gmx.de>
References: <1405943561-2656-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <driverdev-devel-bounces@linuxdriverproject.org>
In-Reply-To: <1405943561-2656-1-git-send-email-thierry.reding@gmail.com>
List-Unsubscribe: <http://driverdev.linuxdriverproject.org/mailman/options/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=unsubscribe>
List-Archive: <http://driverdev.linuxdriverproject.org/pipermail/driverdev-devel>
List-Post: <mailto:driverdev-devel@linuxdriverproject.org>
List-Help: <mailto:driverdev-devel-request@linuxdriverproject.org?subject=help>
List-Subscribe: <http://driverdev.linuxdriverproject.org/mailman/listinfo/driverdev-devel>,
 <mailto:driverdev-devel-request@linuxdriverproject.org?subject=subscribe>
Errors-To: driverdev-devel-bounces@linuxdriverproject.org
Sender: driverdev-devel-bounces@linuxdriverproject.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devel@driverdev.osuosl.org, ac100@lists.launchpad.net
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On Mon, 21 Jul 2014 13:52:41 +0200
Thierry Reding <thierry.reding@gmail.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
> 
> The mfd_add_devices() parameter takes a struct resource * as fifth
> argument, but the nvec driver passes in a void __iomem *. The driver
> gets away with it because none of the subdevices ever directly access
> the registers.

you are right, this one looked bogus. 

> While at it, use platform_get_irq() instead of platform_get_resource()
> to get the device's interrupt. This makes it easier to pass in the
> register region since the variable is no longer reused.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Alternatively we could simply pass NULL into mfd_add_devices(), which
> might be a slightly more accurate representation of what's going on.
>
> Marc, Greg, any preferences?

I just tested with NULL as base and it seems to produce no harm. Even
if we may get rid of mfd_add_devices in the future, passing NULL is
cleaner for now and no children will ever make use of it. So please send
a new version with this change.

Otherwise, thanks for looking and cleaning up.

Marc

>  drivers/staging/nvec/nvec.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/nvec/nvec.c b/drivers/staging/nvec/nvec.c
> index d32504844896..11f9e1c3447c 100644
> --- a/drivers/staging/nvec/nvec.c
> +++ b/drivers/staging/nvec/nvec.c
> @@ -821,8 +821,8 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_IRQ, 0);
> -	if (!res) {
> +	nvec->irq = platform_get_irq(pdev, 0);
> +	if (nvec->irq < 0) {
>  		dev_err(&pdev->dev, "no irq resource?\n");
>  		return -ENODEV;
>  	}
> @@ -840,7 +840,6 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	}
>  
>  	nvec->base = base;
> -	nvec->irq = res->start;
>  	nvec->i2c_clk = i2c_clk;
>  	nvec->rx = &nvec->msg_pool[0];
>  
> @@ -893,7 +892,7 @@ static int tegra_nvec_probe(struct platform_device *pdev)
>  	}
>  
>  	ret = mfd_add_devices(nvec->dev, -1, nvec_devices,
> -			      ARRAY_SIZE(nvec_devices), base, 0, NULL);
> +			      ARRAY_SIZE(nvec_devices), res, 0, NULL);
>  	if (ret)
>  		dev_err(nvec->dev, "error adding subdevices\n");
>  
> -- 
> 2.0.1
> 


-- 
Marc Dietrich <marvin24@gmx.de>
