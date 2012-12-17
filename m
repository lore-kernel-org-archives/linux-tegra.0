From: Stephen Warren <swarren@wwwdotorg.org>
Subject: Re: [PATCH 3/4] ARM: tegra: Add OF_DEV_AUXDATA for uart driver in
 board dt
Date: Mon, 17 Dec 2012 14:47:01 -0700
Message-ID: <50CF92D5.6090805@wwwdotorg.org>
References: <1355746101-15291-1-git-send-email-ldewangan@nvidia.com> <1355746101-15291-4-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1355746101-15291-4-git-send-email-ldewangan@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Prashant Gaikwad <pgaikwad@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 12/17/2012 05:08 AM, Laxman Dewangan wrote:
> Add OF_DEV_AUXDATA for high speed uart controller driver for
> Tegra20/Tegra30 board dt files.
> Set the parent clock of uart controller to PLLP.

> diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c

> @@ -94,6 +94,11 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {

> +	OF_DEV_AUXDATA("nvidia,tegra20-hsuart", 0x70006000, "tegra-uart.0", NULL),
> +	OF_DEV_AUXDATA("nvidia,tegra20-hsuart", 0x70006040, "tegra-uart.1", NULL),
> +	OF_DEV_AUXDATA("nvidia,tegra20-hsuart", 0x70006200, "tegra-uart.2", NULL),
> +	OF_DEV_AUXDATA("nvidia,tegra20-hsuart", 0x70006300, "tegra-uart.3", NULL),
> +	OF_DEV_AUXDATA("nvidia,tegra20-hsuart", 0x70006400, "tegra-uart.4", NULL),

Instead, can we simply get the clocks from device tree? Prashant, how
much effort will that be once your clock patches are checked in, or is
it already part of those patches?

> @@ -106,7 +111,10 @@ struct of_dev_auxdata tegra20_auxdata_lookup[] __initdata = {
>  static __initdata struct tegra_clk_init_table tegra_dt_clk_init_table[] = {
>  	/* name		parent		rate		enabled */
>  	{ "uarta",	"pll_p",	216000000,	true },
> +	{ "uartb",	"pll_p",	216000000,	false },
> +	{ "uartc",	"pll_p",	216000000,	false },
>  	{ "uartd",	"pll_p",	216000000,	true },
> +	{ "uarte",	"pll_p",	216000000,	false },

Prashant's clock patches remove this table. Please work with him to work
out how to deal with that.
