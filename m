From: Jesper Nilsson <jesper.nilsson@axis.com>
Subject: Re: [PATCH -next 27/30] pinctrl: artpec6: use
 devm_platform_ioremap_resource() to simplify code
Date: Thu, 17 Oct 2019 14:51:43 +0200
Message-ID: <20191017125143.yxhwy6lvzfhle7ey@axis.com>
References: <20191017122640.22976-1-yuehaibing@huawei.com>
 <20191017122640.22976-28-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20191017122640.22976-28-yuehaibing@huawei.com>
Sender: linux-kernel-owner@vger.kernel.org
To: YueHaibing <yuehaibing@huawei.com>
Cc: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, "afaerber@suse.de" <afaerber@suse.de>, "f.fainelli@gmail.com" <f.fainelli@gmail.com>, "rjui@broadcom.com" <rjui@broadcom.com>, "sbranden@broadcom.com" <sbranden@broadcom.com>, "bcm-kernel-feedback-list@broadcom.com" <bcm-kernel-feedback-list@broadcom.com>, Jesper Nilsson <jespern@axis.com>, Lars Persson <larper@axis.com>, "ludovic.desroches@microchip.com" <ludovic.desroches@microchip.com>, "nicolas.ferre@microchip.com" <nicolas.ferre@microchip.com>, "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>, "baruch@tkos.co.il" <baruch@tkos.co.il>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Oct 17, 2019 at 02:26:37PM +0200, YueHaibing wrote:
> Use devm_platform_ioremap_resource() to simplify the code a bit.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Acked-by: Jesper Nilsson <jesper.nilsson@axis.com>

> ---
>  drivers/pinctrl/pinctrl-artpec6.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/pinctrl/pinctrl-artpec6.c b/drivers/pinctrl/pinctrl-artpec6.c
> index e3239cf..986e04a 100644
> --- a/drivers/pinctrl/pinctrl-artpec6.c
> +++ b/drivers/pinctrl/pinctrl-artpec6.c
> @@ -936,7 +936,6 @@ static void artpec6_pmx_reset(struct artpec6_pmx *pmx)
>  static int artpec6_pmx_probe(struct platform_device *pdev)
>  {
>  	struct artpec6_pmx *pmx;
> -	struct resource *res;
>  
>  	pmx = devm_kzalloc(&pdev->dev, sizeof(*pmx), GFP_KERNEL);
>  	if (!pmx)
> @@ -944,8 +943,7 @@ static int artpec6_pmx_probe(struct platform_device *pdev)
>  
>  	pmx->dev = &pdev->dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	pmx->base = devm_ioremap_resource(&pdev->dev, res);
> +	pmx->base = devm_platform_ioremap_resource(pdev, 0);
>  
>  	if (IS_ERR(pmx->base))
>  		return PTR_ERR(pmx->base);
> -- 
> 2.7.4
> 
> 

/^JN - Jesper Nilsson
-- 
               Jesper Nilsson -- jesper.nilsson@axis.com
