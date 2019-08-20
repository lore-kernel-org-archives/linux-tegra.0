From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 3/9] drivers: ata: ahci_tegra: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:44:06 +0200
Message-ID: <b3ab1d66-177a-d342-fdcb-a23c14325ba2@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123600epcas1p2dd50661f5073defeeca49b86e94ff241@epcas1p2.samsung.com>
        <1566304548-19972-3-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-3-git-send-email-info@metux.net>
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
>  drivers/ata/ahci_tegra.c | 13 +++++--------
>  1 file changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/ata/ahci_tegra.c b/drivers/ata/ahci_tegra.c
> index e3163da..3845c23 100644
> --- a/drivers/ata/ahci_tegra.c
> +++ b/drivers/ata/ahci_tegra.c
> @@ -481,7 +481,6 @@ static int tegra_ahci_probe(struct platform_device *pdev)
>  {
>  	struct ahci_host_priv *hpriv;
>  	struct tegra_ahci_priv *tegra;
> -	struct resource *res;
>  	int ret;
>  	unsigned int i;
>  
> @@ -498,19 +497,17 @@ static int tegra_ahci_probe(struct platform_device *pdev)
>  	tegra->pdev = pdev;
>  	tegra->soc = of_device_get_match_data(&pdev->dev);
>  
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 1);
> -	tegra->sata_regs = devm_ioremap_resource(&pdev->dev, res);
> +	tegra->sata_regs = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(tegra->sata_regs))
>  		return PTR_ERR(tegra->sata_regs);
>  
>  	/*
>  	 * AUX registers is optional.
>  	 */
> -	res = platform_get_resource(pdev, IORESOURCE_MEM, 2);
> -	if (res) {
> -		tegra->sata_aux_regs = devm_ioremap_resource(&pdev->dev, res);
> -		if (IS_ERR(tegra->sata_aux_regs))
> -			return PTR_ERR(tegra->sata_aux_regs);
> +	tegra->sata_aux_regs = devm_platform_ioremap_resource(pdev, 2);

This conversion is incorrect - despite the resource being optional
we will get error message from devm_[platform_]ioremap_resource()
(it always prints an error on !res condition).

> +	if (IS_ERR(tegra->sata_aux_regs)) {
> +		dev_info(&pdev->dev, "Cant get aux registers (optional)");

No need for this message.

> +		tegra->sata_aux_regs = NULL;
>  	}
>  
>  	tegra->sata_rst = devm_reset_control_get(&pdev->dev, "sata");
Best regards,
--
Bartlomiej Zolnierkiewicz
Samsung R&D Institute Poland
Samsung Electronics
