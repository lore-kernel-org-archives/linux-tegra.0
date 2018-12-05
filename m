From: Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH 07/19] clk: tegra: dfll: support PWM regulator control
Date: Wed, 5 Dec 2018 14:14:24 +0800
Message-ID: <2ccd2fc0-64a6-95b8-05ad-feadd8e1e1c1@nvidia.com>
References: <20181204092548.3038-1-josephl@nvidia.com>
 <20181204092548.3038-8-josephl@nvidia.com>
 <20181204155351.GD26056@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20181204155351.GD26056@pdeschrijver-desktop.Nvidia.com>
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
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Jonathan Hunter <jonathanh@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On 12/4/18 11:53 PM, Peter De Schrijver wrote:
> On Tue, Dec 04, 2018 at 05:25:36PM +0800, Joseph Lo wrote:
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
snip
>>   
>>   /*
>> @@ -640,8 +813,8 @@ static int find_lut_index_for_rate(struct tegra_dfll *td, unsigned long rate)
>>   	uv = dev_pm_opp_get_voltage(opp);
>>   	dev_pm_opp_put(opp);
>>   
>> -	for (i = 0; i < td->i2c_lut_size; i++) {
>> -		if (regulator_list_voltage(td->vdd_reg, td->i2c_lut[i]) == uv)
>> +	for (i = td->lut_bottom; i < td->lut_size; i++) {
>> +		if (regulator_list_voltage(td->vdd_reg, td->lut[i]) == uv)
> 
> Use td->lut_uv[] here, so it will also work for PWM regulators. Also
> change == to >= because the exact OPP voltage may not be available. In
> the next patch the rounding can then be fixed.
> 
Okay, make sense to me. Will fix it.

Thanks,
Joseph
