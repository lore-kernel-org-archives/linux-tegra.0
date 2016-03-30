From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra boots failing due to as3722 I/O errors
Date: Wed, 30 Mar 2016 14:15:16 +0100
Message-ID: <56FBD164.7040707@nvidia.com>
References: <20160329190319.GE2350@sirena.org.uk>
 <56FBB923.4000302@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <56FBB923.4000302-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "Maciej S. Szmigiero" <mail-APzI5cXaD1zVlRWJc41N0YvC60bnQu0Y@public.gmane.org>, Lee Jones <lee.jones-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

On 30/03/16 12:31, Jon Hunter wrote:
> On 29/03/16 20:03, Mark Brown wrote:
>> * PGP Signed by an unknown key
>>
>> Hi,
>>
>> Currently the Jetson TK1 is failing to get regulators for MMC with at
>> least my regulator tree and probably -next also due to:
>>
>> [    1.665750] as3722 4-0040: AS3722 with revision 0x1 found
>> [    1.682945] +VDDIO_SDMMC3: failed to get the current voltage(-22)
>> [    1.689135] as3722-regulator as3722-regulator: regulator 13 register failed -22
>> [    1.697593] as3722-regulator: probe of as3722-regulator failed with error -22
>>
>> The get voltage operation here is just a simple mapping of a bitfield in
>> the regmap which suggests that the underlying problem is somewhere
>> further down the stack like the MFD or I2C drivers.  The error is
>> -EINVAL which suggests something like the register not being marked as
>> readable but the _VOLTAGE_REG registers appear to be marked as readable
>> in the MFD.
>>
>> Full log for one boot at:
>>
>>   https://storage.kernelci.org/broonie-regulator/v4.6-rc1-24-ga7e614dd1f91/arm-multi_v7_defconfig+CONFIG_SMP=n/lab-mhart/boot-tegra124-jetson-tk1.html
> 
> Thanks for the report. I took a quick look at this and it turns out
> that i2c and regmap are all working fine. The problem is the
> VDDIO_SDMMC3 LDO (aka. LDO6) on the as3722 has a bypass mode which is
> not represented by the voltage ranges for the LDO. On boot the LDO is
> in bypass and returns a value which is not recognised and hence an
> EINVAL is returned. The following change fixes the problem. The 0x3F
> value represents the bypass mode. I will send out a formal patch.
> 
> Cheers
> Jon
> 
> diff --git a/drivers/regulator/as3722-regulator.c b/drivers/regulator/as3722-regulator.c
> index 8b046ee..f16d0e5 100644
> --- a/drivers/regulator/as3722-regulator.c
> +++ b/drivers/regulator/as3722-regulator.c
> @@ -438,6 +438,13 @@ static const struct regulator_linear_range as3722_ldo_ranges[] = {
>         REGULATOR_LINEAR_RANGE(1725000, 0x40, 0x7F, 25000),
>  };
>  
> +static const struct regulator_linear_range as3722_ldo6_ranges[] = {
> +       REGULATOR_LINEAR_RANGE(0, 0x00, 0x00, 0),
> +       REGULATOR_LINEAR_RANGE(825000, 0x01, 0x24, 25000),
> +       REGULATOR_LINEAR_RANGE(3300000, 0x3F, 0x3F, 0),
> +       REGULATOR_LINEAR_RANGE(1725000, 0x40, 0x7F, 25000),
> +};
> +
>  static struct regulator_ops as3722_ldo_ops = {
>         .is_enabled = regulator_is_enabled_regmap,
>         .enable = regulator_enable_regmap,
> @@ -863,6 +870,16 @@ static int as3722_regulator_probe(struct platform_device *pdev)
>                         as3722_regs->desc[id].n_linear_ranges =
>                                         ARRAY_SIZE(as3722_sd2345_ranges);
>                         break;
> +               case AS3722_REGULATOR_ID_LDO6:
> +                       if (reg_config->ext_control)
> +                               ops = &as3722_ldo_extcntrl_ops;
> +                       else
> +                               ops = &as3722_ldo_ops;
> +                       as3722_regs->desc[id].enable_time = 500;
> +                       as3722_regs->desc[id].linear_ranges = as3722_ldo6_ranges;
> +                       as3722_regs->desc[id].n_linear_ranges =
> +                                               ARRAY_SIZE(as3722_ldo6_ranges);
> +                       break;
>                 default:
>                         if (reg_config->ext_control)
>                                 ops = &as3722_ldo_extcntrl_ops;

On second thoughts, is this the correct way to fix this? I see that
there are some operators defined for get/set_bypass for a regulator and
these are not specified for LDO6 either. However, even if they were I
don't believe this will fix the problem alone.

The failure is caused by _regulator_get_voltage() returning an error.
This function does not check if the regulator is bypassed, but I am
wondering if it should and then return the bypass voltage?

Cheers
Jon
