From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 2/3] soc/tegra: pmc: Add missing IRQ callbacks on Tegra194
Date: Mon, 18 Nov 2019 11:50:57 +0000
Message-ID: <679f95e6-ea9f-2e6a-3010-fc716901b91b@nvidia.com>
References: <20191118063348.1816857-1-thierry.reding@gmail.com>
 <20191118063348.1816857-2-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191118063348.1816857-2-thierry.reding@gmail.com>
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
Cc: linux-tegra@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>, linux-arm-kernel@lists.infradead.org, Vidya Sagar <vidyas@nvidia.com>
List-Id: linux-tegra@vger.kernel.org


On 18/11/2019 06:33, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Reuse the IRQ callbacks from Tegra186 on Tegra194. This fixes failures
> to request interrupts on Tegra194 due to the missing callbacks.
> 
> Cc: Sowjanya Komatineni <skomatineni@nvidia.com>
> Fixes: aba19827fced ("soc/tegra: pmc: Support wake events on more Tegra SoCs")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 927eeecd34e5..32b3e8d9155f 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2947,6 +2947,8 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
>  	.regs = &tegra186_pmc_regs,
>  	.init = NULL,
>  	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
> +	.irq_set_wake = tegra186_pmc_irq_set_wake,
> +	.irq_set_type = tegra186_pmc_irq_set_type,
>  	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
>  	.wake_events = tegra194_wake_events,
>  };
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers!
Jon

-- 
nvpublic
