From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 7/9] drivers: ata: sata_dwc_460ex: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:31:32 +0200
Message-ID: <68b89d3d-9feb-1b62-5b17-cc97cb5bd225@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123601epcas2p1494c1485f111056fe585668e3591d756@epcas2p1.samsung.com>
        <1566304548-19972-7-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-7-git-send-email-info@metux.net>
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
>  drivers/ata/sata_dwc_460ex.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/ata/sata_dwc_460ex.c b/drivers/ata/sata_dwc_460ex.c
> index 9dcef6a..de248fa 100644
> --- a/drivers/ata/sata_dwc_460ex.c
> +++ b/drivers/ata/sata_dwc_460ex.c
> @@ -237,7 +237,6 @@ static int sata_dwc_dma_init_old(struct platform_device *pdev,
>  				 struct sata_dwc_device *hsdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> -	struct resource *res;
>  
>  	hsdev->dma = devm_kzalloc(&pdev->dev, sizeof(*hsdev->dma), GFP_KERNEL);
>  	if (!hsdev->dma)
> @@ -254,8 +253,7 @@ static int sata_dwc_dma_init_old(struct platform_device *pdev,
>  	}
>  
>  	/* Get physical SATA DMA register base address */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	hsdev->dma->regs = devm_ioremap_resource(&pdev->dev, res);
> +	hsdev->dma->regs = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(hsdev->dma->regs))
>  		return PTR_ERR(hsdev->dma->regs);
