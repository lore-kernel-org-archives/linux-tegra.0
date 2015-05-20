From: Michael Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v2] clk: tegra: Update struct tegra_clk_pll_params kerneldoc
Date: Tue, 19 May 2015 20:39:56 -0700
Message-ID: <20150520033956.9817.55602@quantum>
References: <1430919815-22380-1-git-send-email-thierry.reding@gmail.com>
 <1431012219-28469-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431012219-28469-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Benson Leung <bleung@chromium.org>, Rhyland Klein <rklein@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Quoting Thierry Reding (2015-05-07 08:23:39)
> From: Thierry Reding <treding@nvidia.com>
> 
> Benson Leung pointed out that the kerneldoc for this structure has
> become stale. Update the field descriptions to match the structure
> content.
> 
> Reported-by: Benson Leung <bleung@chromium.org>
> Acked-by: Rhyland Klein <rklein@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Looks good to me.

Regards,
Mike

> ---
> Changes in v2:
> - document max_p and pdiv_tohw fields
> 
>  drivers/clk/tegra/clk.h | 18 +++++++++++++++---
>  1 file changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index f3782dedbdfb..b76b786e15f6 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -157,7 +157,7 @@ struct div_nmp {
>  };
>  
>  /**
> - * struct clk_pll_params - PLL parameters
> + * struct tegra_clk_pll_params - PLL parameters
>   *
>   * @input_min:                 Minimum input frequency
>   * @input_max:                 Maximum input frequency
> @@ -168,12 +168,24 @@ struct div_nmp {
>   * @base_reg:                  PLL base reg offset
>   * @misc_reg:                  PLL misc reg offset
>   * @lock_reg:                  PLL lock reg offset
> - * @lock_bit_idx:              Bit index for PLL lock status
> + * @lock_mask:                 Bitmask for PLL lock status
>   * @lock_enable_bit_idx:       Bit index to enable PLL lock
> + * @iddq_reg:                  PLL IDDQ register offset
> + * @iddq_bit_idx:              Bit index to enable PLL IDDQ
> + * @aux_reg:                   AUX register offset
> + * @dyn_ramp_reg:              Dynamic ramp control register offset
> + * @ext_misc_reg:              Miscellaneous control register offsets
> + * @pmc_divnm_reg:             n, m divider PMC override register offset (PLLM)
> + * @pmc_divp_reg:              p divider PMC override register offset (PLLM)
> + * @flags:                     PLL flags
> + * @stepa_shift:               Dynamic ramp step A field shift
> + * @stepb_shift:               Dynamic ramp step B field shift
>   * @lock_delay:                        Delay in us if PLL lock is not used
> + * @max_p:                     maximum value for the p divider
> + * @pdiv_tohw:                 mapping of p divider to register values
> + * @div_nmp:                   offsets and widths on n, m and p fields
>   * @freq_table:                        array of frequencies supported by PLL
>   * @fixed_rate:                        PLL rate if it is fixed
> - * @flags:                     PLL flags
>   *
>   * Flags:
>   * TEGRA_PLL_USE_LOCK - This flag indicated to use lock bits for
> -- 
> 2.3.5
> 
