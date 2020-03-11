From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
Date: Wed, 11 Mar 2020 03:25:47 +0300
Message-ID: <72fdd9f9-6100-d413-aae6-4c05922d7571@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-6-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200310152003.2945170-6-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Michael Turquette <mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>, Stephen Boyd <sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 18:20, Thierry Reding пишет:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> This is the initial patch for Tegra210 EMC frequency scaling. It has the
> code to program various aspects of the EMC that are standardized, but it
> does not yet include the specific programming sequence needed for clock
> scaling.
> 
> The driver is designed to support LPDDR4 SDRAM. Devices that use LPDDR4
> need to perform training of the RAM before it can be used. Firmware will
> perform this training during early boot and pass a table of supported
> frequencies to the kernel via device tree.
> 
> For the frequencies above 800 MHz, periodic retraining is needed to
> compensate for changes in timing. This periodic training will have to be
> performed until the frequency drops back to or below 800 MHz.
> 
> This driver provides helpers used during this runtime retraining that
> will be used by the sequence specific code in a follow-up patch.
> 
> Based on work by Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> 
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v5:
> - major rework and cleanup
> 
...

>  #include "mc.h"
>  
> +#define DVFS_FGCG_HIGH_SPEED_THRESHOLD				1000
> +#define IOBRICK_DCC_THRESHOLD					2400
> +#define DVFS_FGCG_MID_SPEED_THRESHOLD				600
> +
> +#define EMC_STATUS_UPDATE_TIMEOUT				1000
> +
> +#define MC_EMEM_ADR_CFG						0x54
> +#define MC_EMEM_ARB_CFG						0x90
> +#define MC_EMEM_ARB_OUTSTANDING_REQ				0x94
> +#define MC_EMEM_ARB_TIMING_RCD					0x98
> +#define MC_EMEM_ARB_TIMING_RP					0x9c
> +#define MC_EMEM_ARB_TIMING_RC					0xa0
> +#define MC_EMEM_ARB_TIMING_RAS					0xa4
> +#define MC_EMEM_ARB_TIMING_FAW					0xa8
> +#define MC_EMEM_ARB_TIMING_RRD					0xac
> +#define MC_EMEM_ARB_TIMING_RAP2PRE				0xb0
> +#define MC_EMEM_ARB_TIMING_WAP2PRE				0xb4
> +#define MC_EMEM_ARB_TIMING_R2R					0xb8
> +#define MC_EMEM_ARB_TIMING_W2W					0xbc
> +#define MC_EMEM_ARB_TIMING_R2W					0xc0
> +#define MC_EMEM_ARB_TIMING_W2R					0xc4
> +#define MC_EMEM_ARB_MISC2					0xc8
> +#define MC_EMEM_ARB_DA_TURNS					0xd0
> +#define MC_EMEM_ARB_DA_COVERS					0xd4
> +#define MC_EMEM_ARB_MISC0					0xd8
> +#define MC_EMEM_ARB_MISC1					0xdc
> +#define MC_EMEM_ARB_RING1_THROTTLE				0xe0

All these registers are already defined in mc.h, please don't re-define
them.

> +#define MC_LATENCY_ALLOWANCE_AVPC_0				0x2e4
> +#define MC_LATENCY_ALLOWANCE_HC_0				0x310
> +#define MC_LATENCY_ALLOWANCE_HC_1				0x314
> +#define MC_LATENCY_ALLOWANCE_MPCORE_0				0x320
> +#define MC_LATENCY_ALLOWANCE_NVENC_0				0x328
> +#define MC_LATENCY_ALLOWANCE_PPCS_0				0x344
> +#define MC_LATENCY_ALLOWANCE_PPCS_1				0x348
> +#define MC_LATENCY_ALLOWANCE_ISP2_0				0x370
> +#define MC_LATENCY_ALLOWANCE_ISP2_1				0x374
> +#define MC_LATENCY_ALLOWANCE_XUSB_0				0x37c
> +#define MC_LATENCY_ALLOWANCE_XUSB_1				0x380
> +#define MC_LATENCY_ALLOWANCE_TSEC_0				0x390
> +#define MC_LATENCY_ALLOWANCE_VIC_0				0x394
> +#define MC_LATENCY_ALLOWANCE_VI2_0				0x398
> +#define MC_LATENCY_ALLOWANCE_GPU_0				0x3ac
> +#define MC_LATENCY_ALLOWANCE_SDMMCA_0				0x3b8
> +#define MC_LATENCY_ALLOWANCE_SDMMCAA_0				0x3bc
> +#define MC_LATENCY_ALLOWANCE_SDMMC_0				0x3c0
> +#define MC_LATENCY_ALLOWANCE_SDMMCAB_0				0x3c4
> +#define MC_LATENCY_ALLOWANCE_GPU2_0				0x3e8
> +#define MC_LATENCY_ALLOWANCE_NVDEC_0				0x3d8
> +#define MC_MLL_MPCORER_PTSA_RATE				0x44c
> +#define MC_FTOP_PTSA_RATE					0x50c
> +#define MC_EMEM_ARB_TIMING_RFCPB				0x6c0
> +#define MC_EMEM_ARB_TIMING_CCDMW				0x6c4
> +#define MC_EMEM_ARB_REFPB_HP_CTRL				0x6f0
> +#define MC_EMEM_ARB_REFPB_BANK_CTRL				0x6f4
> +#define MC_PTSA_GRANT_DECREMENT					0x960
> +#define MC_EMEM_ARB_DHYST_CTRL					0xbcc
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_0			0xbd0
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_1			0xbd4
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_2			0xbd8
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_3			0xbdc
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_4			0xbe0
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_5			0xbe4
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_6			0xbe8
> +#define MC_EMEM_ARB_DHYST_TIMEOUT_UTIL_7			0xbec...

Secondly, looks like it all is unused, hence just remove it.
