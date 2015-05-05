From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v4 11/20] clk: tegra: pll: Add code to handle if resets
 are supported by PLL
Date: Tue, 5 May 2015 10:15:47 -0700
Message-ID: <CANLzEkuzW3pZzu_B+LUd7rx81yA9=YwdPtttAUXqDLHFLokHBg@mail.gmail.com>
References: <1430757460-9478-1-git-send-email-rklein@nvidia.com>
	<1430757460-9478-12-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1430757460-9478-12-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Bill Huang <bilhuang@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Mon, May 4, 2015 at 9:37 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> From: Bill Huang <bilhuang@nvidia.com>
>
> If a PLL has a reset_reg specified, properly handle that in the
> enable/disable logic paths.
>
> Signed-off-by: Bill Huang <bilhuang@nvidia.com>

Minor nit to add kerneldoc for params. Otherwise, LGTM.

Reviewed-by: Benson Leung <bleung@chromium.org>

> diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> index b63ef31a2d7a..0146c91df635 100644
> --- a/drivers/clk/tegra/clk.h
> +++ b/drivers/clk/tegra/clk.h
> @@ -217,6 +217,8 @@ struct tegra_clk_pll_params {
>         u32             lock_enable_bit_idx;
>         u32             iddq_reg;
>         u32             iddq_bit_idx;
> +       u32             reset_reg;
> +       u32             reset_bit_idx;

Kerneldoc for these two.

>         u32             sdm_din_reg;
>         u32             sdm_din_mask;
>         u32             sdm_ctrl_reg;




-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
