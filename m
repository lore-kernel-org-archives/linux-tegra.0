From: Andrew Bresticker <abrestic@chromium.org>
Subject: Re: [PATCH v4 05/15] clk: tegra: move some PLLC and PLLXC init to clk-pll.c
Date: Thu, 17 Oct 2013 15:33:13 -0700
Message-ID: <CAL1qeaHsun=6NP4fk4tLCDr5XkLn71-y273Qz5hcfMagek3ZPQ@mail.gmail.com>
References: <1382013526-12800-1-git-send-email-pdeschrijver@nvidia.com>
	<1382013526-12800-6-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1382013526-12800-6-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Stephen Warren <swarren@wwwdotorg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-tegra@vger.kernel.org

Hi Peter,

> +       val = readl_relaxed(clk_base + pll_params->base_reg);
> +       val_iddq = readl_relaxed(clk_base + pll_params->iddq_reg);
> +
> +       if (val & BIT(30))

BIT(30) -> PLL_BASE_ENABLE?

> +               WARN_ON(val_iddq & BIT(pll_params->iddq_bit_idx));
> +       else {
> +               val_iddq |= BIT(pll_params->iddq_bit_idx);
> +               writel_relaxed(val_iddq, clk_base + pll_params->iddq_reg);
> +       }

Thanks,
Andrew
