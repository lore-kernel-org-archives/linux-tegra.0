From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 9/9] drivers: ata: sata_rcar: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:37:29 +0200
Message-ID: <3e9340d8-bfd2-5b9b-7454-d41697e9d25f@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123601epcas1p157f0a0c3a8d0a5b4d1e4bf497221bc08@epcas1p1.samsung.com>
        <1566304548-19972-9-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-9-git-send-email-info@metux.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: linux-kernel@vger.kernel.org, axboe@kernel.dk, hdegoede@redhat.com, linus.walleij@linaro.org, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/20/19 2:35 PM, Enrico Weigelt, metux IT consult wrote:
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.
> 
> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/ata/sata_rcar.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/ata/sata_rcar.c b/drivers/ata/sata_rcar.c
> index 3495e17..14ea1d6 100644
> --- a/drivers/ata/sata_rcar.c
> +++ b/drivers/ata/sata_rcar.c
> @@ -886,7 +886,6 @@ static int sata_rcar_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct ata_host *host;
>  	struct sata_rcar_priv *priv;
> -	struct resource *mem;
>  	int irq;
>  	int ret = 0;
>  
> @@ -915,8 +914,7 @@ static int sata_rcar_probe(struct platform_device *pdev)
>  
>  	host->private_data = priv;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	priv->base = devm_ioremap_resource(dev, mem);
> +	priv->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(priv->base)) {
>  		ret = PTR_ERR(priv->base);
>  		goto err_pm_put;
