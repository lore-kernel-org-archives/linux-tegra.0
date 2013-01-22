From: Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH] clk: tegra: add KBC clock for Tegra20
Date: Tue, 22 Jan 2013 10:23:40 -0800
Message-ID: <20130122182340.24671.64241@quantum>
References: <1357946262-25823-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1357946262-25823-1-git-send-email-swarren@wwwdotorg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: linux-tegra@vger.kernel.org, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Warren <swarren@nvidia.com>, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Quoting Stephen Warren (2013-01-11 15:17:42)
> From: Stephen Warren <swarren@nvidia.com>
> 
> This clock has been missing from all our upstream clock drivers. Add it
> by copying the tegra_clk_periph_gate() call from Tegra30; the data
> matches what's in the ChromeOS kernel for this clock.
> 
> Cc: Prashant Gaikwad <pgaikwad@nvidia.com>
> Cc: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Stephen Warren <swarren@nvidia.com>
> ---
> Mike, I'd need to apply this to the Tegra tree as part of the common
> clock framework conversion.
> 

Is this patch going to be rolled into patch 6/9 of the larger tegra ccf
series?

Thanks,
Mike

>  drivers/clk/tegra/clk-tegra20.c |    7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/clk/tegra/clk-tegra20.c b/drivers/clk/tegra/clk-tegra20.c
> index f40b6f7..5847b5e 100644
> --- a/drivers/clk/tegra/clk-tegra20.c
> +++ b/drivers/clk/tegra/clk-tegra20.c
> @@ -896,6 +896,13 @@ static void __init tegra20_periph_clk_init(void)
>         clk_register_clkdev(clk, NULL, "timer");
>         clks[timer] = clk;
>  
> +       /* kbc */
> +       clk = tegra_clk_periph_gate("kbc", "clk_32k", TEGRA_PERIPH_NO_RESET |
> +                                   TEGRA_PERIPH_ON_APB, clk_base, 0,
> +                                   36, &periph_h_regs, periph_clk_enb_refcnt);
> +       clk_register_clkdev(clk, NULL, "tegra-kbc");
> +       clks[kbc] = clk;
> +
>         /* csus */
>         clk = tegra_clk_periph_gate("csus", "clk_m", TEGRA_PERIPH_NO_RESET,
>                                     clk_base, 0, 92, &periph_u_regs,
> -- 
> 1.7.10.4
