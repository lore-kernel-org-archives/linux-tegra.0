From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 07/19] clk: tegra: dfll: support PWM regulator control
Date: Tue, 11 Dec 2018 14:37:16 +0800
Message-ID: <c92940a1-23a1-852e-72d5-7b8c7bcb948f@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-8-josephl@nvidia.com>
 <3d0f52c6-770e-bae2-2396-87f32455b807@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <3d0f52c6-770e-bae2-2396-87f32455b807@nvidia.com>
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

On 12/7/18 11:09 PM, Jon Hunter wrote:
> 
> On 04/12/2018 09:25, Joseph Lo wrote:
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
>>   drivers/clk/tegra/clk-dfll.c | 431 ++++++++++++++++++++++++++++++-----
>>   1 file changed, 368 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/clk/tegra/clk-dfll.c b/drivers/clk/tegra/clk-dfll.c
>> index 609e363dabf8..c294a2989f31 100644
>> --- a/drivers/clk/tegra/clk-dfll.c
>> +++ b/drivers/clk/tegra/clk-dfll.c
>> @@ -1,7 +1,7 @@
>>   /*
>>    * clk-dfll.c - Tegra DFLL clock source common code
>>    *
>> - * Copyright (C) 2012-2014 NVIDIA Corporation. All rights reserved.
>> + * Copyright (C) 2012-2018 NVIDIA Corporation. All rights reserved.
>>    *
>>    * Aleksandr Frid <afrid@nvidia.com>
>>    * Paul Walmsley <pwalmsley@nvidia.com>
>> @@ -47,6 +47,7 @@
>>   #include <linux/kernel.h>
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>> +#include <linux/pinctrl/consumer.h>
>>   #include <linux/pm_opp.h>
>>   #include <linux/pm_runtime.h>
>>   #include <linux/regmap.h>
>> @@ -243,6 +244,12 @@ enum dfll_tune_range {
>>   	DFLL_TUNE_LOW = 1,
>>   };
>>   
>> +
>> +enum tegra_dfll_pmu_if {
>> +	TEGRA_DFLL_PMU_I2C = 0,
>> +	TEGRA_DFLL_PMU_PWM = 1,
>> +};
>> +
>>   /**
>>    * struct dfll_rate_req - target DFLL rate request data
>>    * @rate: target frequency, after the postscaling
>> @@ -294,16 +301,25 @@ struct tegra_dfll {
>>   	u32				ci;
>>   	u32				cg;
>>   	bool				cg_scale;
>> +	u32				reg_init_uV;
>>   
>>   	/* I2C interface parameters */
>>   	u32				i2c_fs_rate;
>>   	u32				i2c_reg;
>>   	u32				i2c_slave_addr;
>>   
>> -	/* i2c_lut array entries are regulator framework selectors */
>> -	unsigned			i2c_lut[MAX_DFLL_VOLTAGES];
>> -	int				i2c_lut_size;
>> -	u8				lut_min, lut_max, lut_safe;
>> +	/* lut array entries are regulator framework selectors or PWM values*/
>> +	unsigned			lut[MAX_DFLL_VOLTAGES];
>> +	unsigned			lut_uv[MAX_DFLL_VOLTAGES];
>> +	int				lut_size;
>> +	u8				lut_bottom, lut_min, lut_max, lut_safe;
>> +
>> +	/* PWM interface */
>> +	enum tegra_dfll_pmu_if		pmu_if;
>> +	unsigned long			pwm_rate;
>> +	struct pinctrl			*pwm_pin;
>> +	struct pinctrl_state		*pwm_enable_state;
>> +	struct pinctrl_state		*pwm_disable_state;
>>   };
>>   
>>   #define clk_hw_to_dfll(_hw) container_of(_hw, struct tegra_dfll, dfll_clk_hw)
>> @@ -489,6 +505,34 @@ static void dfll_set_mode(struct tegra_dfll *td,
>>   	dfll_wmb(td);
>>   }
>>   
>> +/*
>> + * DVCO rate control
>> + */
>> +
>> +static unsigned long get_dvco_rate_below(struct tegra_dfll *td, u8 out_min)
>> +{
>> +	struct dev_pm_opp *opp;
>> +	unsigned long rate, prev_rate;
>> +	int uv, min_uv;
>> +
>> +	min_uv = td->lut_uv[out_min];
>> +	for (rate = 0, prev_rate = 0; ; rate++) {
>> +		opp = dev_pm_opp_find_freq_ceil(td->soc->dev, &rate);
>> +		if (IS_ERR(opp))
>> +			break;
>> +
>> +		uv = dev_pm_opp_get_voltage(opp);
> 
> Can you fix the type of 'uv' here? It should be unsigned long.

Okay, will fix it. Thanks.
