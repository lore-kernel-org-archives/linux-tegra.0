From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 2/4] ARM: tegra: Fix DRAM refresh-interval clobbering
 on resume from LP1 on Tegra30
Date: Tue, 20 Nov 2018 10:27:51 +0000
Message-ID: <0f032d8b-60d3-57fd-6f25-5b7b667e0636@nvidia.com>
References: <20180830185404.7224-1-digetx@gmail.com>
 <20180830185404.7224-3-digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830185404.7224-3-digetx@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 30/08/2018 19:54, Dmitry Osipenko wrote:
> The DRAM refresh-interval is getting erroneously set to "1" on exiting
> from memory self-refreshing mode. The clobbered interval causes the
> "refresh request overflow timeout" error raised by the External Memory
> Controller on exiting from LP1 on Tegra30.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  arch/arm/mach-tegra/sleep-tegra30.S | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
> index 801fe58978ae..99ac9c6dcf7c 100644
> --- a/arch/arm/mach-tegra/sleep-tegra30.S
> +++ b/arch/arm/mach-tegra/sleep-tegra30.S
> @@ -29,7 +29,6 @@
>  #define EMC_CFG				0xc
>  #define EMC_ADR_CFG			0x10
>  #define EMC_TIMING_CONTROL		0x28
> -#define EMC_REFRESH			0x70
>  #define EMC_NOP				0xdc
>  #define EMC_SELF_REF			0xe0
>  #define EMC_MRW				0xe8
> @@ -459,7 +458,6 @@ emc_wait_auto_cal_onetime:
>  	cmp	r10, #TEGRA30
>  	streq	r1, [r0, #EMC_NOP]
>  	streq	r1, [r0, #EMC_NOP]
> -	streq	r1, [r0, #EMC_REFRESH]
>  
>  	emc_device_mask r1, r0

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
