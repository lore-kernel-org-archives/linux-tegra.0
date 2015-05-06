From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH] clk: tegra: Update struct tegra_clk_pll_params kerneldoc
Date: Wed, 6 May 2015 10:49:16 -0700
Message-ID: <CANLzEku9EyDh3dXMqK=ZLNb1F5tMvnnmgDRyJYQ16_6vLCDiKA@mail.gmail.com>
References: <CANLzEktaOSEFjszR6sRe4heQkp6H_eGi5aKEg8zeLCzaQMMVjQ@mail.gmail.com>
	<1430919815-22380-1-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430919815-22380-1-git-send-email-thierry.reding@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rhyland Klein <rklein@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Stephen Warren <swarren@wwwdotorg.org>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, May 6, 2015 at 6:43 AM, Thierry Reding <thierry.reding@gmail.com> wrote:
> From: Thierry Reding <treding@nvidia.com>
>
> Benson Leung pointed out that the kerneldoc for this structure has
> become stale. Update the field descriptions to match the structure
> content.
>
> Reported-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/clk/tegra/clk.h | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index f3782dedbdfb..c47e633616be 100644
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
> @@ -168,12 +168,22 @@ struct div_nmp {
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


Missed a couple -

@max_p:
@pdiv_tohw:

Thanks!

-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
