From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH v4 6/9] clk: tegra: add clock support for tegra20
Date: Fri, 11 Jan 2013 13:54:07 -0700
Message-ID: <50F07BEF.1080208@wwwdotorg.org>
References: <1357890387-23245-1-git-send-email-pgaikwad@nvidia.com> <1357890387-23245-7-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1357890387-23245-7-git-send-email-pgaikwad@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: mturquette@linaro.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 01/11/2013 12:46 AM, Prashant Gaikwad wrote:
> Add tegra20 clock support based on common clock framework.

> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile

> +static void tegra20_pll_init(void)

> +	/* PLLE */
> +	clk = tegra_clk_plle("pll_e", "pll_ref", clk_base, NULL,
> +			     0, 1000000000, &pll_e_params,
> +			     0, pll_e_freq_table, NULL);

That 1000000000 (1GHz) needs to be 100000000 (100MHz). I can fix that up
when applying this.

With that change, everything I tested with this version of the series
works:-)
