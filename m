From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/6] soc/tegra: pmc: Factor out DPD register bit
 calculation
Date: Wed, 11 Jul 2018 09:24:57 +0100
Message-ID: <040dce71-36c8-f2e6-cdf0-a848294862c4@nvidia.com>
References: <1531226879-11802-1-git-send-email-avienamo@nvidia.com>
 <1531226879-11802-3-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1531226879-11802-3-git-send-email-avienamo@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 10/07/18 13:47, Aapo Vienamo wrote:
> Factor out the the code to calculate the correct DPD register and bit
> number for a given pad. This logic will be needed to query the status
> register.
> 
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 5bea3b9..83b39cd 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -922,11 +922,12 @@ tegra_io_pad_find(struct tegra_pmc *pmc, enum tegra_io_pad id)
>  	return NULL;
>  }
>  
> -static int tegra_io_pad_prepare(enum tegra_io_pad id, unsigned long *request,
> -				unsigned long *status, u32 *mask)
> +static int tegra_io_pad_get_dpd_register_bit(enum tegra_io_pad id,
> +					     unsigned long *request,
> +					     unsigned long *status,
> +					     u32 *mask)
>  {
>  	const struct tegra_io_pad_soc *pad;
> -	unsigned long rate, value;
>  
>  	pad = tegra_io_pad_find(pmc, id);
>  	if (!pad) {
> @@ -947,6 +948,19 @@ static int tegra_io_pad_prepare(enum tegra_io_pad id, unsigned long *request,
>  		*request = pmc->soc->regs->dpd2_req;
>  	}
>  
> +	return 0;
> +}
> +
> +static int tegra_io_pad_prepare(enum tegra_io_pad id, unsigned long *request,
> +				unsigned long *status, u32 *mask)
> +{
> +	unsigned long rate, value;
> +	int err;
> +
> +	err = tegra_io_pad_get_dpd_register_bit(id, request, status, mask);
> +	if (err)
> +		return err;
> +
>  	if (pmc->clk) {
>  		rate = clk_get_rate(pmc->clk);
>  		if (!rate) {
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
