From: Peter De Schrijver <pdeschrijver@nvidia.com>
Subject: Re: [PATCH v4 0/4] Multiplex sdmmc low jitter clock path
Date: Tue, 10 Jul 2018 10:00:49 +0300
Message-ID: <20180710070049.GH27696@tbergstrom-lnx.Nvidia.com>
References: <1531154338-3998-1-git-send-email-avienamo@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1531154338-3998-1-git-send-email-avienamo@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Aapo Vienamo <avienamo@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Series Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

Peter.

On Mon, Jul 09, 2018 at 07:38:54PM +0300, Aapo Vienamo wrote:
> The SDMMC clocks have a Low Jitter (LJ) clock path which bypasses a
> divider to achieve better jitter performance with high speed signaling
> modes. The clock path with the divider is needed by some of the slower
> signaling modes. This series automatically multiplexes the LJ and
> non-LJ clock paths based on the requested frequency.
> 
> Changelog:
> v4:
> 	- Add a changelog
> 
> v3:
> 	- Use <asm/div64.h> include instead of <linux/kernel.h> for
> 	  do_div()
> 	- Use SPDX tags for new files
> 	- Make mux_lj_idx[] and mux_non_lj_idx[] const
> 	- Make tegra_clk_sdmmc_mux_ops static
> 	- Fix the includes for fence_udelay() in a separate patch
> 
> v2:
> 	- Fix the type compatibility error on do_div
> 
> Aapo Vienamo (1):
>   clk: tegra: Fix includes required by fence_udelay()
> 
> Peter De Schrijver (1):
>   clk: tegra: refactor 7.1 div calculation
> 
> Peter De-Schrijver (2):
>   clk: tegra: Add sdmmc mux divider clock
>   clk: tegra: make sdmmc2 and sdmmc4 as sdmmc clocks
> 
>  drivers/clk/tegra/Makefile           |   2 +
>  drivers/clk/tegra/clk-divider.c      |  30 +----
>  drivers/clk/tegra/clk-id.h           |   2 -
>  drivers/clk/tegra/clk-sdmmc-mux.c    | 250 +++++++++++++++++++++++++++++++++++
>  drivers/clk/tegra/clk-tegra-periph.c |  11 --
>  drivers/clk/tegra/clk-tegra210.c     |  14 +-
>  drivers/clk/tegra/clk.h              |  30 +++++
>  drivers/clk/tegra/div71.c            |  43 ++++++
>  8 files changed, 342 insertions(+), 40 deletions(-)
>  create mode 100644 drivers/clk/tegra/clk-sdmmc-mux.c
>  create mode 100644 drivers/clk/tegra/div71.c
> 
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
