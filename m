From: Stephen Boyd <sboyd@codeaurora.org>
Subject: Re: [PATCH 2/2] clk: tegra: Initialize UTMIPLL when enabling PLLU
Date: Fri, 15 Apr 2016 16:49:03 -0700
Message-ID: <20160415234903.GA12052@codeaurora.org>
References: <1458590333-8898-1-git-send-email-rklein@nvidia.com>
 <1458590333-8898-2-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-clk-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1458590333-8898-2-git-send-email-rklein@nvidia.com>
Sender: linux-clk-owner@vger.kernel.org
To: Rhyland Klein <rklein@nvidia.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Alexandre Courbot <gnurou@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Andrew Bresticker <abrestic@chromium.org>
List-Id: linux-tegra@vger.kernel.org

On 03/21, Rhyland Klein wrote:
> +static int clk_pllu_enable(struct clk_hw *hw)
> +{
> +	struct tegra_clk_pll *pll = to_clk_pll(hw);
> +	struct clk *osc = __clk_lookup("osc");

Is there any way to _not_ use __clk_lookup() here? That function
is on my kill list, mostly because it can't handle probe defer
and is a hacky way to circumvent regular clk_get().

> +	unsigned long flags, input_rate;
> +	unsigned int i;
> +	int ret = 0;
> +	u32 val;
> +
> +	if (!osc) {

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
