From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/6] soc/tegra: pmc: Correct type of variable for
 tegra_pmc_readl()
Date: Tue, 3 May 2016 12:42:59 +0100
Message-ID: <57288EC3.3090001@nvidia.com>
References: <1462191434-28933-1-git-send-email-ldewangan@nvidia.com>
 <1462191434-28933-3-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
In-Reply-To: <1462191434-28933-3-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>, swarren@wwwdotorg.org, linus.walleij@linaro.org, gnurou@gmail.com, robh+dt@kernel.org, mark.rutland@arm.com, thierry.reding@gmail.com
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 02/05/16 13:17, Laxman Dewangan wrote:
> The function tegra_pmc_readl() returns the u32 type data and hence
> change the data type of variable where this data is stored to u32
> type.
> 
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> 
> ---
> Changes from V1:
> -This is new in series as per discussion on V1 series to use u32 for
> tegra_pmc_readl.
> ---
>  drivers/soc/tegra/pmc.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 2c3f1f9..fc4f7b2 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -878,7 +878,7 @@ static int tegra_io_rail_prepare(unsigned int id, unsigned long *request,
>  static int tegra_io_rail_poll(unsigned long offset, unsigned long mask,
>  			      unsigned long val, unsigned long timeout)
>  {
> -	unsigned long value;
> +	u32 value;

You also need to make mask and val a u32.

Jon
