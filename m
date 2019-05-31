From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/2] soc/tegra: pmc: Avoid crash for non-wake IRQs
Date: Fri, 31 May 2019 10:32:40 +0100
Message-ID: <27ffbfe6-1c88-63a1-aee1-7fe6ce252e54@nvidia.com>
References: <20190529102654.14665-1-thierry.reding@gmail.com>
 <20190529102654.14665-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190529102654.14665-2-thierry.reding@gmail.com>
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



On 29/05/2019 11:26, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> For interrupts that are not wakeup sources but that may end up getting
> mapped through the PMC as interrupt parent (this can happen for GPIOs),
> return early in order to avoid a subsequent crash from an out-of-bounds
> access to the register region.

Maybe worth clarifying here what you mean by 'not wakeup sources'
because the Tegra GPIO driver does have a set_wake() API to enable
wakeup at the LIC IIRC. So maybe GPIOs that are not wakeup sources for
what level of suspend?

> Reported-by: Bitan Biswas <bbiswas@nvidia.com>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 653fe2c466f6..6e66b5e293be 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -1924,6 +1924,9 @@ static int tegra_pmc_irq_set_wake(struct irq_data *data, unsigned int on)
>  	unsigned int offset, bit;
>  	u32 value;
>  
> +	if (WARN_ON(data->hwirq == ULONG_MAX))
> +		return 0;
> +
>  	offset = data->hwirq / 32;
>  	bit = data->hwirq % 32;

Otherwise ...

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon


-- 
nvpublic
