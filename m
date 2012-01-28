From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V3] regulator: tps65910: Sleep control through external
 inputs
Date: Sat, 28 Jan 2012 15:06:38 +0530
Message-ID: <4F23C1A6.3090201@nvidia.com>
References: <1327506510-15948-1-git-send-email-ldewangan@nvidia.com> <20120127170757.GD18572@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20120127170757.GD18572@opensource.wolfsonmicro.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: "lrg@ti.com" <lrg@ti.com>, "jedu@slimlogic.co.uk" <jedu@slimlogic.co.uk>, "sameo@linux.intel.com" <sameo@linux.intel.com>, "gg@slimlogic.co.uk" <gg@slimlogic.co.uk>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 27 January 2012 10:37 PM, Mark Brown wrote:
> * PGP Signed by an unknown key
>
> On Wed, Jan 25, 2012 at 09:18:30PM +0530, Laxman Dewangan wrote:
>
>> +static int tps65910_set_suspend_enable(struct regulator_dev *dev)
>> +{
>> +	struct tps65910_reg *pmic = rdev_get_drvdata(dev);
>> +	int id = rdev_get_id(dev);
>> +	/*
>> +	 * If regulator is controlled through external control then
>> +	 * it can be enable/disable by toggling external signal.
>> +	 */
>> +	if (pmic->board_ext_control[id])
>> +		return 0;
>> +	else
>> +		return tps65910_set_mode(dev, REGULATOR_MODE_NORMAL);
>> +}
> I'm really confuseed now.  This definitely looks like it's doing the
> wrong thing for the non-ext_control case, it's setting the mode which
> really isn't what this is supposed to do and collides with any actual
> configuration of the mode that might happen...
>
So in non-ext control modes, should it return with doing nothing? And 
for ext-control case, should it do reverse of disable?

>> +	/*
>> +	 * Keep the regulator in OFF state if it needs to be disable
>> +	 * in suspend state.
>> +	 */
>> +	if (pmic->board_ext_control[id]) {
>> +		u8 regoffs = (pmic->ext_sleep_control[id]>>  8)&  0xFF;
>> +		u8 bit_pos = (1<<  pmic->ext_sleep_control[id]&  0xFF);
>> +		int ret;
>> +		ret = tps65910_clear_bits(mfd,
>> +			TPS65910_SLEEP_KEEP_LDO_ON + regoffs, bit_pos);
>> +		if (!ret)
>> +			ret = tps65910_set_bits(mfd,
>> +				TPS65910_SLEEP_SET_LDO_OFF + regoffs, bit_pos);
>> +		if (ret<  0)
>> +			dev_err(mfd->dev,
>> +				"Error in configuring SLEEP register\n");
> ...and I'd really expect something that reverses these changes?
I though following case:
non-ext control:
     If suspend-enable is selected then it will be in NORMAL mode, if 
suspend-disable is selected then it should be in OFF state and if there 
is suspend modes then it will select accordingly. The enable or disable 
with modes can come with regulator suspend states through reg_init data.
If regulator goes into suspend and configure different modes for suspend 
mode then in resume path, the regulator should be enabled (if before 
suspend it was enabled and set to mode which was there before suspend). 
I just saw the code in core driver for enabling the regulator again but 
not for re-setting the mode.

in ext control case:
In ext control mode, the regulator is controlled from external signal 
and hence it can set on full power/low power /off states based on 
external control i.e.ext control high then it is full power mode, low 
then based on configuration, it can set to low power or off.
And hence I implemented suspend-enable for do nothing, suspend-disable 
for complete off and suspend mode for setting modes for low power.

> The actual bits setting up the ext_control look OK - can you split those
> off from the bits implementing the suspend mode callbacks please so they
> can be applied while the callbacks are reviewed?
>
Yes, this will be easy to review also. I will split the change in two 
parts, one for external control configuration and other for suspend modes.
Based on above discussion/comment I will send the suspend mode support.

> * Unknown Key
> * 0x6E30FDDD
