From: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH] sdhci: tegra: Add comment for PADCALIB and PAD_CONTROL NVQUIRKS
Date: Tue, 16 Jun 2020 13:32:27 +0200
Message-ID: <CAPDyKFpscyQXYF+WQ98_sRvonCL+ZbddX+ctw3umQ8HLAqvxmA@mail.gmail.com>
References: <1591326240-28928-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-mmc-owner@vger.kernel.org>
In-Reply-To: <1591326240-28928-1-git-send-email-skomatineni@nvidia.com>
Sender: linux-mmc-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>, Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra <linux-tegra@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, 5 Jun 2020 at 05:04, Sowjanya Komatineni <skomatineni@nvidia.com> wrote:
>
> This patch adds comments about NVQUIRKS HAS_PADCALIB and NEEDS_PAD_CONTROL.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>

Applied for next, thanks!

Kind regards
Uffe


> ---
>  drivers/mmc/host/sdhci-tegra.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/mmc/host/sdhci-tegra.c b/drivers/mmc/host/sdhci-tegra.c
> index 3a372ab..0a3f9d0 100644
> --- a/drivers/mmc/host/sdhci-tegra.c
> +++ b/drivers/mmc/host/sdhci-tegra.c
> @@ -96,7 +96,16 @@
>  #define NVQUIRK_ENABLE_SDR50                           BIT(3)
>  #define NVQUIRK_ENABLE_SDR104                          BIT(4)
>  #define NVQUIRK_ENABLE_DDR50                           BIT(5)
> +/*
> + * HAS_PADCALIB NVQUIRK is for SoC's supporting auto calibration of pads
> + * drive strength.
> + */
>  #define NVQUIRK_HAS_PADCALIB                           BIT(6)
> +/*
> + * NEEDS_PAD_CONTROL NVQUIRK is for SoC's having separate 3V3 and 1V8 pads.
> + * 3V3/1V8 pad selection happens through pinctrl state selection depending
> + * on the signaling mode.
> + */
>  #define NVQUIRK_NEEDS_PAD_CONTROL                      BIT(7)
>  #define NVQUIRK_DIS_CARD_CLK_CONFIG_TAP                        BIT(8)
>  #define NVQUIRK_CQHCI_DCMD_R1B_CMD_TIMING              BIT(9)
> --
> 2.7.4
>
