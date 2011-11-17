From: Stephen Warren <swarren@nvidia.com>
Subject: RE: [PATCH 09/10] arm/tegra: implement support for tegra30
Date: Thu, 17 Nov 2011 11:50:40 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF1740D74C51@HQMAIL01.nvidia.com>
References: <1321546766-26770-1-git-send-email-pdeschrijver@nvidia.com>
 <1321546766-26770-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-doc-owner@vger.kernel.org>
In-Reply-To: <1321546766-26770-10-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Randy Dunlap <rdunlap@xenotime.net>, Russell King <linux@arm.linux.org.uk>, Colin Cross <ccross@android.com>, Olof Johansson <olof@lixom.net>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

Peter De Schrijver wrote at Thursday, November 17, 2011 9:19 AM:
> Add support for tegra30 SoC. This includes a device tree compatible type for
> this SoC ("nvidia,tegra30") and adds L2 cache initialization for this new SoC.
> The clock framework is still missing, which prevents most drivers from working.
> The basic IRQs are the same, so remove the dependency on
> CONFIG_ARCH_TEGRA_2x_SOC.

> diff --git a/arch/arm/mach-tegra/board-dt.c b/arch/arm/mach-tegra/board-dt.c
> index 416446b..0b9d184 100644
> --- a/arch/arm/mach-tegra/board-dt.c
> +++ b/arch/arm/mach-tegra/board-dt.c
> @@ -149,3 +149,11 @@ DT_MACHINE_START(TEGRA_DT, "nVidia Tegra20 (Flattened Device Tree)")
>  	.init_machine	= tegra_dt_init,
>  	.dt_compat	= tegra20_dt_board_compat,
>  MACHINE_END

Since you're reving the patch, a blank line between the two machines would
be nice.

> +DT_MACHINE_START(TEGRA30_DT, "nVidia Tegra30 (Flattened Device Tree)")
> +	.map_io		= tegra_map_common_io,
> +	.init_early	= tegra30_init_early,
> +	.init_irq	= tegra_init_irq,
> +	.timer		= &tegra_timer,
> +	.init_machine	= tegra_dt_init,
> +	.dt_compat	= tegra30_dt_board_compat,

That variable doesn't exist until the next patch; that'll break git bisect.

Do the two DT_MACHINE_START's need if be ifdef'd based on CONFIG variables too?
If not, I'm not sure how a Tegra20- or Tegra30-only kernel builds, since aren't
some of those init functions ifdef'd out but referenced here?

> +MACHINE_END

-- 
nvpublic

