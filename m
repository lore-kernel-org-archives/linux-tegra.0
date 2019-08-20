From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 6/9] drivers: ata: pata_bk3710: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:30:50 +0200
Message-ID: <d567bae7-b952-7dcd-976c-13d833c7d0a8@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123559epcas2p1be29e0bcaef4f4b1042b6177f387d7e2@epcas2p1.samsung.com>
        <1566304548-19972-6-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-6-git-send-email-info@metux.net>
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
>  drivers/ata/pata_bk3710.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/ata/pata_bk3710.c b/drivers/ata/pata_bk3710.c
> index fad95cf..92b036d 100644
> --- a/drivers/ata/pata_bk3710.c
> +++ b/drivers/ata/pata_bk3710.c
> @@ -291,7 +291,6 @@ static void pata_bk3710_chipinit(void __iomem *base)
>  static int __init pata_bk3710_probe(struct platform_device *pdev)
>  {
>  	struct clk *clk;
> -	struct resource *mem;
>  	struct ata_host *host;
>  	struct ata_port *ap;
>  	void __iomem *base;
> @@ -310,15 +309,13 @@ static int __init pata_bk3710_probe(struct platform_device *pdev)
>  	/* NOTE:  round *down* to meet minimum timings; we count in clocks */
>  	ideclk_period = 1000000000UL / rate;
>  
> -	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -
>  	irq = platform_get_irq(pdev, 0);
>  	if (irq < 0) {
>  		pr_err(DRV_NAME ": failed to get IRQ resource\n");
>  		return irq;
>  	}
>  
> -	base = devm_ioremap_resource(&pdev->dev, mem);
> +	base = devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
