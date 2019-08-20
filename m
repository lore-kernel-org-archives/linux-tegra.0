From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 4/9] drivers: ata: ahci_xgene: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:45:19 +0200
Message-ID: <00a33e10-b563-a7e1-4180-10386f803b75@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123600epcas1p41f9e4e891a48fbafefcb2c22b5da7155@epcas1p4.samsung.com>
        <1566304548-19972-4-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-4-git-send-email-info@metux.net>
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
> ---
>  drivers/ata/ahci_xgene.c | 21 +++++++--------------
>  1 file changed, 7 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/ata/ahci_xgene.c b/drivers/ata/ahci_xgene.c
> index 16246c8..5391f5d 100644
> --- a/drivers/ata/ahci_xgene.c
> +++ b/drivers/ata/ahci_xgene.c
> @@ -739,7 +739,6 @@ static int xgene_ahci_probe(struct platform_device *pdev)
>  	struct device *dev = &pdev->dev;
>  	struct ahci_host_priv *hpriv;
>  	struct xgene_ahci_context *ctx;
> -	struct resource *res;
>  	const struct of_device_id *of_devid;
>  	enum xgene_ahci_version version = XGENE_AHCI_V1;
>  	const struct ata_port_info *ppi[] = { &xgene_ahci_v1_port_info,
> @@ -759,31 +758,25 @@ static int xgene_ahci_probe(struct platform_device *pdev)
>  	ctx->dev = dev;
>  
>  	/* Retrieve the IP core resource */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	ctx->csr_core = devm_ioremap_resource(dev, res);
> +	ctx->csr_core = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(ctx->csr_core))
>  		return PTR_ERR(ctx->csr_core);
>  
>  	/* Retrieve the IP diagnostic resource */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -	ctx->csr_diag = devm_ioremap_resource(dev, res);
> +	ctx->csr_diag = devm_platform_ioremap_resource(pdev, 2);
>  	if (IS_ERR(ctx->csr_diag))
>  		return PTR_ERR(ctx->csr_diag);
>  
>  	/* Retrieve the IP AXI resource */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 3);
> -	ctx->csr_axi = devm_ioremap_resource(dev, res);
> +	ctx->csr_axi = devm_platform_ioremap_resource(pdev, 3);
>  	if (IS_ERR(ctx->csr_axi))
>  		return PTR_ERR(ctx->csr_axi);
>  
>  	/* Retrieve the optional IP mux resource */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 4);
> -	if (res) {
> -		void __iomem *csr = devm_ioremap_resource(dev, res);
> -		if (IS_ERR(csr))
> -			return PTR_ERR(csr);
> -
> -		ctx->csr_mux = csr;
> +	ctx->csr_mux = csr = devm_platform_ioremap_resource(pdev, 4);

This conversion is incorrect - despite the resource being optional
we will get error message from devm_[platform_]ioremap_resource()
(it always prints an error on !res condition).

> +	if (IS_ERR(ctx->csr_mux)) {
> +		dev_info(&pdev->dev, "cant get ip mux resource (optional)");

No need for this message.

> +		ctx->csr_mux = NULL;
>  	}
>  
>  	of_devid = of_match_device(xgene_ahci_of_match, dev);

Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
