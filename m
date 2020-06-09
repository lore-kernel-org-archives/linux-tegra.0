From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v6 1/4] mmc: mediatek: add MT6779 MMC driver support
Date: Tue, 9 Jun 2020 13:25:03 +0200
Message-ID: <a95eae56-4011-a9c8-90b4-7a906ffd7e6c@gmail.com>
References: <1591665502-6573-1-git-send-email-chun-hung.wu@mediatek.com>
 <1591665502-6573-2-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-arm-msm-owner@vger.kernel.org>
In-Reply-To: <1591665502-6573-2-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Martin
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 09/06/2020 03:18, Chun-Hung Wu wrote:
> MT6779 add cqhci support, so need to add new code
> to support it.
> 

Please work on the commit message. For example it mentions cqhci while the code
does not. Better describe what technical specification the controller has etc

> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>  drivers/mmc/host/mtk-sd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index b221c02..8ada675 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -538,6 +538,18 @@ struct msdc_host {
>  	.use_internal_cd = true,
>  };
>  
> +static const struct mtk_mmc_compatible mt6779_compat = {
> +	.clk_div_bits = 12,
> +	.hs400_tune = false,
> +	.pad_tune_reg = MSDC_PAD_TUNE0,
> +	.async_fifo = true,
> +	.data_tune = true,
> +	.busy_check = true,
> +	.stop_clk_fix = true,
> +	.enhance_rx = true,
> +	.support_64g = true,
> +};
> +
>  static const struct of_device_id msdc_of_ids[] = {
>  	{ .compatible = "mediatek,mt8135-mmc", .data = &mt8135_compat},
>  	{ .compatible = "mediatek,mt8173-mmc", .data = &mt8173_compat},
> @@ -547,6 +559,7 @@ struct msdc_host {
>  	{ .compatible = "mediatek,mt7622-mmc", .data = &mt7622_compat},
>  	{ .compatible = "mediatek,mt8516-mmc", .data = &mt8516_compat},
>  	{ .compatible = "mediatek,mt7620-mmc", .data = &mt7620_compat},
> +	{ .compatible = "mediatek,mt6779-mmc", .data = &mt6779_compat},
>  	{}
>  };
>  MODULE_DEVICE_TABLE(of, msdc_of_ids);
> 
