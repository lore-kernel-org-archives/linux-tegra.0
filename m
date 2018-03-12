From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v3 09/11] cpufreq: tegra124-cpufreq: extend to support
 Tegra210
Date: Mon, 12 Mar 2018 12:15:22 +0000
Message-ID: <85edea04-6aaf-3609-1da9-0d542ac98e7d@nvidia.com>
References: <1517934852-23255-1-git-send-email-pdeschrijver@nvidia.com>
 <1517934852-23255-10-git-send-email-pdeschrijver@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1517934852-23255-10-git-send-email-pdeschrijver@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org, mark.rutland@arm.com, devicetree@vger.kernel.org, lgirdwood@gmail.com, broonie@kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 06/02/18 16:34, Peter De Schrijver wrote:
> Tegra210 has a very similar CPU clocking scheme than Tegra124. So add
> support in this driver. Also allow for the case where the CPU voltage is
> controlled directly by the DFLL rather than by a separate regulator object.
> 
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---
>  drivers/cpufreq/tegra124-cpufreq.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/cpufreq/tegra124-cpufreq.c b/drivers/cpufreq/tegra124-cpufreq.c
> index 4353025..f8e01a8 100644
> --- a/drivers/cpufreq/tegra124-cpufreq.c
> +++ b/drivers/cpufreq/tegra124-cpufreq.c
> @@ -64,7 +64,8 @@ static void tegra124_cpu_switch_to_pllx(struct tegra124_cpufreq_priv *priv)
>  {
>  	clk_set_parent(priv->cpu_clk, priv->pllp_clk);
>  	clk_disable_unprepare(priv->dfll_clk);
> -	regulator_sync_voltage(priv->vdd_cpu_reg);
> +	if (priv->vdd_cpu_reg)
> +		regulator_sync_voltage(priv->vdd_cpu_reg);
>  	clk_set_parent(priv->cpu_clk, priv->pllx_clk);
>  }

OK, so this bit does not make sense to me. In the above we are switching
from the DFLL to the PLL (ie. disabling the DFLL) and so to ensure we
are operating at the correct voltage after disabling the DFLL we need to
sync the voltage. Seems we would need to do this for all devices, no?
How is the different between Tegra124 and Tegra210?

Cheers
Jon

-- 
nvpublic
