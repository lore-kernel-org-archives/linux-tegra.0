From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 16/18] soc/tegra: pmc: Configure deep sleep control
 settings
Date: Sat, 29 Jun 2019 16:02:04 +0300
Message-ID: <27fdeee4-7dbe-2562-ea11-750c6fd3b952@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-17-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1561687972-19319-17-git-send-email-skomatineni@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.06.2019 5:12, Sowjanya Komatineni пишет:
> Tegra210 and prior Tegra chips have deep sleep entry and wakeup related
> timings which are platform specific that should be configured before
> entering into deep sleep.
> 
> Below are the timing specific configurations for deep sleep entry and
> wakeup.
> - Core rail power-on stabilization timer
> - OSC clock stabilization timer after SOC rail power is stabilized.
> - Core power off time is the minimum wake delay to keep the system
>   in deep sleep state irrespective of any quick wake event.
> 
> These values depends on the discharge time of regulators and turn OFF
> time of the PMIC to allow the complete system to finish entering into
> deep sleep state.
> 
> These values vary based on the platform design and are specified
> through the device tree.
> 
> This patch has implementation to configure these timings which are must
> to have for proper deep sleep and wakeup operations.
> 
> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
> ---
>  drivers/soc/tegra/pmc.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
> index ed83c0cd09a3..7e4a8f04f4c4 100644
> --- a/drivers/soc/tegra/pmc.c
> +++ b/drivers/soc/tegra/pmc.c
> @@ -89,6 +89,8 @@
>  
>  #define PMC_CPUPWRGOOD_TIMER		0xc8
>  #define PMC_CPUPWROFF_TIMER		0xcc
> +#define PMC_COREPWRGOOD_TIMER		0x3c
> +#define PMC_COREPWROFF_TIMER		0xe0
>  
>  #define PMC_PWR_DET_VALUE		0xe4
>  
> @@ -2291,6 +2293,7 @@ static const struct tegra_pmc_regs tegra20_pmc_regs = {
>  static void tegra20_pmc_init(struct tegra_pmc *pmc)
>  {
>  	u32 value;
> +	unsigned long osc, pmu, off;

I'd write this as:

 	u32 value, osc, pmu, off;

Because "unsigned long" has the same size as u32 in this case.
