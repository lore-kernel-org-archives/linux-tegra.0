From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/3] soc/tegra: pmc: Add comments clarifying wake events
Date: Tue, 4 Jun 2019 17:31:54 +0100
Message-ID: <dc233c45-ca13-7a75-02a7-ebdd41a730a5@nvidia.com>
References: <20190604155135.25390-1-thierry.reding@gmail.com>
 <20190604155135.25390-3-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190604155135.25390-3-thierry.reding@gmail.com>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Bitan Biswas <bbiswas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 04/06/2019 16:51, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add some comments to clarify the purpose of the wake event support
> implemented in the PMC driver.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 6e66b5e293be..af8f63a844cd 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -241,6 +241,11 @@ struct tegra_pmc_soc {
>  	const char * const *reset_levels;
>  	unsigned int num_reset_levels;
>  
> +	/*
> +	 * These describe events that can wake the system from sleep (i.e.
> +	 * LP0 or SC7). Wakeup from other sleep states (such as LP1 or LP2)
> +	 * are dealt with in the LIC.
> +	 */
>  	const struct tegra_wake_event *wake_events;
>  	unsigned int num_wake_events;
>  };
> @@ -1906,6 +1911,11 @@ static int tegra_pmc_irq_alloc(struct irq_domain *domain, unsigned int virq,
>  		}
>  	}
>  
> +	/*
> +	 * For interrupts that don't have associated wake events, assign a
> +	 * dummy hardware IRQ number. This is used in the ->irq_set_type()
> +	 * and ->irq_set_wake() callbacks to return early for these IRQs.
> +	 */
>  	if (i == soc->num_wake_events)
>  		err = irq_domain_set_hwirq_and_chip(domain, virq, ULONG_MAX,
>  						    &pmc->irq, pmc);
> @@ -1924,6 +1934,7 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  	unsigned int offset, bit;
>  	u32 value;
>  
> +	/* nothing to do if there's no associated wake event */
>  	if (WARN_ON(data->hwirq == ULONG_MAX))
>  		return 0;
>  
> @@ -1954,6 +1965,7 @@ static int tegra_pmc_irq_set_type(struct irq_data *data, unsigned int type)
>  	struct tegra_pmc *pmc = irq_data_get_irq_chip_data(data);
>  	u32 value;
>  
> +	/* nothing to do if there's no associated wake event */
>  	if (data->hwirq == ULONG_MAX)
>  		return 0;
>  

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic
