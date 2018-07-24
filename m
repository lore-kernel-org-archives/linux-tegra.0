From: Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH 2/2 v2] Add support for CPCAP regulators on Tegra devices.
Date: Mon, 23 Jul 2018 21:57:24 -0400
Message-ID: <e59e552c-fabb-0251-05b5-2361bf273232@gmail.com>
References: <20180723193848.32491-1-pgwipeout@gmail.com>
 <20180723193848.32491-3-pgwipeout@gmail.com> <4588004.Gnq6nbUl2V@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <4588004.Gnq6nbUl2V@dimapc>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: broonie@kernel.org, lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org



On 07/23/2018 08:27 PM, Dmitry Osipenko wrote:
> On Monday, 23 July 2018 22:38:48 MSK Peter Geis wrote:
>> Added support for the CPCAP power management regulator functions on
>> Tegra devices.
>> Added sw2_sw4 value tables, which provide power to the Tegra core and
>> aux devices.
>> Added the Tegra init tables and device tree compatibility match.
>>
>> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
>> ---
>>   .../bindings/regulator/cpcap-regulator.txt    |  1 +
>>   drivers/regulator/cpcap-regulator.c           | 80 +++++++++++++++++++
>>   2 files changed, 81 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
>> b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt index
>> 675f4437ce92..3e2d33ab1731 100644
>> --- a/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
>> +++ b/Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
>> @@ -4,6 +4,7 @@ Motorola CPCAP PMIC voltage regulators
>>   Requires node properties:
>>   - "compatible" value one of:
>>       "motorola,cpcap-regulator"
>> +    "motorola,tegra-cpcap-regulator"
>>       "motorola,mapphone-cpcap-regulator"
>>
>>   Required regulator properties:
>> diff --git a/drivers/regulator/cpcap-regulator.c
>> b/drivers/regulator/cpcap-regulator.c index c0b1e04bd90f..cb3774be445d
>> 100644
>> --- a/drivers/regulator/cpcap-regulator.c
>> +++ b/drivers/regulator/cpcap-regulator.c
>> @@ -412,6 +412,82 @@ static struct cpcap_regulator omap4_regulators[] = {
>>   	{ /* sentinel */ },
>>   };
>>
>> +static struct cpcap_regulator tegra_regulators[] = {
>> +	CPCAP_REG(SW1, CPCAP_REG_S1C1, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_SW1_SEL, unknown_val_tbl,
>> +		  0, 0, 0, 0, 0, 0),
>> +	CPCAP_REG(SW2, CPCAP_REG_S2C1, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_SW2_SEL, sw2_sw4_val_tbl,
>> +		  0xf00, 0x7f, 0, 0x800, 0, 120),
>> +	CPCAP_REG(SW3, CPCAP_REG_S3C, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_SW3_SEL, unknown_val_tbl,
>> +		  0, 0, 0, 0, 0, 0),
>> +	CPCAP_REG(SW4, CPCAP_REG_S4C1, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_SW4_SEL, sw2_sw4_val_tbl,
>> +		  0xf00, 0x7f, 0, 0x900, 0, 100),
>> +	CPCAP_REG(SW5, CPCAP_REG_S5C, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_SW5_SEL, sw5_val_tbl,
>> +		  0x2a, 0, 0, 0x22, 0, 0),
>> +	CPCAP_REG(SW6, CPCAP_REG_S6C, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_SW6_SEL, unknown_val_tbl,
>> +		  0, 0, 0, 0, 0, 0),
>> +	CPCAP_REG(VCAM, CPCAP_REG_VCAMC, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_VCAM_SEL, vcam_val_tbl,
>> +		  0x87, 0x30, 4, 0x7, 0, 420),
>> +	CPCAP_REG(VCSI, CPCAP_REG_VCSIC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VCSI_SEL, vcsi_val_tbl,
>> +		  0x47, 0x10, 4, 0x7, 0, 350),
>> +	CPCAP_REG(VDAC, CPCAP_REG_VDACC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VDAC_SEL, vdac_val_tbl,
>> +		  0x87, 0x30, 4, 0x3, 0, 420),
>> +	CPCAP_REG(VDIG, CPCAP_REG_VDIGC, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_VDIG_SEL, vdig_val_tbl,
>> +		  0x87, 0x30, 4, 0x5, 0, 420),
>> +	CPCAP_REG(VFUSE, CPCAP_REG_VFUSEC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VFUSE_SEL, vfuse_val_tbl,
>> +		  0x80, 0xf, 0, 0x80, 0, 420),
>> +	CPCAP_REG(VHVIO, CPCAP_REG_VHVIOC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VHVIO_SEL, vhvio_val_tbl,
>> +		  0x17, 0, 0, 0x2, 0, 0),
>> +	CPCAP_REG(VSDIO, CPCAP_REG_VSDIOC, CPCAP_REG_ASSIGN2,
>> +		  CPCAP_BIT_VSDIO_SEL, vsdio_val_tbl,
>> +		  0x87, 0x38, 3, 0x2, 0, 420),
>> +	CPCAP_REG(VPLL, CPCAP_REG_VPLLC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VPLL_SEL, vpll_val_tbl,
>> +		  0x43, 0x18, 3, 0x1, 0, 420),
>> +	CPCAP_REG(VRF1, CPCAP_REG_VRF1C, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VRF1_SEL, vrf1_val_tbl,
>> +		  0xac, 0x2, 1, 0xc, 0, 10),
>> +	CPCAP_REG(VRF2, CPCAP_REG_VRF2C, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VRF2_SEL, vrf2_val_tbl,
>> +		  0x23, 0x8, 3, 0x3, 0, 10),
>> +	CPCAP_REG(VRFREF, CPCAP_REG_VRFREFC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VRFREF_SEL, vrfref_val_tbl,
>> +		  0x23, 0x8, 3, 0x3, 0, 420),
>> +	CPCAP_REG(VWLAN1, CPCAP_REG_VWLAN1C, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VWLAN1_SEL, vwlan1_val_tbl,
>> +		  0x47, 0x10, 4, 0x5, 0, 420),
>> +	CPCAP_REG(VWLAN2, CPCAP_REG_VWLAN2C, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VWLAN2_SEL, vwlan2_val_tbl,
>> +		  0x20c, 0xc0, 6, 0x8, 0, 420),
>> +	CPCAP_REG(VSIM, CPCAP_REG_VSIMC, CPCAP_REG_ASSIGN3,
>> +		  0xffff, vsim_val_tbl,
>> +		  0x23, 0x8, 3, 0x3, 0, 420),
>> +	CPCAP_REG(VSIMCARD, CPCAP_REG_VSIMC, CPCAP_REG_ASSIGN3,
>> +		  0xffff, vsimcard_val_tbl,
>> +		  0x1e80, 0x8, 3, 0x1e00, 0, 420),
>> +	CPCAP_REG(VVIB, CPCAP_REG_VVIBC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VVIB_SEL, vvib_val_tbl,
>> +		  0x1, 0xc, 2, 0, 0x1, 500),
>> +	CPCAP_REG(VUSB, CPCAP_REG_VUSBC, CPCAP_REG_ASSIGN3,
>> +		  CPCAP_BIT_VUSB_SEL, vusb_val_tbl,
>> +		  0x11c, 0x40, 6, 0xc, 0, 0),
>> +	CPCAP_REG(VAUDIO, CPCAP_REG_VAUDIOC, CPCAP_REG_ASSIGN4,
>> +		  CPCAP_BIT_VAUDIO_SEL, vaudio_val_tbl,
>> +		  0x16, 0x1, 0, 0x4, 0, 0),
>> +	{ /* sentinel */ },
>> +};
>> +
>>   static const struct of_device_id cpcap_regulator_id_table[] = {
>>   	{
>>   		.compatible = "motorola,cpcap-regulator",
>> @@ -420,6 +496,10 @@ static const struct of_device_id
>> cpcap_regulator_id_table[] = { .compatible =
>> "motorola,mapphone-cpcap-regulator",
>>   		.data = omap4_regulators,
>>   	},
>> +	{
>> +		.compatible = "motorola,tegra-cpcap-regulator",
>> +		.data = tegra_regulators,
>> +	},
>>   	{},
>>   };
>>   MODULE_DEVICE_TABLE(of, cpcap_regulator_id_table);
> 
> Are those cpcap_regulator values really common for all Tegra's? Probably
> better to name the DT compatible like "motorola,xoom-cpcap-regulator" or
> "motorola,mz602-cpcap-regulator".
> 
> The DT binding documentation should be updated with the new compatible value
> in the Documentation/devicetree/bindings/regulator/cpcap-regulator.txt
> 

I see your point, from my research the only other device that ever 
paired a Tegra with a cpcap was the Atrix 4g, and it has completely 
different values.
For now I will change the value to "motorola,xoom-cpcap-regulator", 
since these values are common across the entire Xoom line.
The DT binding documentation was updated as part of this patch, it will 
be adjusted to the new value.
