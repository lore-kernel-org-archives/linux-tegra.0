From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 10/12] clk: tegra: move fixed clocks to common file
Date: Mon, 23 Sep 2013 12:34:48 -0600
Message-ID: <524089C8.4010108@wwwdotorg.org>
References: <1379515331-19427-1-git-send-email-pdeschrijver@nvidia.com>
 <1379515331-19427-11-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1379515331-19427-11-git-send-email-pdeschrijver@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, Mike Turquette <mturquette@linaro.org>, Thierry Reding <thierry.reding@avionic-design.de>, linux-kernel@vger.kernel.org, Paul Walmsley <pwalmsley@nvidia.com>, Joseph Lo <josephl@nvidia.com>, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 09/18/2013 08:41 AM, Peter De Schrijver wrote:
> Introduce a new file for fixed clocks common between several Tegra
> SoCs and move Tegra114 to this new infrastructure.

> diff --git a/drivers/clk/tegra/clk-tegra-fixed.c b/drivers/clk/tegra/clk-tegra-fixed.c

> +void __init tegra_fixed_clk_init(struct tegra_clk *tegra_clks)

> +	/* clk_m_div2 */
> +	dt_clk = tegra_lookup_dt_id(tegra_clk_clk_m_div2, tegra_clks);
> +	if (dt_clk) {
> +		clk = clk_register_fixed_factor(NULL, "clk_m_div2", "clk_m",
> +					CLK_SET_RATE_PARENT, 1, 2);
> +		clk_register_clkdev(clk, "clk_m_div2", NULL);
> +		*dt_clk = clk;
> +	}

I guess "fixed" means "fixed at run-time", not "identical rate in all
systems"? Since this is the crystal rate, it can vary between boards,
but I supposed if "fixed" means "fixed at run-time", considering this as
a fixed clock is fine.

But, isn't clk_m also a fixed clock then? I would expect one or two more
clocks in this file. What about clk_s, or is that known as clk_32k here?
