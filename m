From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH V3 08/20] clk: tegra: dfll: round down voltages based on
 alignment
Date: Tue, 18 Dec 2018 10:05:07 +0000
Message-ID: <1914601f-8b27-8f90-da21-5a4ae1f0de03@nvidia.com>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-9-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181218091232.23532-9-josephl@nvidia.com>
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
To: Joseph Lo <josephl@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org



On 18/12/2018 09:12, Joseph Lo wrote:
> When generating the OPP table, the voltages are round down with the
> alignment from the regulator. The alignment should be applied for
> voltages look up as well.
> 
> Based on the work of Penny Chiu <pchiu@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> *v3:
>  - fix error handling code when regulator_list_voltage returns error
> *V2:
>  - s/align_volt/align_step/
>  - s/reg_volt/reg_volt_id/
> ---
>  drivers/clk/tegra/clk-dfll.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
> index 96be522398ed..ca9a4ae0d29e 100644
> --- a/drivers/clk/tegra/clk-dfll.c
> +++ b/drivers/clk/tegra/clk-dfll.c
> @@ -804,18 +804,17 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>  static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>  {
>  	struct dev_pm_opp *opp;
> -	unsigned long uv;
> -	int i;
> +	int i, align_step;
>  
>  	opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
>  	if (IS_ERR(opp))
>  		return PTR_ERR(opp);
>  
> -	uv = dev_pm_opp_get_voltage(opp);
> +	align_step = dev_pm_opp_get_voltage(opp) / td->soc->alignment.step_uv;
>  	dev_pm_opp_put(opp);
>  
>  	for (i = td->lut_bottom; i < td->lut_size; i++) {
> -		if (td->lut_uv[i] >= uv)
> +		if ((td->lut_uv[i] / td->soc->alignment.step_uv) >= align_step)
>  			return i;
>  	}
>  
> @@ -1533,18 +1532,21 @@ static int dfll_init(struct tegra_dfll *td)
>   */
>  static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_uV,reg_volt_id, align_step;
>  
>  	if (WARN_ON(td->pmu_if == TEGRA_DFLL_PMU_PWM))
>  		return -EINVAL;
>  
> +	align_step = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
>  		reg_uV = regulator_list_voltage(td->vdd_reg, i);
>  		if (reg_uV < 0)
>  			break;
>  
> -		if (uV == reg_uV)
> +		reg_volt_id = reg_uV / td->soc->alignment.step_uv;
> +
> +		if (align_step == reg_volt_id)
>  			return i;
>  	}
>  
> @@ -1558,18 +1560,21 @@ static int find_vdd_map_entry_exact(struct tegra_dfll *td, int uV)
>   * */
>  static int find_vdd_map_entry_min(struct tegra_dfll *td, int uV)
>  {
> -	int i, n_voltages, reg_uV;
> +	int i, n_voltages, reg_uV, reg_volt_id, align_step;
>  
>  	if (WARN_ON(td->pmu_if == TEGRA_DFLL_PMU_PWM))
>  		return -EINVAL;
>  
> +	align_step = uV / td->soc->alignment.step_uv;
>  	n_voltages = regulator_count_voltages(td->vdd_reg);
>  	for (i = 0; i < n_voltages; i++) {
>  		reg_uV = regulator_list_voltage(td->vdd_reg, i);
>  		if (reg_uV < 0)
>  			break;
>  
> -		if (uV <= reg_uV)
> +		reg_volt_id = reg_uV / td->soc->alignment.step_uv;
> +
> +		if (align_step <= reg_volt_id)
>  			return i;
>  	}
>  
> 

Acked-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
