From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Subject: Re: [PATCH v5 1/5] mmc: core: Extend mmc_of_parse() to parse CQE
 bindings
Date: Wed, 6 May 2020 18:30:04 +0530
Message-ID: <9bc2454f-0b42-e256-7927-2564b56f369f@codeaurora.org>
References: <1588031768-23677-1-git-send-email-chun-hung.wu@mediatek.com>
 <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1588031768-23677-2-git-send-email-chun-hung.wu@mediatek.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chun-Hung Wu <chun-hung.wu@mediatek.com>, mirq-linux@rere.qmqm.pl, Jonathan Hunter <jonathanh@nvidia.com>, Al Cooper <alcooperx@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, Florian Fainelli <f.fainelli@gmail.com>, bcm-kernel-feedback-list@broadcom.com, Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>, Michal Simek <michal.simek@xilinx.com>, Thierry Reding <thierry.reding@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger <matthias.bgg@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Pavel Machek <pavel@ucw.cz>, Kate Stewart <kstewart@linuxfoundation.org>, Greg
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, wsd_upstream@mediatek.com, linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 4/28/2020 5:26 AM, Chun-Hung Wu wrote:
> Parse CQE bindings "supports-cqe" and "disable-cqe-dcmd"
> in mmc_of_parse().
>
> Signed-off-by: Chun-Hung Wu <chun-hung.wu@mediatek.com>
> ---
>   drivers/mmc/core/host.c | 5 +++++
>   1 file changed, 5 insertions(+)
>
> diff --git a/drivers/mmc/core/host.c b/drivers/mmc/core/host.c
> index c876872..47521c6 100644
> --- a/drivers/mmc/core/host.c
> +++ b/drivers/mmc/core/host.c
> @@ -302,6 +302,11 @@ int mmc_of_parse(struct mmc_host *host)
>   		host->caps2 |= MMC_CAP2_NO_SD;
>   	if (device_property_read_bool(dev, "no-mmc"))
>   		host->caps2 |= MMC_CAP2_NO_MMC;
> +	if (device_property_read_bool(dev, "supports-cqe"))
> +		host->caps2 |= MMC_CAP2_CQE;

This change is breaking emmc driver on qcom platforms where this dt 
property is defined.

[    1.543453]  cqhci_deactivate+0xc/0x38
[    1.545627]  sdhci_msm_reset+0x40/0x58
[    1.549447]  sdhci_do_reset+0x48/0x7c
[    1.553180]  __sdhci_read_caps+0x7c/0x214
[    1.556913]  sdhci_setup_host+0x58/0xce8
[    1.560905]  sdhci_msm_probe+0x588/0x8a4
[    1.564900]  platform_drv_probe+0x4c/0xb0

So, we cant have this flag defined before sdhci_setup_host().

I will have to clear this cap and re-enable it in our initialization.

> +	if (!device_property_read_bool(dev, "disable-cqe-dcmd")) {
> +		host->caps2 |= MMC_CAP2_CQE_DCMD;
> +	}
>   
>   	/* Must be after "non-removable" check */
>   	if (device_property_read_u32(dev, "fixed-emmc-driver-type", &drv_type) == 0) {
