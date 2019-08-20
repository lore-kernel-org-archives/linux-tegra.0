From: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/9] drivers: ata: ahci_seattle: use
 devm_platform_ioremap_resource()
Date: Tue, 20 Aug 2019 15:28:59 +0200
Message-ID: <81e2908c-1608-dd97-28cf-4c7467754519@samsung.com>
References: <1566304548-19972-1-git-send-email-info@metux.net>
        <CGME20190820123559epcas2p12a7160b5fbd7fe6d648aa4471d94d603@epcas2p1.samsung.com>
        <1566304548-19972-2-git-send-email-info@metux.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1566304548-19972-2-git-send-email-info@metux.net>
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
>  drivers/ata/ahci_seattle.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/ata/ahci_seattle.c b/drivers/ata/ahci_seattle.c
> index ced12705..2d88d36 100644
> --- a/drivers/ata/ahci_seattle.c
> +++ b/drivers/ata/ahci_seattle.c
> @@ -132,8 +132,7 @@ static const struct ata_port_info *ahci_seattle_get_port_info(
>  	if (!plat_data)
>  		return &ahci_port_info;
>  
> -	plat_data->sgpio_ctrl = devm_ioremap_resource(dev,
> -			      platform_get_resource(pdev, IORESOURCE_MEM, 1));
> +	plat_data->sgpio_ctrl = devm_platform_ioremap_resource(pdev, 1);
>  	if (IS_ERR(plat_data->sgpio_ctrl))
>  		return &ahci_port_info;
