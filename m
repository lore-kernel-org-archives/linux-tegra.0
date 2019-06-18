From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH V3 01/17] irqchip: tegra: do not disable COP IRQ during
 suspend
Date: Tue, 18 Jun 2019 10:19:31 +0100
Message-ID: <dc4b60ae-8716-0e7e-4e41-431c0ef9f50f@arm.com>
References: <1560843991-24123-1-git-send-email-skomatineni@nvidia.com>
 <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1560843991-24123-2-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, digetx@gmail.com, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

On 18/06/2019 08:46, Sowjanya Komatineni wrote:
> Tegra210 platforms use sc7 entry firmware to program Tegra LP0/SC7 entry
> sequence and sc7 entry firmware is run from COP/BPMP-Lite.
> 
> So, COP/BPMP-Lite still need IRQ function to finish SC7 suspend sequence
> for Tegra210.
> 
> This patch has fix for leaving the COP IRQ enabled for Tegra210 during
> interrupt controller suspend operation.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/irqchip/irq-tegra.c | 21 +++++++++++++++++++--
>  1 file changed, 19 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-tegra.c b/drivers/irqchip/irq-tegra.c
> index e1f771c72fc4..cf0c07052064 100644
> --- a/drivers/irqchip/irq-tegra.c
> +++ b/drivers/irqchip/irq-tegra.c
> @@ -44,18 +44,22 @@ static unsigned int num_ictlrs;
>  
>  struct tegra_ictlr_soc {
>  	unsigned int num_ictlrs;
> +	bool supports_sc7;
>  };
>  
>  static const struct tegra_ictlr_soc tegra20_ictlr_soc = {
>  	.num_ictlrs = 4,
> +	.supports_sc7 = false,

nit: that's the default for a statically initialized structure.

>  };
>  
>  static const struct tegra_ictlr_soc tegra30_ictlr_soc = {
>  	.num_ictlrs = 5,
> +	.supports_sc7 = false,
>  };
>  
>  static const struct tegra_ictlr_soc tegra210_ictlr_soc = {
>  	.num_ictlrs = 6,
> +	.supports_sc7 = true,
>  };
>  
>  static const struct of_device_id ictlr_matches[] = {
> @@ -67,6 +71,7 @@ static const struct of_device_id ictlr_matches[] = {
>  
>  struct tegra_ictlr_info {
>  	void __iomem *base[TEGRA_MAX_NUM_ICTLRS];
> +	const struct tegra_ictlr_soc *soc;
>  #ifdef CONFIG_PM_SLEEP
>  	u32 cop_ier[TEGRA_MAX_NUM_ICTLRS];
>  	u32 cop_iep[TEGRA_MAX_NUM_ICTLRS];
> @@ -147,8 +152,19 @@ static int tegra_ictlr_suspend(void)
>  		lic->cop_ier[i] = readl_relaxed(ictlr + ICTLR_COP_IER);
>  		lic->cop_iep[i] = readl_relaxed(ictlr + ICTLR_COP_IEP_CLASS);
>  
> -		/* Disable COP interrupts */
> -		writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);
> +		/*
> +		 * AVP/COP/BPMP-Lite is the Tegra boot processor.
> +		 *
> +		 * Tegra210 system suspend flow uses sc7entry firmware which
> +		 * is executed by COP/BPMP and it includes disabling COP IRQ,
> +		 * clamping CPU rail, turning off VDD_CPU, and preparing the
> +		 * system to go to SC7/LP0.
> +		 *
> +		 * COP/BPMP wakes up when COP IRQ is triggered and runs
> +		 * sc7entry-firmware. So need to keep COP interrupt enabled.

It is great that you're describing what happens when the system does
support this SC7 thing...

> +		 */
> +		if (!lic->soc->supports_sc7)
> +			writel_relaxed(~0ul, ictlr + ICTLR_COP_IER_CLR);

Except that the code actually deals with *not* having this SC7, and
you've deleted the one line of comment that was explaining it.

>  
>  		/* Disable CPU interrupts */
>  		writel_relaxed(~0ul, ictlr + ICTLR_CPU_IER_CLR);
> @@ -339,6 +355,7 @@ static int __init tegra_ictlr_init(struct device_node *node,
>  		goto out_unmap;
>  	}
>  
> +	lic->soc = soc;
>  	tegra_ictlr_syscore_init();
>  
>  	pr_info("%pOF: %d interrupts forwarded to %pOF\n",
> 

Otherwise looks OK to me.

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
