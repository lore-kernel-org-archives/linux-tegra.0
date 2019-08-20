From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 8/9] drivers: ata: sata_gemini: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:36:35 +0200
Message-ID: <f7a9d877-e437-e22e-f9f8-d8da62273aa5@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123601epcas1p19aecef8b133d389e392fdd12273ef3a6@epcas1p1.samsung.com>
        <1566304548-19972-8-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-8-git-send-email-info@metux.net>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc: linux-kernel@vger.kernel.org, axboe@kernel.dk, hdegoede@redhat.com, linus.walleij@linaro.org, linux-ide@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 8/20/19 2:35 PM, Enrico Weigelt, metux IT consult wrote:
> Use the new helper that wraps the calls to platform_get_resource()
> and devm_ioremap_resource() together.

It would also be worth to mention in the patch description that
on !res condition the driver will now return -EINVAL (instead of
-ENODEV) and print an error.

> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>

Acked-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics

> ---
>  drivers/ata/sata_gemini.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/ata/sata_gemini.c b/drivers/ata/sata_gemini.c
> index f793564..55e2689 100644
> --- a/drivers/ata/sata_gemini.c
> +++ b/drivers/ata/sata_gemini.c
> @@ -318,7 +318,6 @@ static int gemini_sata_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	struct sata_gemini *sg;
>  	struct regmap *map;
> -	struct resource *res;
>  	enum gemini_muxmode muxmode;
>  	u32 gmode;
>  	u32 gmask;
> @@ -329,11 +328,7 @@ static int gemini_sata_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  	sg->dev = dev;
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!res)
> -		return -ENODEV;
> -
> -	sg->base = devm_ioremap_resource(dev, res);
> +	sg->base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(sg->base))
>  		return PTR_ERR(sg->base);
