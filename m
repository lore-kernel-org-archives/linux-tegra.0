From: Adrian Hunter <adrian.hunter@intel.com>
Subject: Re: [PATCH v2] mmc: tegra: fix SDR50 tuning override
Date: Tue, 7 Jan 2020 09:23:23 +0200
Message-ID: <9ad68894-fe90-4fb1-47b9-2304dee5b902@intel.com>
References: <b20c4847980c2c385ff0d7677fa5101c4d040749.1578314098.git.mirq-linux@rere.qmqm.pl>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <b20c4847980c2c385ff0d7677fa5101c4d040749.1578314098.git.mirq-linux@rere.qmqm.pl>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Thierry Reding <treding@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 6/01/20 2:36 pm, Michał Mirosław wrote:
> Commit 7ad2ed1dfcbe inadvertently mixed up a quirk flag's name and
> broke SDR50 tuning override. Use correct NVQUIRK_ name.
> 
> Fixes: 7ad2ed1dfcbe ("mmc: tegra: enable UHS-I modes")
> Cc: <stable@vger.kernel.org> # 4f6aa3264af4: mmc: tegra: Only advertise UHS modes if IO regulator is present
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>

You should have included Thierry's Reviewed-by and Tested-by

Otherwise:

Acked-by: Adrian Hunter <adrian.hunter@intel.com>

> ---
>  v2: converted 'Depends-On' tag to proper 'Cc: stable' lines
> ---
>  drivers/mmc/host/sdhci-tegra.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 7bc950520fd9..403ac44a7378 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -386,7 +386,7 @@ static void tegra_sdhci_reset(struct sdhci_host *host, u8 mask)
>  			misc_ctrl |= SDHCI_MISC_CTRL_ENABLE_DDR50;
>  		if (soc_data->nvquirks & NVQUIRK_ENABLE_SDR104)
>  			misc_ctrl |= SDHCI_MISC_CTRL_ENABLE_SDR104;
> -		if (soc_data->nvquirks & SDHCI_MISC_CTRL_ENABLE_SDR50)
> +		if (soc_data->nvquirks & NVQUIRK_ENABLE_SDR50)
>  			clk_ctrl |= SDHCI_CLOCK_CTRL_SDR50_TUNING_OVERRIDE;
>  	}
>  
> 
