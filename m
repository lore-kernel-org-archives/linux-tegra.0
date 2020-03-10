From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 3/8] clk: tegra: Implement Tegra210 EMC clock
Date: Tue, 10 Mar 2020 19:29:42 +0300
Message-ID: <3b583202-50d0-145c-d60f-91bd646008ad@gmail.com>
References: <20200310152003.2945170-1-thierry.reding@gmail.com>
 <20200310152003.2945170-4-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-clk-owner@vger.kernel.org>
In-Reply-To: <20200310152003.2945170-4-thierry.reding@gmail.com>
Content-Language: en-US
Sender: linux-clk-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Joseph Lo <josephl@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

10.03.2020 18:19, Thierry Reding пишет:
> From: Joseph Lo <josephl@nvidia.com>
> 
> The EMC clock needs to carefully coordinate with the EMC controller
> programming to make sure external memory can be properly clocked. Do so
> by hooking up the EMC clock with an EMC provider that will specify which
> rates are supported by the EMC and provide a callback to use for setting
> the clock rate at the EMC.
> 
> Based on work by Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v5:
> - major rework and cleanup

...
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_attach);
> +
> +void tegra210_clk_emc_detach(struct clk *clk)
> +{
> +	struct tegra210_clk_emc *emc = to_tegra210_clk_emc(__clk_get_hw(clk));
> +
> +	emc->provider = NULL;
> +}
> +EXPORT_SYMBOL_GPL(tegra210_clk_emc_detach);...
> +config TEGRA210_EMC
> +	bool "NVIDIA Tegra210 External Memory Controller driver"


I'd remove all the exports for now, given that the driver is built-in.
