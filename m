From: Benson Leung <bleung@chromium.org>
Subject: Re: [PATCH v5 17/21] clk: tegra: pll: Add logic for SS
Date: Wed, 13 May 2015 17:25:15 -0700
Message-ID: <CANLzEks10KmCAx4tK0oSejJ6Z+oBRS2+pcsktvStQrogCarTJQ@mail.gmail.com>
References: <1431451444-23155-1-git-send-email-rklein@nvidia.com>
	<1431451444-23155-19-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1431451444-23155-19-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, Stephen Boyd <sboyd@codeaurora.org>, Thierry Reding <thierry.reding@gmail.com>, Alexandre Courbot <gnurou@gmail.com>, Bill Huang <bilhuang@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, Jim Lin <jilin@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, May 12, 2015 at 10:24 AM, Rhyland Klein <rklein@nvidia.com> wrote:
> +static void pll_clk_start_ss(struct tegra_clk_pll *pll)
> +{
> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {

Is there any reason you're checking for the existence of
ssc_ctrl_en_mask rather than ssc_ctrl_reg?

> +               u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
> +
> +               val |= pll->params->ssc_ctrl_en_mask;
> +               pll_writel(val, pll->params->ssc_ctrl_reg, pll);
> +       }
> +}
> +
> +static void pll_clk_stop_ss(struct tegra_clk_pll *pll)
> +{
> +       if (pll->params->defaults_set && pll->params->ssc_ctrl_en_mask) {
> +               u32 val = pll_readl(pll->params->ssc_ctrl_reg, pll);
> +
> +               val &= ~pll->params->ssc_ctrl_en_mask;
> +               pll_writel(val, pll->params->ssc_ctrl_reg, pll);
> +       }
> +}
> +




-- 
Benson Leung
Software Engineer, Chrom* OS
bleung@chromium.org
