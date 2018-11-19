From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 3/4] ARM: tegra: Restore memory arbitration on resume
 from LP1 on Tegra30+
Date: Mon, 19 Nov 2018 21:51:01 +0000
Message-ID: <48dc61a4-7dd0-5f0e-33e0-43c7833e8a37@nvidia.com>
References: <20180830185404.7224-1-digetx@gmail.com>
 <20180830185404.7224-4-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-4-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/08/2018 19:54, Dmitry Osipenko wrote:
> The external memory arbitration configuration is getting reset after
> memory entering into self-refresh mode, it shall be restored on the
> exit. Note that MC_EMEM_ARB_CFG register is shadowed and latching
> happens on the EMC timing update. This fixes 2x GPU performance
> degradation after resuming from LP1 on Tegra30.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/iomap.h         |  9 +++++++++
>  arch/arm/mach-tegra/sleep-tegra30.S | 21 +++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/arm/mach-tegra/iomap.h b/arch/arm/mach-tegra/iomap.h
> index 9e5b2f869fc8..9bc291e76887 100644
> --- a/arch/arm/mach-tegra/iomap.h
> +++ b/arch/arm/mach-tegra/iomap.h
> @@ -79,15 +79,24 @@
>  #define TEGRA_PMC_BASE			0x7000E400
>  #define TEGRA_PMC_SIZE			SZ_256
>  
> +#define TEGRA_MC_BASE			0x7000F000
> +#define TEGRA_MC_SIZE			SZ_1K
> +
>  #define TEGRA_EMC_BASE			0x7000F400
>  #define TEGRA_EMC_SIZE			SZ_1K
>  
> +#define TEGRA114_MC_BASE		0x70019000
> +#define TEGRA114_MC_SIZE		SZ_4K
> +
>  #define TEGRA_EMC0_BASE			0x7001A000
>  #define TEGRA_EMC0_SIZE			SZ_2K
>  
>  #define TEGRA_EMC1_BASE			0x7001A800
>  #define TEGRA_EMC1_SIZE			SZ_2K
>  
> +#define TEGRA124_MC_BASE		0x70019000
> +#define TEGRA124_MC_SIZE		SZ_4K
> +
>  #define TEGRA124_EMC_BASE		0x7001B000
>  #define TEGRA124_EMC_SIZE		SZ_2K
>  
> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
> index 99ac9c6dcf7c..828f6c37afde 100644
> --- a/arch/arm/mach-tegra/sleep-tegra30.S
> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
> @@ -44,6 +44,8 @@
>  #define EMC_XM2VTTGENPADCTRL		0x310
>  #define EMC_XM2VTTGENPADCTRL2		0x314
>  
> +#define MC_EMEM_ARB_CFG			0x90
> +
>  #define PMC_CTRL			0x0
>  #define PMC_CTRL_SIDE_EFFECT_LP0 (1 << 14) /* enter LP0 when CPU pwr gated */
>  
> @@ -418,6 +420,22 @@ _pll_m_c_x_done:
>  	movweq	r0, #:lower16:TEGRA124_EMC_BASE
>  	movteq	r0, #:upper16:TEGRA124_EMC_BASE
>  
> +	cmp	r10, #TEGRA30
> +	moveq	r2, #0x20
> +	movweq	r4, #:lower16:TEGRA_MC_BASE
> +	movteq	r4, #:upper16:TEGRA_MC_BASE
> +	cmp	r10, #TEGRA114
> +	moveq	r2, #0x34
> +	movweq	r4, #:lower16:TEGRA114_MC_BASE
> +	movteq	r4, #:upper16:TEGRA114_MC_BASE
> +	cmp	r10, #TEGRA124
> +	moveq	r2, #0x20
> +	movweq	r4, #:lower16:TEGRA124_MC_BASE
> +	movteq	r4, #:upper16:TEGRA124_MC_BASE
> +
> +	ldr	r1, [r5, r2]		@ restore MC_EMEM_ARB_CFG
> +	str	r1, [r4, #MC_EMEM_ARB_CFG]
> +
>  exit_self_refresh:
>  	ldr	r1, [r5, #0xC]		@ restore EMC_XM2VTTGENPADCTRL
>  	str	r1, [r0, #EMC_XM2VTTGENPADCTRL]
> @@ -546,6 +564,7 @@ tegra30_sdram_pad_address:
>  	.word	TEGRA_PMC_BASE + PMC_IO_DPD_STATUS			@0x14
>  	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_CLK_SOURCE_MSELECT	@0x18
>  	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_SCLK_BURST		@0x1c
> +	.word	TEGRA_MC_BASE + MC_EMEM_ARB_CFG				@0x20
>  tegra30_sdram_pad_address_end:
>  
>  tegra114_sdram_pad_address:
> @@ -562,6 +581,7 @@ tegra114_sdram_pad_address:
>  	.word	TEGRA_EMC1_BASE + EMC_AUTO_CAL_INTERVAL			@0x28
>  	.word	TEGRA_EMC1_BASE + EMC_XM2VTTGENPADCTRL			@0x2c
>  	.word	TEGRA_EMC1_BASE + EMC_XM2VTTGENPADCTRL2			@0x30
> +	.word	TEGRA114_MC_BASE + MC_EMEM_ARB_CFG			@0x34
>  tegra114_sdram_pad_adress_end:
>  
>  tegra124_sdram_pad_address:
> @@ -573,6 +593,7 @@ tegra124_sdram_pad_address:
>  	.word	TEGRA_PMC_BASE + PMC_IO_DPD_STATUS			@0x14
>  	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_CLK_SOURCE_MSELECT	@0x18
>  	.word	TEGRA_CLK_RESET_BASE + CLK_RESET_SCLK_BURST		@0x1c
> +	.word	TEGRA124_MC_BASE + MC_EMEM_ARB_CFG			@0x20
>  tegra124_sdram_pad_address_end:
>  
>  tegra30_sdram_pad_size:
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>


-- 
nvpublic
