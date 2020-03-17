From: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v1 3/3] mmc: tegra: Enable host capability
 MMC_CAP2_LONG_WAIT_HW_BUSY
Date: Tue, 17 Mar 2020 11:51:49 +0200
Message-ID: <c46fef86-ac9c-a921-1464-dbca58bc3169@intel.com>
References: <1583799205-8442-1-git-send-email-skomatineni@nvidia.com>
 <1583799205-8442-3-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1583799205-8442-3-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-mmc-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, ulf.hansson@linaro.org, baolin.wang@linaro.org, kstewart@linuxfoundation.org, tglx@linutronix.de, bradleybolen@gmail.com, gregkh@linuxfoundation.org, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc: anrao@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 10/03/20 2:13 am, Sowjanya Komatineni wrote:
> Some mmc operations take longer than maximum HW busy detection and
> mmc core driver converts R1B type to R1 type response for these
> operations based on host max busy timeout and command operation time
> and uses SW poll for busy.
> 
> Tegra host support long HW busy detection where host waits forever
> till the card is busy.
> 
> This patch enables MMC_CAP2_LONG_WAIT_HW_BUSY capability for Tegra
> host.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  drivers/mmc/host/sdhci-tegra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 40a221d..9d0f371 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -1583,6 +1583,7 @@ static int sdhci_tegra_probe(struct platform_device *pdev)
>  	if (tegra_host->soc_data->nvquirks & NVQUIRK_ENABLE_DDR50)
>  		host->mmc->caps |= MMC_CAP_1_8V_DDR;
>  
> +	host->mmc->caps2 |= MMC_CAP2_LONG_WAIT_HW_BUSY;
>  	tegra_sdhci_parse_dt(host);
>  
>  	tegra_host->power_gpio = devm_gpiod_get_optional(&pdev->dev, "power",
> 
