From: Rhyland Klein <rklein-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v4 19/20] clk: tegra210: add support for Tegra210 clocks
Date: Thu, 7 May 2015 12:07:24 -0400
Message-ID: <554B8DBC.9010001@nvidia.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com> <1430757460-9478-20-git-send-email-rklein@nvidia.com> <554B40D7.3040207@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <554B40D7.3040207-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jim Lin <jilin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Boyd <sboyd-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 5/7/2015 6:39 AM, Jim Lin wrote:
> On 05/05/2015 12:37 AM, Rhyland Klein wrote:
>> diff --git a/drivers/clk/tegra/clk-tegra210.c b/drivers/clk/tegra/clk-tegra210.c
>> new file mode 100644
>> index 000000000000..07382a473e22
>> --- /dev/null
>> +++ b/drivers/clk/tegra/clk-tegra210.c
>> @@ -0,0 +1,2761 @@
>> +/*
>> + * Copyright (c) 2012-2014 NVIDIA CORPORATION.  All rights reserved.
>> + *
>> + * This program is free software; you can redistribute it and/or modify it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope it will be useful, but WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program.  If not, see <http://www.gnu.org/licenses/>.
>> + */
>> +
>> +#include <linux/io.h>
>> +#include <linux/clk.h>
>> +#include <linux/clk-provider.h>
>> +#include <linux/clkdev.h>
>> +#include <linux/of.h>
>> +#include <linux/of_address.h>
>> +#include <linux/delay.h>
>> +#include <linux/export.h>
>> +#include <linux/clk/tegra.h>
>> +#include <dt-bindings/clock/tegra210-car.h>
>> +
>> +#include "clk.h"
>> +#include "clk-id.h"
>> +
>> +/*
>> + * TEGRA210_CAR_BANK_COUNT: the number of peripheral clock register
>> + * banks present in the Tegra210 CAR IP block.  The banks are
>> + * identified by single letters, e.g.: L, H, U, V, W, X, Y.  See
>> + * periph_regs[] in drivers/clk/tegra/clk.c
>> + */
>> +#define TEGRA210_CAR_BANK_COUNT			7
>> +
>> +#define CLK_SOURCE_CSITE 0x1d4
>> +#define CLK_SOURCE_EMC 0x19c
>> +
>> +#define PLLC_BASE 0x80
>> +#define PLLC_OUT 0x84
>> +#define PLLC_MISC0 0x88
>> +#define PLLC_MISC1 0x8c
>> +#define PLLC_MISC2 0x5d0
>> +#define PLLC_MISC3 0x5d4
>> +
>> +#define PLLC2_BASE 0x4e8
>> +#define PLLC2_MISC0 0x4ec
>> +#define PLLC2_MISC1 0x4f0
>> +#define PLLC2_MISC2 0x4f4
>> +#define PLLC2_MISC3 0x4f8
>> +
>> +#define PLLC3_BASE 0x4fc
>> +#define PLLC3_MISC0 0x500
>> +#define PLLC3_MISC1 0x504
>> +#define PLLC3_MISC2 0x508
>> +#define PLLC3_MISC3 0x50c
>> +
>> +#define PLLM_BASE 0x90
>> +#define PLLM_MISC0 0x9c
>> +#define PLLM_MISC1 0x98
>> +#define PLLP_BASE 0xa0
>> +#define PLLP_MISC0 0xac
>> +#define PLLP_MISC1 0x680
>> +#define PLLA_BASE 0xb0
>> +#define PLLA_MISC0 0xbc
>> +#define PLLA_MISC1 0xb8
>> +#define PLLA_MISC2 0x5d8
>> +#define PLLD_BASE 0xd0
>> +#define PLLD_MISC0 0xdc
>> +#define PLLD_MISC1 0xd8
>> +#define PLLU_BASE 0xc0
>> +#define PLLU_OUTA 0xc4
>> +#define PLLU_MISC0 0xcc
>> +#define PLLU_MISC1 0xc8
>> +#define PLLX_BASE 0xe0
>> +#define PLLX_MISC0 0xe4
>> +#define PLLX_MISC1 0x510
>> +#define PLLX_MISC2 0x514
>> +#define PLLX_MISC3 0x518
>> +#define PLLX_MISC4 0x5f0
>> +#define PLLX_MISC5 0x5f4
>> +#define PLLE_BASE 0xe8
>> +#define PLLE_MISC0 0xec
>> +#define PLLD2_BASE 0x4b8
>> +#define PLLD2_MISC0 0x4bc
>> +#define PLLD2_MISC1 0x570
>> +#define PLLD2_MISC2 0x574
>> +#define PLLD2_MISC3 0x578
>> +#define PLLE_AUX 0x48c
>> +#define PLLRE_BASE 0x4c4
>> +#define PLLRE_MISC0 0x4c8
>> +#define PLLDP_BASE 0x590
>> +#define PLLDP_MISC 0x594
>> +
>> +#define PLLC4_BASE 0x5a4
>> +#define PLLC4_MISC0 0x5a8
>> +#define PLLC4_OUT 0x5e4
>> +#define PLLMB_BASE 0x5e8
>> +#define PLLMB_MISC0 0x5ec
>> +#define PLLA1_BASE 0x6a4
>> +#define PLLA1_MISC0 0x6a8
>> +#define PLLA1_MISC1 0x6ac
>> +#define PLLA1_MISC2 0x6b0
>> +#define PLLA1_MISC3 0x6b4
>> +
>> +#define PLLU_IDDQ_BIT 31
>> +#define PLLCX_IDDQ_BIT 27
>> +#define PLLRE_IDDQ_BIT 24
>> +#define PLLA_IDDQ_BIT 25
>> +#define PLLD_IDDQ_BIT 20
>> +#define PLLSS_IDDQ_BIT 18
>> +#define PLLM_IDDQ_BIT 5
>> +#define PLLMB_IDDQ_BIT 17
>> +#define PLLXP_IDDQ_BIT 3
>> +
>> +#define PLLCX_RESET_BIT 30
>> +
>> +#define PLL_BASE_LOCK BIT(27)
>> +#define PLLCX_BASE_LOCK BIT(26)
>> +#define PLLE_MISC_LOCK BIT(11)
>> +#define PLLRE_MISC_LOCK BIT(27)
>> +
>> +#define PLL_MISC_LOCK_ENABLE 18
>> +#define PLLC_MISC_LOCK_ENABLE 24
>> +#define PLLDU_MISC_LOCK_ENABLE 22
>> +#define PLLU_MISC_LOCK_ENABLE 29
>> +#define PLLE_MISC_LOCK_ENABLE 9
>> +#define PLLRE_MISC_LOCK_ENABLE 30
>> +#define PLLSS_MISC_LOCK_ENABLE 30
>> +#define PLLP_MISC_LOCK_ENABLE 18
>> +#define PLLM_MISC_LOCK_ENABLE 4
>> +#define PLLMB_MISC_LOCK_ENABLE 16
>> +#define PLLA_MISC_LOCK_ENABLE 28
>> +#define PLLU_MISC_LOCK_ENABLE 29
>> +#define PLLD_MISC_LOCK_ENABLE 18
>> +
>> +#define PLLA_SDM_DIN_MASK 0xffff
>> +#define PLLA_SDM_EN_MASK BIT(26)
>> +
>> +#define PLLD_SDM_EN_MASK BIT(16)
>> +
>> +#define PLLD2_SDM_EN_MASK BIT(31)
>> +#define PLLD2_SSC_EN_MASK BIT(30)
>> +
>> +#define PLLDP_SS_CFG	0x598
>> +#define PLLDP_SDM_EN_MASK BIT(31)
>> +#define PLLDP_SSC_EN_MASK BIT(30)
>> +#define PLLDP_SS_CTRL1	0x59c
>> +#define PLLDP_SS_CTRL2	0x5a0
>> +
>> +#define PMC_PLLM_WB0_OVERRIDE 0x1dc
>> +#define PMC_PLLM_WB0_OVERRIDE_2 0x2b0
>> +
>> +#define UTMIP_PLL_CFG2 0x488
>> +#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xffff) << 6)
> This line should be corrected as
> 
> +#define UTMIP_PLL_CFG2_STABLE_COUNT(x) (((x) & 0xfff) << 6)
> 
> STABLE_COUNT has 12 bits.

Indeed, good catch!

> 
>> +#define UTMIP_PLL_CFG2_ACTIVE_DLY_COUNT(x) (((x) & 0x3f) << 18)
>> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_A_POWERDOWN BIT(0)
>> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_B_POWERDOWN BIT(2)
>> +#define UTMIP_PLL_CFG2_FORCE_PD_SAMP_C_POWERDOWN BIT(4)
>> +
>> +#define UTMIP_PLL_CFG1 0x484
>> +#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 6)
> This line should be corrected as
> 
> +#define UTMIP_PLL_CFG1_ENABLE_DLY_COUNT(x) (((x) & 0x1f) << 27)
> 
> ENABLE_DLY_COUNT starts from bit 27.
> 
> 
Yep. Thanks Jim!

-rhyland

> 
> --nvpublic
> 


-- 
nvpublic
