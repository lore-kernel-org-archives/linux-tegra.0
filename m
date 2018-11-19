From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/4] ARM: tegra: Fix missed EMC registers latching on
 resume from LP1 on Tegra30+
Date: Mon, 19 Nov 2018 21:27:32 +0000
Message-ID: <3c7e275e-c833-cfbf-813e-d71858bbef63@nvidia.com>
References: <20180830185404.7224-1-digetx@gmail.com>
 <20180830185404.7224-2-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-2-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/08/2018 19:54, Dmitry Osipenko wrote:
> The memory interface configuration and re-calibration interval are left
> unassigned on resume from LP1 because these registers are shadowed and
> require latching after being adjusted.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/sleep-tegra30.S | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
> index 127fc78365fe..801fe58978ae 100644
> --- a/arch/arm/mach-tegra/sleep-tegra30.S
> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
> @@ -521,6 +521,8 @@ zcal_done:
>  	ldr	r1, [r5, #0x0]		@ restore EMC_CFG
>  	str	r1, [r0, #EMC_CFG]
>  
> +	emc_timing_update r1, r0
> +
>  	/* Tegra114 had dual EMC channel, now config the other one */
>  	cmp	r10, #TEGRA114
>  	bne	__no_dual_emc_chanl
> 

This is stated in the TRM as what needs to be done. So ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
