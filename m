From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 06/12] clk: tegra: add common infra for DT clocks
Date: Mon, 23 Sep 2013 12:16:18 -0600
Message-ID: <52408572.2030907@wwwdotorg.org>
References: <1379515331-19427-1-git-send-email-pdeschrijver@nvidia.com> <1379515331-19427-7-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1379515331-19427-7-git-send-email-pdeschrijver@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Mike Turquette <mturquette@linaro.org>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@avionic-design.de>, Joseph Lo <josephl@nvidia.com>, Paul Walmsley <pwalmsley@nvidia.com>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 09/18/2013 08:40 AM, Peter De Schrijver wrote:
> Introduce a common infrastructure for registering DT IDs for tegra clocks and
> sharing clock initialization between SoCs. Move Tegra114 to this new
> infrastructure.

> diff --git a/drivers/clk/tegra/clk-tegra114.c b/drivers/clk/tegra/clk-tegra114.c

> +static struct tegra_clk __initdata tegra114_clks[tegra_clk_max] = {
> +	[tegra_clk_rtc] = { .dt_id = TEGRA114_CLK_RTC, .present = true },
> +	[tegra_clk_timer] = { .dt_id = TEGRA114_CLK_TIMER, .present = true },

It seems rather odd for a patch that adds "common infrastructure" to be
adding a Tegra114-specific table of clock IDs, especially since this new
table isn't actually used at all. I think I would expect a separate
patch for the common infra-structure and the Tegra114-specific table.
Hopefully there will be Tegra20-/30-specific tables added too in that
second patch?
