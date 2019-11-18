From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 3/3] soc/tegra: pmc: Add reset sources and levels on
 Tegra194
Date: Mon, 18 Nov 2019 13:58:27 +0000
Message-ID: <e456de2e-4ca4-b855-fd38-92518cca1021@nvidia.com>
References: <20191118063348.1816857-3-thierry.reding@gmail.com>
 <20191118131058.2336829-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191118131058.2336829-1-thierry.reding@gmail.com>
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


On 18/11/2019 13:10, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra194 supports the same reset levels as Tegra186 but extends the set
> of reset sources. Provide custom PMC register definitions to account for
> the larger field for the reset sources as well as the updated list of
> reset sources.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - use the new Tegra194 register definitions
> 
>  drivers/soc/tegra/pmc.c | 43 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index 1916899d09a3..ea0e11a09c12 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -2926,6 +2926,43 @@ static const struct tegra_io_pad_soc tegra194_io_pads[] = {
>  	{ .id = TEGRA_IO_PAD_AUDIO_HV, .dpd = 61, .voltage = UINT_MAX },
>  };
>  
> +static const struct tegra_pmc_regs tegra194_pmc_regs = {
> +	.scratch0 = 0x2000,
> +	.dpd_req = 0x74,
> +	.dpd_status = 0x78,
> +	.dpd2_req = 0x7c,
> +	.dpd2_status = 0x80,
> +	.rst_status = 0x70,
> +	.rst_source_shift = 0x2,
> +	.rst_source_mask = 0x7c,
> +	.rst_level_shift = 0x0,
> +	.rst_level_mask = 0x3,
> +};
> +
> +static const char * const tegra194_reset_sources[] = {
> +	"SYS_RESET_N",
> +	"AOWDT",
> +	"BCCPLEXWDT",
> +	"BPMPWDT",
> +	"SCEWDT",
> +	"SPEWDT",
> +	"APEWDT",
> +	"LCCPLEXWDT",
> +	"SENSOR",
> +	"AOTAG",
> +	"VFSENSOR",
> +	"MAINSWRST",
> +	"SC7",
> +	"HSM",
> +	"CSITE",
> +	"RCEWDT",
> +	"PVA0WDT",
> +	"PVA1WDT",
> +	"L1A_ASYNC",
> +	"BPMPBOOT",
> +	"FUSECRC",
> +};
> +
>  static const struct tegra_wake_event tegra194_wake_events[] = {
>  	TEGRA_WAKE_GPIO("power", 29, 1, TEGRA194_AON_GPIO(EE, 4)),
>  	TEGRA_WAKE_IRQ("rtc", 73, 10),
> @@ -2943,11 +2980,15 @@ static const struct tegra_pmc_soc tegra194_pmc_soc = {
>  	.maybe_tz_only = false,
>  	.num_io_pads = ARRAY_SIZE(tegra194_io_pads),
>  	.io_pads = tegra194_io_pads,
> -	.regs = &tegra186_pmc_regs,
> +	.regs = &tegra194_pmc_regs,
>  	.init = NULL,
>  	.setup_irq_polarity = tegra186_pmc_setup_irq_polarity,
>  	.irq_set_wake = tegra186_pmc_irq_set_wake,
>  	.irq_set_type = tegra186_pmc_irq_set_type,
> +	.reset_sources = tegra194_reset_sources,
> +	.num_reset_sources = ARRAY_SIZE(tegra194_reset_sources),
> +	.reset_levels = tegra186_reset_levels,
> +	.num_reset_levels = ARRAY_SIZE(tegra186_reset_levels),
>  	.num_wake_events = ARRAY_SIZE(tegra194_wake_events),
>  	.wake_events = tegra194_wake_events,
>  };
> 

Acked-by: Jon Hunter <jonthanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
