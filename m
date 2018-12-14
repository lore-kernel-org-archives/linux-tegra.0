From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V2 07/21] clk: tegra: dfll: support PWM regulator control
Date: Fri, 14 Dec 2018 15:11:28 +0800
Message-ID: <cba91bef-db11-5dde-a85a-a5edfc6e6d92@nvidia.com>
References: <20181213093438.29621-1-josephl@nvidia.com>
 <20181213093438.29621-8-josephl@nvidia.com>
 <42e5746b-8484-8c2d-f871-5ad17e576f32@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <42e5746b-8484-8c2d-f871-5ad17e576f32@nvidia.com>
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
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 12/13/18 7:41 PM, Jon Hunter wrote:
> 
> On 13/12/2018 09:34, Joseph Lo wrote:
>> The DFLL hardware supports two modes (I2C and PWM) for voltage control
>> when requesting a frequency. In this patch, we introduce PWM mode support.
>>
>> To support that, we re-organize the LUT for unifying the table for both
>> cases of I2C and PWM mode. And generate that based on regulator info.
>> For the PWM-based regulator, we get this info from DT. And do the same as
>> the case of I2C LUT, which can help to map the PMIC voltage ID and voltages
>> that the regulator supported.
>>
>> The other parts are the support code for initializing the DFLL hardware
>> to support PWM mode. Also, the register debugfs file is slightly
>> reworked to only show the i2c registers when I2C mode is in use.
>>
>> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
>>
>> Signed-off-by: Joseph Lo <josephl@nvidia.com>
>> ---
>> *V2:
>>   - move reg_init_uV to be with the PWM related variables
>>   - fix the variable type to 'unsigned long' if it needs to catch the
>>   return value from 'dev_pm_opp_get_voltage'
>>   - update to use lut_uv table for LUT look up. This makes the generic
>>   lut_uv table to work with both PWM and I2C mode.
>> ---
>>   drivers/clk/tegra/clk-dfll.c | 435 +++++++++++++++++++++++++++++------
>>   1 file changed, 369 insertions(+), 66 deletions(-)

snip.

>> @@ -594,24 +750,41 @@ static void dfll_init_out_if(struct tegra_dfll *td)
>>   {
>>   	u32 val;
>>   
>> -	td->lut_min = 0;
>> -	td->lut_max = td->i2c_lut_size - 1;
>> -	td->lut_safe = td->lut_min + 1;
>> +	td->lut_min = td->lut_bottom;
>> +	td->lut_max = td->lut_size - 1;
>> +	td->lut_safe = td->lut_min + (td->lut_min < td->lut_max ? 1 : 0);
>> +
>> +	/* clear DFLL_OUTPUT_CFG before setting new value */
>> +	dfll_writel(td, 0, DFLL_OUTPUT_CFG);
>> +	dfll_wmb(td);
>>   
>> -	dfll_i2c_writel(td, 0, DFLL_OUTPUT_CFG);
>>   	val = (td->lut_safe << DFLL_OUTPUT_CFG_SAFE_SHIFT) |
>> -		(td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
>> -		(td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
>> -	dfll_i2c_writel(td, val, DFLL_OUTPUT_CFG);
>> -	dfll_i2c_wmb(td);
>> +	      (td->lut_max << DFLL_OUTPUT_CFG_MAX_SHIFT) |
>> +	      (td->lut_min << DFLL_OUTPUT_CFG_MIN_SHIFT);
>> +	dfll_writel(td, val, DFLL_OUTPUT_CFG);
>> +	dfll_wmb(td);
>>   
>>   	dfll_writel(td, 0, DFLL_OUTPUT_FORCE);
>>   	dfll_i2c_writel(td, 0, DFLL_INTR_EN);
>>   	dfll_i2c_writel(td, DFLL_INTR_MAX_MASK | DFLL_INTR_MIN_MASK,
>>   			DFLL_INTR_STS);
>>   
>> -	dfll_load_i2c_lut(td);
>> -	dfll_init_i2c_if(td);
>> +	if (td->pmu_if == TEGRA_DFLL_PMU_PWM) {
>> +		int vinit = td->reg_init_uV;
> 
> This should be u32.
> 
>> +		int vstep = td->soc->alignment.step_uv;
>> +		int vmin = td->lut_uv[0];
> 
> This should be unsigned long.
> 
>> +
>> +		/* set initial voltage */
>> +		if ((vinit >= vmin) && vstep) {
>> +			unsigned int vsel;
>> +
>> +			vsel = DIV_ROUND_UP((vinit - vmin), vstep);
>> +			dfll_force_output(td, vsel);
>> +		}
>> +	} else {
>> +		dfll_load_i2c_lut(td);
>> +		dfll_init_i2c_if(td);
>> +	}
>>   }
>>   
>>   /*
>> @@ -640,8 +813,8 @@ static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>>   	uv = dev_pm_opp_get_voltage(opp);
>>   	dev_pm_opp_put(opp);
>>   
>> -	for (i = 0; i < td->i2c_lut_size; i++) {
>> -		if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) == uv)
>> +	for (i = td->lut_bottom; i < td->lut_size; i++) {
>> +		if (td->lut_uv[i] >= uv)
> 
> I think that we need to fix the type for 'uv' in this function while we
> are at it.

Okay, looks like I still have some variable type issue in V2. Will fix 
accordingly.

Thanks,
Joseph

> 
> Cheers
> Jon
> 
